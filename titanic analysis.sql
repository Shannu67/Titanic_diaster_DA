--  1.Create Database and Table
CREATE DATABASE titanic_analysis;
USE titanic_analysis;

CREATE TABLE passengers (
    passenger_id INT,
    survived BOOLEAN,
    pclass INT,
    name VARCHAR(255),
    sex VARCHAR(10),
    age FLOAT,
    sibsp INT,
    parch INT,
    ticket VARCHAR(50),
    fare FLOAT,
    cabin VARCHAR(50),
    embarked VARCHAR(1)
);

--  2.Import Data through table data import wizard
-- 3. Run Analysis Queries
-- Survival Rate by Gender:
SELECT 
    Sex,
    AVG(Survived) * 100 AS SurvivalRate,
    COUNT(*) AS PassengerCount
FROM titanic_analysis.train
GROUP BY Sex
ORDER BY SurvivalRate DESC;

-- Survival Rate by Passenger Class
SELECT 
    Pclass,
    AVG(Survived) * 100 AS SurvivalRate,
    COUNT(*) AS PassengerCount
FROM titanic_analysis.train
GROUP BY Pclass
ORDER BY Pclass;

--  Survival Rate by Age Group
SELECT 
    `Age group` AS AgeGroup,
    AVG(Survived) * 100 AS SurvivalRate,
    COUNT(*) AS PassengerCount
FROM titanic_analysis.train
WHERE `Age group` IS NOT NULL
GROUP BY `Age group`
ORDER BY 
    CASE AgeGroup
        WHEN 'Child' THEN 1
        WHEN 'Teen' THEN 2
        WHEN 'Young Adult' THEN 3
        WHEN 'Adult' THEN 4
        WHEN 'Senior' THEN 5
        ELSE 6
    END;
    
    --  Combined Analysis: Gender and Class
    SELECT 
    Pclass,
    Sex,
    AVG(Survived) * 100 AS SurvivalRate,
    COUNT(*) AS PassengerCount
FROM titanic_analysis.train
GROUP BY Pclass, Sex
ORDER BY Pclass, Sex;

-- Combined Analysis: Age, Gender and Class
SELECT 
    `Age group` AS AgeGroup,
    Pclass,
    Sex,
    AVG(Survived) * 100 AS SurvivalRate,
    COUNT(*) AS PassengerCount
FROM titanic_analysis.train
WHERE `Age group` IS NOT NULL
GROUP BY `Age group`, Pclass, Sex
ORDER BY 
    CASE AgeGroup
        WHEN 'Child' THEN 1
        WHEN 'Teen' THEN 2
        WHEN 'Young Adult' THEN 3
        WHEN 'Adult' THEN 4
        WHEN 'Senior' THEN 5
        ELSE 6
    END,
    Pclass,
    Sex;