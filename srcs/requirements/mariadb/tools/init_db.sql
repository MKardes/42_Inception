-- This statement creates a database named "wordpress" if it does not already exist.
-- 'IF NOT EXISTS' is used as a safety measure to prevent an error if the database already exists.
CREATE DATABASE IF NOT EXISTS wordpress;

-- This statement creates a user with the username 'mkardes' and allows connections from any host ('%').
-- The user is identified by the password '1234'.
-- 'IF NOT EXISTS' ensures that the user is only created if it does not already exist.
CREATE USER IF NOT EXISTS 'mkardes'@'%' IDENTIFIED BY '1234';

-- This statement grants all privileges (e.g., SELECT, INSERT, UPDATE, DELETE, etc.) on the "wordpress" database to the user 'mkardes' from any host ('%').
-- The user 'mkardes' will have full control over the "wordpress" database.
GRANT ALL PRIVILEGES ON wordpress.* TO 'mkardes'@'%';

-- This statement reloads the MySQL privilege tables, applying the changes made by the previous statements immediately.
-- It ensures that the newly created user and granted privileges take effect without the need to restart the MySQL server.
FLUSH PRIVILEGES;

-- This statement changes the password of the 'root' user when connecting from the 'localhost' host to 'root1234'.
-- This is a common security practice to set a strong password for the root user, who has the highest level of access in MySQL.
ALTER USER 'root'@'localhost' IDENTIFIED BY 'pass1234';
