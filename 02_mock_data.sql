-- ================================================================
-- ТЕСТОВЫЕ ДАННЫЕ ДЛЯ МАРКЕТИНГОВЫХ МЕТРИК ИНТЕРНЕТ-МАГАЗИНА
-- ================================================================
-- Этот скрипт генерирует реалистичные данные за 3-месячный период
-- для демонстрации различных маркетинговых и продуктовых метрик
-- ================================================================

-- ================================================================
-- ВСТАВКА ДАННЫХ ПОЛЬЗОВАТЕЛЕЙ (50 пользователей за 3 месяца)
-- ================================================================
INSERT INTO users (email, first_name, last_name, registration_date, acquisition_channel, country, city) VALUES
-- Регистрации в январе 2024
('user001@email.com', 'John', 'Smith', '2024-01-05', 'organic', 'USA', 'New York'),
('user002@email.com', 'Sarah', 'Johnson', '2024-01-05', 'paid_search', 'USA', 'Los Angeles'),
('user003@email.com', 'Michael', 'Brown', '2024-01-06', 'social', 'UK', 'London'),
('user004@email.com', 'Emily', 'Davis', '2024-01-07', 'email', 'Canada', 'Toronto'),
('user005@email.com', 'David', 'Wilson', '2024-01-08', 'organic', 'USA', 'Chicago'),
('user006@email.com', 'Lisa', 'Anderson', '2024-01-09', 'paid_search', 'Germany', 'Berlin'),
('user007@email.com', 'Robert', 'Taylor', '2024-01-10', 'social', 'France', 'Paris'),
('user008@email.com', 'Jennifer', 'Martinez', '2024-01-11', 'organic', 'USA', 'Houston'),
('user009@email.com', 'Christopher', 'Garcia', '2024-01-12', 'email', 'Spain', 'Madrid'),
('user010@email.com', 'Amanda', 'Rodriguez', '2024-01-13', 'paid_search', 'USA', 'Phoenix'),
('user011@email.com', 'James', 'Lee', '2024-01-14', 'organic', 'Australia', 'Sydney'),
('user012@email.com', 'Michelle', 'White', '2024-01-15', 'social', 'USA', 'Philadelphia'),
('user013@email.com', 'Daniel', 'Harris', '2024-01-16', 'paid_search', 'Netherlands', 'Amsterdam'),
('user014@email.com', 'Jessica', 'Clark', '2024-01-17', 'email', 'USA', 'San Antonio'),
('user015@email.com', 'Matthew', 'Lewis', '2024-01-18', 'organic', 'Italy', 'Rome'),
('user016@email.com', 'Ashley', 'Robinson', '2024-01-19', 'social', 'USA', 'San Diego'),
('user017@email.com', 'Joshua', 'Walker', '2024-01-20', 'paid_search', 'USA', 'Dallas'),
('user018@email.com', 'Stephanie', 'Perez', '2024-01-21', 'organic', 'Brazil', 'São Paulo'),
('user019@email.com', 'Andrew', 'Hall', '2024-01-22', 'email', 'USA', 'San Jose'),
('user020@email.com', 'Nicole', 'Young', '2024-01-23', 'social', 'Japan', 'Tokyo'),

-- Регистрации в феврале 2024
('user021@email.com', 'Kevin', 'Allen', '2024-02-01', 'organic', 'USA', 'Austin'),
('user022@email.com', 'Rachel', 'King', '2024-02-02', 'paid_search', 'USA', 'Jacksonville'),
('user023@email.com', 'Steven', 'Wright', '2024-02-03', 'social', 'South Korea', 'Seoul'),
('user024@email.com', 'Lauren', 'Lopez', '2024-02-04', 'email', 'USA', 'Fort Worth'),
('user025@email.com', 'Ryan', 'Hill', '2024-02-05', 'organic', 'Mexico', 'Mexico City'),
('user026@email.com', 'Kimberly', 'Scott', '2024-02-06', 'paid_search', 'USA', 'Columbus'),
('user027@email.com', 'Thomas', 'Green', '2024-02-07', 'social', 'India', 'Mumbai'),
('user028@email.com', 'Heather', 'Baker', '2024-02-08', 'organic', 'USA', 'Charlotte'),
('user029@email.com', 'Jason', 'Adams', '2024-02-09', 'email', 'Argentina', 'Buenos Aires'),
('user030@email.com', 'Melissa', 'Nelson', '2024-02-10', 'paid_search', 'USA', 'San Francisco'),
('user031@email.com', 'Eric', 'Carter', '2024-02-11', 'organic', 'Russia', 'Moscow'),
('user032@email.com', 'Angela', 'Mitchell', '2024-02-12', 'social', 'USA', 'Indianapolis'),
('user033@email.com', 'Brian', 'Roberts', '2024-02-13', 'paid_search', 'China', 'Beijing'),
('user034@email.com', 'Christine', 'Turner', '2024-02-14', 'email', 'USA', 'Seattle'),
('user035@email.com', 'Mark', 'Phillips', '2024-02-15', 'organic', 'Turkey', 'Istanbul'),
('user036@email.com', 'Tiffany', 'Campbell', '2024-02-16', 'social', 'USA', 'Denver'),
('user037@email.com', 'Jeffrey', 'Parker', '2024-02-17', 'paid_search', 'Egypt', 'Cairo'),
('user038@email.com', 'Rebecca', 'Evans', '2024-02-18', 'organic', 'USA', 'Washington'),
('user039@email.com', 'Timothy', 'Edwards', '2024-02-19', 'email', 'Thailand', 'Bangkok'),
('user040@email.com', 'Laura', 'Collins', '2024-02-20', 'social', 'USA', 'Boston'),

-- Регистрации в марте 2024  
('user041@email.com', 'Donald', 'Stewart', '2024-03-01', 'organic', 'USA', 'El Paso'),
('user042@email.com', 'Megan', 'Sanchez', '2024-03-02', 'paid_search', 'USA', 'Detroit'),
('user043@email.com', 'Paul', 'Morris', '2024-03-03', 'social', 'Nigeria', 'Lagos'),
('user044@email.com', 'Amber', 'Rogers', '2024-03-04', 'email', 'USA', 'Nashville'),
('user045@email.com', 'Gregory', 'Reed', '2024-03-05', 'organic', 'South Africa', 'Johannesburg'),
('user046@email.com', 'Crystal', 'Cook', '2024-03-06', 'paid_search', 'USA', 'Portland'),
('user047@email.com', 'Dennis', 'Morgan', '2024-03-07', 'social', 'Indonesia', 'Jakarta'),
('user048@email.com', 'Brittany', 'Bell', '2024-03-08', 'organic', 'USA', 'Oklahoma City'),
('user049@email.com', 'Ronald', 'Murphy', '2024-03-09', 'email', 'Bangladesh', 'Dhaka'),
('user050@email.com', 'Vanessa', 'Bailey', '2024-03-10', 'paid_search', 'USA', 'Las Vegas');

-- ================================================================
-- ВСТАВКА ДАННЫХ ТОВАРОВ
-- ================================================================
INSERT INTO products (product_name, category, price, cost) VALUES
('iPhone 15 Pro', 'Electronics', 999.00, 600.00),
('Samsung Galaxy S24', 'Electronics', 899.00, 550.00),
('MacBook Pro 14"', 'Electronics', 1999.00, 1200.00),
('Dell XPS 13', 'Electronics', 1299.00, 800.00),
('iPad Air', 'Electronics', 599.00, 350.00),
('AirPods Pro', 'Electronics', 249.00, 150.00),
('Sony WH-1000XM5', 'Electronics', 399.00, 240.00),
('Nike Air Max 270', 'Clothing', 149.99, 75.00),
('Adidas Ultraboost 22', 'Clothing', 179.99, 90.00),
('Levis 501 Jeans', 'Clothing', 89.99, 45.00),
('The North Face Jacket', 'Clothing', 299.99, 150.00),
('Patagonia Fleece', 'Clothing', 199.99, 100.00),
('Instant Pot Duo 7-in-1', 'Home & Kitchen', 79.99, 40.00),
('Dyson V15 Vacuum', 'Home & Kitchen', 749.99, 400.00),
('KitchenAid Mixer', 'Home & Kitchen', 379.99, 200.00),
('Nespresso VertuoPlus', 'Home & Kitchen', 179.99, 90.00),
('Fitbit Charge 5', 'Health & Fitness', 149.95, 75.00),
('Peloton Guide', 'Health & Fitness', 295.00, 150.00),
('Yoga Mat Premium', 'Health & Fitness', 49.99, 25.00),
('Protein Powder 5lb', 'Health & Fitness', 59.99, 30.00);

-- ================================================================
-- ВСТАВКА ДАННЫХ КАМПАНИЙ
-- ================================================================
INSERT INTO campaigns (campaign_name, campaign_type, start_date, end_date, total_spend, impressions) VALUES
('Q1 Google Search Campaign', 'search', '2024-01-01', '2024-03-31', 25000.00, 500000),
('Facebook Social Campaign', 'social', '2024-01-15', '2024-02-29', 15000.00, 750000),
('Display Banner Campaign', 'display', '2024-02-01', '2024-03-15', 18000.00, 1200000),
('Email Remarketing Campaign', 'email', '2024-01-10', '2024-03-20', 5000.00, 200000),
('Instagram Influencer Campaign', 'social', '2024-02-14', '2024-03-31', 12000.00, 400000),
('YouTube Video Campaign', 'display', '2024-01-20', '2024-02-28', 20000.00, 800000);

-- ================================================================
-- ВСТАВКА ДАННЫХ КЛИКОВ ПО КАМПАНИЯМ (225+ кликов)
-- ================================================================
-- Генерируем клики для разных кампаний в течение периода
INSERT INTO campaign_clicks (campaign_id, user_id, click_timestamp, cost_per_click)
SELECT 
    clicks.campaign_id,
    clicks.user_id,
    clicks.timestamp_base + (random() * interval '30 days'),
    CASE 
        WHEN c.campaign_type = 'search' THEN random() * 3 + 1.5  -- $1.50-$4.50
        WHEN c.campaign_type = 'social' THEN random() * 2 + 0.5  -- $0.50-$2.50
        WHEN c.campaign_type = 'display' THEN random() * 1 + 0.25 -- $0.25-$1.25
        WHEN c.campaign_type = 'email' THEN random() * 0.5 + 0.1  -- $0.10-$0.60
    END::DECIMAL(8,4)
FROM (
    SELECT 1 as campaign_id, generate_series(1, 50) as user_id, '2024-01-01'::timestamp as timestamp_base
    UNION ALL
    SELECT 2 as campaign_id, generate_series(1, 40) as user_id, '2024-01-15'::timestamp as timestamp_base
    UNION ALL
    SELECT 3 as campaign_id, generate_series(1, 35) as user_id, '2024-02-01'::timestamp as timestamp_base
    UNION ALL
    SELECT 4 as campaign_id, generate_series(1, 25) as user_id, '2024-01-10'::timestamp as timestamp_base
    UNION ALL
    SELECT 5 as campaign_id, generate_series(1, 30) as user_id, '2024-02-14'::timestamp as timestamp_base
    UNION ALL
    SELECT 6 as campaign_id, generate_series(1, 45) as user_id, '2024-01-20'::timestamp as timestamp_base
) clicks
JOIN campaigns c ON c.campaign_id = clicks.campaign_id;

-- ================================================================
-- ВСТАВКА ДАННЫХ ПОЛЬЗОВАТЕЛЬСКИХ СЕССИЙ (Ежедневные активные пользователи с различной активностью)
-- ================================================================
-- Генерируем сессии для каждого пользователя в течение 3-месячного периода
INSERT INTO user_sessions (user_id, session_start, session_end, session_date, pages_viewed, session_duration_minutes, device_type)
SELECT 
    u.user_id,
    session_date + (random() * interval '16 hours' + interval '6 hours'), -- 6 AM to 10 PM
    session_date + (random() * interval '16 hours' + interval '6 hours') + 
        (random() * interval '120 minutes' + interval '5 minutes'), -- 5-125 min sessions
    session_date,
    (random() * 15 + 1)::integer, -- 1-15 pages
    (random() * 120 + 5)::integer, -- 5-125 minutes
    CASE 
        WHEN random() < 0.6 THEN 'mobile'
        WHEN random() < 0.85 THEN 'desktop'
        ELSE 'tablet'
    END
FROM users u
CROSS JOIN (
    SELECT date_series::date as session_date
    FROM generate_series('2024-01-01'::date, '2024-03-31'::date, '1 day'::interval) date_series
) dates
WHERE u.registration_date <= dates.session_date
    AND random() < 
        CASE 
                    -- Более высокая активность в первую неделю после регистрации
            WHEN dates.session_date - u.registration_date <= 7 THEN 0.8
                    -- Регулярная активность после первой недели
            WHEN dates.session_date - u.registration_date <= 30 THEN 0.4
                    -- Меньшая активность для давних пользователей
            ELSE 0.25
        END;

-- ================================================================
-- ВСТАВКА ДАННЫХ ЗАКАЗОВ
-- ================================================================
-- Генерируем заказы от активных пользователей с атрибуцией кампаний
INSERT INTO orders (user_id, order_date, order_timestamp, total_amount, status, campaign_id)
SELECT 
    s.user_id,
    s.session_date,
    s.session_start + interval '30 minutes', -- Order placed 30 min into session
    (random() * 800 + 50)::decimal(12,2), -- $50-$850 orders
    CASE 
        WHEN random() < 0.95 THEN 'completed'
        WHEN random() < 0.98 THEN 'cancelled'
        ELSE 'refunded'
    END,
    -- Логика атрибуции: связываем с кликами по кампаниям, если пользователь недавно кликал
    (SELECT cc.campaign_id 
     FROM campaign_clicks cc 
     WHERE cc.user_id = s.user_id 
       AND cc.click_timestamp >= s.session_start - interval '7 days'
       AND cc.click_timestamp <= s.session_start
     ORDER BY cc.click_timestamp DESC 
     LIMIT 1)
FROM user_sessions s
WHERE random() < 0.15 -- 15% сессий приводят к заказам
    AND s.session_duration_minutes > 10; -- Только длительные сессии

-- ================================================================
-- ВСТАВКА ДАННЫХ ПОЗИЦИЙ ЗАКАЗОВ
-- ================================================================
-- Генерируем 1-3 позиции на заказ с гораздо лучшим распределением товаров

-- Стратегия: Создавайте несколько рядов для каждого заказа, в каждом из которых будет свой случайный продукт
-- Это обеспечивает равномерное распределение по всем 20 продуктам
WITH order_items_data AS (
    SELECT
        o.order_id,
        (floor(random() * 20) + 1)::integer as product_id,
        1 as quantity,
        1 as item_type  -- marker for first item
    FROM orders o
    
    UNION ALL
    
    SELECT
        o.order_id,
        (floor(random() * 20) + 1)::integer as product_id,
        CASE WHEN random() < 0.8 THEN 1 ELSE 2 END as quantity,
        2 as item_type
    FROM orders o
    WHERE random() < 0.4
    
    UNION ALL
    
    SELECT
        o.order_id,
        (floor(random() * 20) + 1)::integer as product_id,
        1 as quantity,
        3 as item_type
    FROM orders o  
    WHERE random() < 0.15
)
INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price)
SELECT 
    oid.order_id,
    oid.product_id,
    oid.quantity,
    p.price as unit_price,
    p.price * oid.quantity as total_price
FROM order_items_data oid
JOIN products p ON p.product_id = oid.product_id;
select * from orders;
select * from order_items;
-- Обновляем итоги заказов в соответствии с позициями заказов
UPDATE orders 
SET total_amount = (
    SELECT SUM(total_price) 
    FROM order_items oi 
    WHERE oi.order_id = orders.order_id
);
-- ================================================================
-- ЗАПРОСЫ ПРОВЕРКИ ДАННЫХ
-- ================================================================
SELECT 'Users Count' as metric, COUNT(*) as value FROM users
UNION ALL
SELECT 'Products Count', COUNT(*) FROM products
UNION ALL
SELECT 'Campaigns Count', COUNT(*) FROM campaigns
UNION ALL
SELECT 'Campaign Clicks Count', COUNT(*) FROM campaign_clicks
UNION ALL
SELECT 'User Sessions Count', COUNT(*) FROM user_sessions
UNION ALL
SELECT 'Orders Count', COUNT(*) FROM orders
UNION ALL
SELECT 'Order Items Count', COUNT(*) FROM order_items;

-- Показываем диапазон дат данных
SELECT 
    'Data Period' as info,
    MIN(registration_date)::text as start_date,
    MAX(registration_date)::text as end_date
FROM users;

-- Показываем распределение выборочных данных
SELECT 
    acquisition_channel,
    COUNT(*) as user_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) as percentage
FROM users 
GROUP BY acquisition_channel 
ORDER BY user_count DESC;
