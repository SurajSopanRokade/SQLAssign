SET @fullNameList = "";

CALL getFullName(@fullNameList);

SELECT @fullNameList;