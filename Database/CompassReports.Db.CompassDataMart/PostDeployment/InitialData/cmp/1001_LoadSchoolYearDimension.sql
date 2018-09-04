;WITH InitialSchoolYear (SchoolYear) AS (
	SELECT @StartYear
	UNION ALL
	SELECT CAST(SchoolYear + 1 AS smallint)
	FROM InitialSchoolYear
	WHERE SchoolYear < @EndYear)

INSERT INTO [cmp].[SchoolYearDimension]
([SchoolYearKey], 
 [SchoolYearDescription]
)

SELECT [SchoolYear]
	,CONCAT([SchoolYear]-1, '-',FORMAT([SchoolYear] % 100,'00')) 
FROM InitialSchoolYear	
WHERE [SchoolYear] NOT IN ( SELECT [SchoolYearKey] FROM [cmp].[SchoolYearDimension])
