--1
SELECT PersonID, LastName, FirstName
FROM Persons
WHERE LastName = 'Ivanov'
--2
SELECT PersonID, LastName, FirstName
FROM Persons
WHERE City = 'MOSCOW'
--3
SELECT COUNT(AccountID)
FROM Accounts
WHERE Opening_Date > '2004-08-20' AND ISO_Symbol = 'RUB'
--4
SELECT Accounts.AccountID, COUNT(List_Transaction.Name) AS NumberOfTransaction
FROM Accounts
INNER JOIN List_Transaction
ON Accounts.AccountID = List_Transaction.AccountID
WHERE Opening_Date > '2004-08-01'
GROUP BY Accounts.AccountID
--5
SELECT AccountID, Name, Amount, Transaction_Date
FROM List_Transaction
WHERE ISO_Symbol = 'RUB'
--6
SELECT DISTINCT Persons.PersonID, LastName, FirstName
FROM Persons
INNER JOIN Accounts
ON Persons.PersonID = Accounts.PersonID
WHERE (
(SELECT COUNT(AccountID) 
FROM Accounts
WHERE Persons.PersonID = Accounts.PersonID ) > 1)
--7
SELECT DISTINCT City
FROM Cities
INNER JOIN Persons
ON Cities.City_Name = City
--8
SELECT DISTINCT Persons.PersonID, LastName, FirstName
FROM Persons
INNER JOIN Accounts
ON Persons.PersonID = Accounts.PersonID
WHERE (
(SELECT MAX(Bankroll) 
FROM Accounts 
WHERE Persons.PersonID = Accounts.PersonID) <= 0)
--9
SELECT Persons.PersonID, SUM(Amount) AS SummaryCosts
FROM ((List_Transaction
INNER JOIN Accounts
ON List_Transaction.AccountID = Accounts.AccountID)
INNER JOIN Persons
ON Persons.PersonID = Accounts.PersonID)
WHERE List_Transaction.ISO_Symbol = 'RUB' AND List_Transaction.Name = 'Debit'
GROUP BY Persons.PersonID
--10
SELECT ISO_Symbol, COUNT(AccountID) AS CountOfAccounts
FROM Accounts
GROUP BY ISO_Symbol






	