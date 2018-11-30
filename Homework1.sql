SELECT	
	firstname,
	lastname,
	SUBSTRING(firstname,1,1) || SUBSTRING(lastname,1,1) AS initials
FROM sql_masterclass.users
LIMIT 10;