-- έΟWv
DROP TABLE IF EXISTS #γ
GO

SELECT * 
INTO #γ
FROM
  (
    VALUES
	   (1, '2020/10/1', N'Yamada', 100),
	   (2, '2020/10/2', N'Yamada', 150),
	   (3, '2020/10/2', N'Suzuki', 120),
	   (4, '2020/10/3', N'Suzuki', 200),
	   (5, '2020/10/5', N'Yamada', 80),
	   (6, '2020/10/4', N'Suzuki', 90),
	   (7, '2020/10/4', N'Tanaka', 110),
	   (8, '2020/10/5', N'Yamada', 50),
	   (9, '2020/10/6', N'Suzuki', 90),
	   (10, '2020/10/6', N'Tanaka', 40)
  ) AS Src(γID, γϊ, cΖS, γz)
GO

SELECT *
FROM
  #γ
GO

SELECT
    cΖS,
	γϊ,
	γz,
	SUM(γz) OVER (
	    PARTITION BY cΖS
		ORDER BY γϊ, γID
		ROWS BETWEEN UNBOUNDED PRECEDING
		         AND  CURRENT ROW
				      ) AS έΟγz
FROM	#γ
ORDER BY cΖS, γϊ, γID
GO



-- ROWSεΕΜ«ϋα
-- @ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
SELECT ROW_NUMBER() OVER(ORDER BY γϊ, γID) AS 'No.',
    cΖS,
	γϊ,
	γz,
	SUM(γz) OVER (
			       ORDER BY γϊ, γID
			       ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS έΟγz
FROM	#γ
ORDER BY γϊ, γID
GO

-- AROWS BETWEEN 1 PRECEDING AND 2 FOLLOWING
SELECT ROW_NUMBER() OVER(ORDER BY γϊ, γID) AS 'No.',
    cΖS,
	γϊ,
	γz,
	SUM(γz) OVER (
			       ORDER BY γϊ, γID
			       ROWS BETWEEN 1 PRECEDING AND 2 FOLLOWING) AS έΟγz
FROM	#γ
ORDER BY γϊ, γID
GO

-- BROWS BETWEEN 1 PRECEDING AND 1 PRECEDING
SELECT ROW_NUMBER() OVER(ORDER BY γϊ, γID) AS 'No.',
    cΖS,
	γϊ,
	γz,
	SUM(γz) OVER (
			       ORDER BY γϊ, γID
			       ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS έΟγz
FROM	#γ
ORDER BY γϊ, γID
GO
