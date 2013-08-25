/* 

This question was asked in a Google interview: Given the 2 tables below, User and UserHistory:

-------------
Users
--------------
user_id
name
phone_num

*/


CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    phone_num VARCHAR(12)
);


-- Insert values into Users

INSERT INTO Users (user_id, name, phone_num) VALUES (1, 'Rambo', '213-546-7896');
INSERT INTO Users (user_id, name, phone_num) VALUES (2, 'Jumbo', '133-534-7836');
INSERT INTO Users (user_id, name, phone_num) VALUES (3, 'Sambo', '132-548-7856');
INSERT INTO Users (user_id, name, phone_num) VALUES (4, 'Kumbo', '334-546-7296');
INSERT INTO Users (user_id, name, phone_num) VALUES (5, 'Lambo', '323-542-7596');
INSERT INTO Users (user_id, name, phone_num) VALUES (6, 'Bambo', '303-502-7006');
INSERT INTO Users (user_id, name, phone_num) VALUES (7, 'Wambo', '313-522-7116');
INSERT INTO Users (user_id, name, phone_num) VALUES (8, 'Pambo', '363-042-9006');


/*

---------------
UserHistory
---------------
user_id
log_date
action

*/


CREATE TABLE UserHistory (
   user_id INT,
   log_date DATE,
   action VARCHAR(20),
   FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- Populate UserHistory table

INSERT INTO UserHistory (user_id,log_date,action) VALUES (2,'2013-08-02','logged_on');  
INSERT INTO UserHistory (user_id,log_date,action) VALUES (5,'2013-06-21','logged_on');
INSERT INTO UserHistory (user_id,log_date,action) VALUES (3,'2013-08-22','logged_on');  
INSERT INTO UserHistory (user_id,log_date,action) VALUES (4,'2013-07-29','logged_on'); 
INSERT INTO UserHistory (user_id,log_date,action) VALUES (1,'2013-06-02','logged_on');
INSERT INTO UserHistory (user_id,log_date,action) VALUES (2,'2013-08-20','logged_on');  


/*****************************************************************************************************************

1. Write a SQL query that returns the name, phone number and most recent date for any user that has logged in over the last 30 days (you can tell a user has logged in if the action field in UserHistory is set to "logged_on").

Every time a user logs in a new row is inserted into the UserHistory table with user_id, current date and action (where action = "logged_on"). 

 *****************************************************************************************************************/

SELECT User.name, User.phone_num, max(UserHistory.date) 
FROM User, UserHistory 
WHERE User.user_id = UserHistory.user_id 
AND UserHistory.action = 'logged_on' 
AND UserHistory.date >= date_sub(curdate(), interval 30 day) 
GROUP BY (User.user_id);

/*****************************************************************************************************************

 2. Write a SQL query to determine which user_ids in the User table are not contained in the UserHistory table (assume the UserHistory table has a subset of the user_ids in User table). Do not use the SQL MINUS statement. Note: the UserHistory table can have multiple entries for each user_id.

Note that your SQL should be compatible with MySQL 5.0, and avoid using subqueries

 *****************************************************************************************************************/

SELECT DISTINCT(u.user_id) FROM Users u
   LEFT JOIN UserHistory AS uh ON
   u.user_id = uh.user_id
   WHERE uh.user_id IS NULL;

 
