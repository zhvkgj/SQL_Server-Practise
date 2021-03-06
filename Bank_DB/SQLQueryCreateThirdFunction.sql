CREATE FUNCTION dbo.get_ListOfPersons()
RETURNS TABLE
AS
RETURN(
SELECT Persons.PersonID, Persons.LastName, Persons.FirstName,
	   Accounts.AccountID, Accounts.Bankroll, Accounts.ISO_Symbol
FROM Persons
INNER JOIN Accounts
ON Persons.PersonID = Accounts.PersonID
WHERE 
EXISTS 
(SELECT Bankroll 
FROM Accounts 
WHERE Bankroll < 0
AND 
(SELECT COUNT(AccountID) 
FROM Accounts
WHERE Persons.PersonID = Accounts.PersonID ) > 1));