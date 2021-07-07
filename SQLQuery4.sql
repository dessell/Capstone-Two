SELECT Team, Points, Year, Country
FROM (
	  SELECT T.Team,
	         T.Points,
			 T.Year,
			 T.Country,
			 ROW_NUMBER() OVER(PARTITION BY T.Year ORDER BY T.Points DESC) AS rn
	  FROM test_results$ AS T
	  ) AS T
WHERE T.rn <= 1;