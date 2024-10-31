-- Insert into Currencies Table
INSERT INTO Currencies (currency_code, currency_name)
VALUES 
    ('IDR', 'Indonesian Rupiah'),
    ('USD', 'US Dollar'),
    ('EUR', 'Euro'),
    ('JPY', 'Japan Yen');

-- Insert into Users Table
INSERT INTO Users (name, email, password, pin, profile_picture, quotes, oauth_provider)
VALUES 
    ('Anugrah Yazid Ghani', 'anugrah.yazid@gmail.com', 'hashed_password', 1234, NULL, 'Keep Calm', FALSE),
    ('Jin Sakai', 'jin.sakai@gmail.com', 'hashed_password', 4321, NULL, 'Stay Positive', FALSE);

-- Insert into Notification_Types Table
INSERT INTO Notification_Types (type_name, description)
VALUES 
    ('Goal Update', 'Notification regarding goal progress or updates'),
    ('Transaction Alert', 'Notification for any wallet transaction activities'),
    ('Pocket Update', 'Notification for pocket budget adjustments');

-- Insert into Notifications Table
INSERT INTO Notifications (user_id, notification_type_id, notification_message, is_read)
VALUES 
    (1, 1, 'Your Vacation Fund goal has been updated with a new amount.', FALSE),
    (2, 2, 'A transaction of $50 was made from your wallet.', TRUE),
    (1, 3, 'Entertainment pocket budget has been adjusted.', FALSE);

-- Insert into Wallets Table
INSERT INTO Wallets (user_id, currency_id, wallet_name, wallet_amount, is_used)
VALUES 
    (1, 1, 'Primary Wallet', 500000.00, TRUE),
    (2, 2, 'Savings Wallet', 1500.00, TRUE);

-- Insert into Emojis Table
INSERT INTO Emojis (emoji_symbol, emoji_description)
VALUES 
    ('💸', 'For spending categories'),
    ('💰', 'For savings categories'),
    ('🎉', 'For entertainment categories');

-- Insert into Goals Table
INSERT INTO Goals (wallet_id, goal_name, goal_amount, goal_current_amount, goal_description, goal_attachment)
VALUES 
    (1, 'Vacation Fund', 1000000.00, 250000.00, 'Save up for a holiday vacation.', NULL),
    (2, 'Emergency Fund', 2000.00, 500.00, 'Funds reserved for emergencies.', NULL);

-- Insert into Pockets Table
INSERT INTO Pockets (wallet_id, emoji_id, budget_name, budget_amount, budget_current_amount, budget_description)
VALUES 
    (1, 1, 'Daily Expenses', 200000.00, 100000.00, 'Budget for daily spending needs.'),
    (2, 2, 'Long-term Savings', 1000.00, 500.00, 'Savings set aside for future use.');

-- Insert into Money_Records Table
INSERT INTO Money_Records (pocket_id, goal_id, record_name, record_type, transaction_date, transaction_amount, record_description, record_attachment)
VALUES 
    (1, NULL, 'Grocery Shopping', 'Expense', NOW(), 50000.00, 'Groceries for the week.', NULL),
    (NULL, 1, 'Vacation Fund Deposit', 'Income', NOW(), 100000.00, 'Added funds to vacation goal.', NULL),
    (2, NULL, 'Rent Payment', 'Expense', NOW(), 200.00, 'Monthly rent.', NULL);

