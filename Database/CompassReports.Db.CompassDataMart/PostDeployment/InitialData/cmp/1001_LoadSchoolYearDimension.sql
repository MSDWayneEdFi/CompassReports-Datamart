/******LOAD SCHOOLYEAR DIMENSION FROM SCHOOLYEARTYPE  ******/

INSERT INTO [cmp].[SchoolYearDimension]
([SchoolYearKey], 
 [SchoolYearDescription]
)

SELECT [SchoolYear]
	,[SchoolYearDescription] 
FROM [$(OdsDatabaseServer)].[$(OdsDatabaseName)].[cmp].[SchoolYearDimension]	
