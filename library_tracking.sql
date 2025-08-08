-- Library Book Tracking System
-- Created to manage books, members, and borrow records

-- Create database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Table for books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Availability BOOLEAN
);

-- Table for members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE
);

-- Table for borrow records
CREATE TABLE BorrowRecords (
    RecordID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert sample books
INSERT INTO Books VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', TRUE),
(2, '1984', 'George Orwell', 'Dystopian', TRUE),
(3, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', TRUE);

-- Insert sample members
INSERT INTO Members VALUES
(1, 'Alice Johnson', 'alice@example.com', '2023-01-15'),
(2, 'Bob Smith', 'bob@example.com', '2023-02-10');

-- Insert sample borrow records
INSERT INTO BorrowRecords VALUES
(1, 1, 1, '2023-03-01', '2023-03-10'),
(2, 2, 2, '2023-03-05', NULL);

-- Query to check borrowed books
SELECT Books.Title, Members.Name, BorrowRecords.BorrowDate, BorrowRecords.ReturnDate
FROM BorrowRecords
JOIN Books ON BorrowRecords.BookID = Books.BookID
JOIN Members ON BorrowRecords.MemberID = Members.MemberID;

