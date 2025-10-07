-- ================================================================
-- СХЕМА БАЗЫ ДАННЫХ ИНТЕРНЕТ-МАГАЗИНА ДЛЯ МАРКЕТИНГОВЫХ МЕТРИК
-- ================================================================
-- Эта схема поддерживает расчет:
-- CPM, CPC, CTR, CAC, ROMI, DAU/MAU, Фактор липкости, ARPU/ARPPU, LTV_30d
-- ================================================================

-- Удаляем таблицы если существуют (для чистого пересоздания)
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS user_sessions CASCADE;
DROP TABLE IF EXISTS campaign_clicks CASCADE;
DROP TABLE IF EXISTS campaigns CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- ================================================================
-- ТАБЛИЦА ПОЛЬЗОВАТЕЛЕЙ
-- ================================================================
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL,
    acquisition_channel VARCHAR(50) NOT NULL, -- органический, платный_поиск, соцсети, email, и т.д.
    country VARCHAR(50) NOT NULL,
    city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================
-- ТАБЛИЦА ТОВАРОВ
-- ================================================================
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    cost DECIMAL(10,2) NOT NULL, -- Для расчетов ROMI
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================
-- ТАБЛИЦА КАМПАНИЙ (для рекламных метрик)
-- ================================================================
CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(255) NOT NULL,
    campaign_type VARCHAR(50) NOT NULL, -- display, search, social, email
    start_date DATE NOT NULL,
    end_date DATE,
    total_spend DECIMAL(12,2) NOT NULL,
    impressions INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================
-- ТАБЛИЦА КЛИКОВ ПО КАМПАНИЯМ (для расчетов CTR, CPC)
-- ================================================================
CREATE TABLE campaign_clicks (
    click_id SERIAL PRIMARY KEY,
    campaign_id INTEGER REFERENCES campaigns(campaign_id),
    user_id INTEGER REFERENCES users(user_id),
    click_timestamp TIMESTAMP NOT NULL,
    cost_per_click DECIMAL(8,4), -- Фактическая стоимость этого клика
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================
-- ТАБЛИЦА ПОЛЬЗОВАТЕЛЬСКИХ СЕССИЙ (для DAU/MAU, Фактор липкости)
-- ================================================================
CREATE TABLE user_sessions (
    session_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    session_start TIMESTAMP NOT NULL,
    session_end TIMESTAMP,
    session_date DATE NOT NULL,
    pages_viewed INTEGER DEFAULT 1,
    session_duration_minutes INTEGER,
    device_type VARCHAR(50), -- mobile, desktop, tablet
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================
-- ТАБЛИЦА ЗАКАЗОВ
-- ================================================================
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    order_date DATE NOT NULL,
    order_timestamp TIMESTAMP NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'completed', -- completed, cancelled, refunded
    campaign_id INTEGER REFERENCES campaigns(campaign_id), -- Атрибуция
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================
-- ТАБЛИЦА ПОЗИЦИЙ ЗАКАЗОВ
-- ================================================================
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(12,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================
-- ПРОВЕРКА СХЕМЫ
-- ================================================================
SELECT 
    table_name,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_schema = 'public' 
    AND table_name IN ('users', 'products', 'campaigns', 'campaign_clicks', 
                       'user_sessions', 'orders', 'order_items')
ORDER BY table_name, ordinal_position;
