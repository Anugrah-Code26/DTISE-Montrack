-- Insert into Currencies Table
INSERT INTO Currencies (currency_code, currency_name)
values
	('IDR', 'Indonesia Rupiah'),
	('USD', 'US Dollar'),
	('JPY', 'Japan Yen');

-- Insert into Wallets Table
INSERT INTO Wallets (currency_id, wallet_name, wallet_amount, is_used)
VALUES 
	(1, 'Main Wallet', 1000000.00, TRUE);

-- Insert into Emojis Table
INSERT INTO Emojis (emoji_symbol, emoji_description)
VALUES 
	('💸', 'Spending Pocket'),
    	('💰', 'Savings Pocket'),
    	('🎉', 'Entertainment Pocket');

-- Insert into Goals Table
INSERT INTO Goals (wallet_id, goal_name, goal_amount, goal_current_amount, goal_description, goal_attachment)
VALUES 
    	(1, 'Japan Vacation Fund', 5000000.00, 2000000.00, 'Save for a vacation to Japan', NULL),
    	(1, 'Emergency Fund', 10000000.00, 3000000.00, 'Emergency savings for unforeseen expenses', NULL);

-- Insert into Pockets Table
INSERT INTO Pockets (wallet_id, emoji_id, budget_name, budget_amount, budget_current_amount, budget_description)
VALUES 
	(1, 1, 'Daily Expenses', 500000.00, 200000.00, 'Budget for daily expenses like food and transportation'),
    	(1, 2, 'Savings', 3000000.00, 1500000.00, 'General savings pocket'),
    	(1, 3, 'Entertainment', 1000000.00, 500000.00, 'Budget for entertainment and leisure activities');

-- Insert into Money_Records Table
INSERT INTO Money_Records (pocket_id, goal_id, record_name, record_type, transaction_date, transaction_amount, record_description)
VALUES 
    	(1, NULL, 'Groceries', 'Expense', NOW(), 100000.00, 'Weekly groceries shopping'),
    	(NULL, 1, 'Add to Vacation Fund', 'Income', NOW(), 500000.00, 'Added to vacation fund'),
    	(3, NULL, 'Movie Ticket', 'Expense', NOW(), 50000.00, 'Watched a movie at the cinema');

-- Insert into Users Table
INSERT INTO Users (wallet_id, name, email, password, pin, profile_picture, quotes, is_google_account)
VALUES 
    	(1, 'Anugrah Yazid Ghani', 'anugrah.yazid@gmail.com', 'hashed_password', 1234, NULL, 'Keep calm', FALSE);

