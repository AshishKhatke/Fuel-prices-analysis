SELECT * FROM commodities.fuel;
USE commodities;


-- MEASURE OF CENTRAL TENDANCY




-- calculating mean 





SELECT 
    AVG(Coal_RB_4800_FOB_London_Close_USD) AS avg_Coal_RB_4800,
    AVG(Coal_RB_5500_FOB_London_Close_USD) AS avg_Coal_RB_5500,
    AVG(Coal_RB_5700_FOB_London_Close_USD) AS avg_Coal_RB_5700,
    AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS avg_Coal_RB_6000,
    AVG(Coal_India_5500_CFR_London_Close_USD) AS avg_Coal_India_5500,
    AVG(Price_WTI) AS avg_Price_WTI,
    AVG(Price_Brent_Oil) AS avg_Price_Brent_Oil,
    AVG(Price_Dubai_Brent_Oil) AS avg_Price_Dubai_Brent,
    AVG(Price_ExxonMobil) AS avg_Price_ExxonMobil,
    AVG(Price_Shenhua) AS avg_Price_Shenhua,
    AVG(Price_All_Share) AS avg_Price_All_Share,
    AVG(Price_Mining) AS avg_Price_Mining,
    AVG(Price_LNG_Japan_Korea_Marker_PLATTS) AS avg_Price_LNG,
    AVG(Price_ZAR_USD) AS avg_Price_ZAR_USD,
    AVG(Price_Natural_Gas) AS avg_Price_Natural_Gas,
    AVG(Price_ICE) AS avg_Price_ICE,
    AVG(Price_Dutch_TTF) AS avg_Price_Dutch_TTF,
    AVG(Price_Indian_en_exg_rate) AS avg_Price_Indian_Exchange
FROM fuel;





-- calculating median 






WITH OrderedData AS (
    SELECT 
        Coal_RB_4800_FOB_London_Close_USD,
        Coal_RB_5500_FOB_London_Close_USD,
        Coal_RB_5700_FOB_London_Close_USD,
        Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
        Coal_India_5500_CFR_London_Close_USD,
        Price_WTI,
        Price_Brent_Oil,
        Price_Dubai_Brent_Oil,
        Price_ExxonMobil,
        Price_Shenhua,
        Price_All_Share,
        Price_Mining,
        Price_LNG_Japan_Korea_Marker_PLATTS,
        Price_ZAR_USD,
        Price_Natural_Gas,
        Price_ICE,
        Price_Dutch_TTF,
        Price_Indian_en_exg_rate,
        ROW_NUMBER() OVER (ORDER BY Coal_RB_4800_FOB_London_Close_USD) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM fuel
)
SELECT 
    (SELECT AVG(Coal_RB_4800_FOB_London_Close_USD) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Coal_RB_4800,
    (SELECT AVG(Coal_RB_5500_FOB_London_Close_USD) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Coal_RB_5500,
    (SELECT AVG(Coal_RB_5700_FOB_London_Close_USD) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Coal_RB_5700,
    (SELECT AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Coal_RB_6000,
    (SELECT AVG(Coal_India_5500_CFR_London_Close_USD) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Coal_India_5500,
    (SELECT AVG(Price_WTI) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_WTI,
    (SELECT AVG(Price_Brent_Oil) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_Brent_Oil,
    (SELECT AVG(Price_Dubai_Brent_Oil) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_Dubai_Brent,
    (SELECT AVG(Price_ExxonMobil) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_ExxonMobil,
    (SELECT AVG(Price_Shenhua) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_Shenhua,
    (SELECT AVG(Price_All_Share) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_All_Share,
    (SELECT AVG(Price_Mining) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_Mining,
    (SELECT AVG(Price_LNG_Japan_Korea_Marker_PLATTS) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_LNG,
    (SELECT AVG(Price_ZAR_USD) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_ZAR_USD,
    (SELECT AVG(Price_Natural_Gas) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_Natural_Gas,
    (SELECT AVG(Price_ICE) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_ICE,
    (SELECT AVG(Price_Dutch_TTF) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_Dutch_TTF,
    (SELECT AVG(Price_Indian_en_exg_rate) FROM OrderedData WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))) AS median_Price_Indian_Exchange;
    
    
    
    
    
    
    
    -- calculating mode 
    
    
    
    
    
    
        SELECT 
    (SELECT Coal_RB_4800_FOB_London_Close_USD 
     FROM fuel 
     GROUP BY Coal_RB_4800_FOB_London_Close_USD 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Coal_RB_4800,

    (SELECT Coal_RB_5500_FOB_London_Close_USD 
     FROM fuel 
     GROUP BY Coal_RB_5500_FOB_London_Close_USD 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Coal_RB_5500,

    (SELECT Coal_RB_5700_FOB_London_Close_USD 
     FROM fuel 
     GROUP BY Coal_RB_5700_FOB_London_Close_USD 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Coal_RB_5700,

    (SELECT Coal_RB_6000_FOB_CurrentWeek_Avg_USD 
     FROM fuel 
     GROUP BY Coal_RB_6000_FOB_CurrentWeek_Avg_USD 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Coal_RB_6000,

    (SELECT Coal_India_5500_CFR_London_Close_USD 
     FROM fuel 
     GROUP BY Coal_India_5500_CFR_London_Close_USD 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Coal_India_5500,

    (SELECT Price_WTI 
     FROM fuel 
     GROUP BY Price_WTI 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_WTI,

    (SELECT Price_Brent_Oil 
     FROM fuel 
     GROUP BY Price_Brent_Oil 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_Brent_Oil,

    (SELECT Price_Dubai_Brent_Oil 
     FROM fuel 
     GROUP BY Price_Dubai_Brent_Oil 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_Dubai_Brent,

    (SELECT Price_ExxonMobil 
     FROM fuel 
     GROUP BY Price_ExxonMobil 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_ExxonMobil,

    (SELECT Price_Shenhua 
     FROM fuel 
     GROUP BY Price_Shenhua 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_Shenhua,

    (SELECT Price_All_Share 
     FROM fuel 
     GROUP BY Price_All_Share 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_All_Share,

    (SELECT Price_Mining 
     FROM fuel 
     GROUP BY Price_Mining 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_Mining,

    (SELECT Price_LNG_Japan_Korea_Marker_PLATTS 
     FROM fuel 
     GROUP BY Price_LNG_Japan_Korea_Marker_PLATTS 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_LNG,

    (SELECT Price_ZAR_USD 
     FROM fuel 
     GROUP BY Price_ZAR_USD 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_ZAR_USD,

    (SELECT Price_Natural_Gas 
     FROM fuel 
     GROUP BY Price_Natural_Gas 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_Natural_Gas,

    (SELECT Price_ICE 
     FROM fuel 
     GROUP BY Price_ICE 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_ICE,

    (SELECT Price_Dutch_TTF 
     FROM fuel 
     GROUP BY Price_Dutch_TTF 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_Dutch_TTF,

    (SELECT Price_Indian_en_exg_rate 
     FROM fuel 
     GROUP BY Price_Indian_en_exg_rate 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS mode_Price_Indian_Exchange;





-- MEASURE OF DISPERSSION 



-- calculating variance and standard deviation




SELECT 
    VAR_POP(Coal_RB_4800_FOB_London_Close_USD) AS var_Coal_RB_4800,
    STDDEV_POP(Coal_RB_4800_FOB_London_Close_USD) AS stddev_Coal_RB_4800,

    VAR_POP(Coal_RB_5500_FOB_London_Close_USD) AS var_Coal_RB_5500,
    STDDEV_POP(Coal_RB_5500_FOB_London_Close_USD) AS stddev_Coal_RB_5500,

    VAR_POP(Coal_RB_5700_FOB_London_Close_USD) AS var_Coal_RB_5700,
    STDDEV_POP(Coal_RB_5700_FOB_London_Close_USD) AS stddev_Coal_RB_5700,

    VAR_POP(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS var_Coal_RB_6000,
    STDDEV_POP(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS stddev_Coal_RB_6000,

    VAR_POP(Coal_India_5500_CFR_London_Close_USD) AS var_Coal_India_5500,
    STDDEV_POP(Coal_India_5500_CFR_London_Close_USD) AS stddev_Coal_India_5500,

    VAR_POP(Price_WTI) AS var_Price_WTI,
    STDDEV_POP(Price_WTI) AS stddev_Price_WTI,

    VAR_POP(Price_Brent_Oil) AS var_Price_Brent,
    STDDEV_POP(Price_Brent_Oil) AS stddev_Price_Brent,

    VAR_POP(Price_Dubai_Brent_Oil) AS var_Price_Dubai_Brent,
    STDDEV_POP(Price_Dubai_Brent_Oil) AS stddev_Price_Dubai_Brent,

    VAR_POP(Price_ExxonMobil) AS var_Price_ExxonMobil,
    STDDEV_POP(Price_ExxonMobil) AS stddev_Price_ExxonMobil,

    VAR_POP(Price_Shenhua) AS var_Price_Shenhua,
    STDDEV_POP(Price_Shenhua) AS stddev_Price_Shenhua,

    VAR_POP(Price_All_Share) AS var_Price_All_Share,
    STDDEV_POP(Price_All_Share) AS stddev_Price_All_Share,

    VAR_POP(Price_Mining) AS var_Price_Mining,
    STDDEV_POP(Price_Mining) AS stddev_Price_Mining,

    VAR_POP(Price_LNG_Japan_Korea_Marker_PLATTS) AS var_Price_LNG,
    STDDEV_POP(Price_LNG_Japan_Korea_Marker_PLATTS) AS stddev_Price_LNG,

    VAR_POP(Price_ZAR_USD) AS var_Price_ZAR_USD,
    STDDEV_POP(Price_ZAR_USD) AS stddev_Price_ZAR_USD,

    VAR_POP(Price_Natural_Gas) AS var_Price_Natural_Gas,
    STDDEV_POP(Price_Natural_Gas) AS stddev_Price_Natural_Gas,

    VAR_POP(Price_ICE) AS var_Price_ICE,
    STDDEV_POP(Price_ICE) AS stddev_Price_ICE,

    VAR_POP(Price_Dutch_TTF) AS var_Price_Dutch_TTF,
    STDDEV_POP(Price_Dutch_TTF) AS stddev_Price_Dutch_TTF,

    VAR_POP(Price_Indian_en_exg_rate) AS var_Price_Indian_Exchange,
    STDDEV_POP(Price_Indian_en_exg_rate) AS stddev_Price_Indian_Exchange

FROM fuel;








-- CALCULATING  skewness 






SELECT 
    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Coal_RB_4800_FOB_London_Close_USD - (SELECT AVG(Coal_RB_4800_FOB_London_Close_USD) FROM fuel)) / 
    (SELECT STDDEV_POP(Coal_RB_4800_FOB_London_Close_USD) FROM fuel), 3)) AS skewness_Coal_RB_4800,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Coal_RB_5500_FOB_London_Close_USD - (SELECT AVG(Coal_RB_5500_FOB_London_Close_USD) FROM fuel)) / 
    (SELECT STDDEV_POP(Coal_RB_5500_FOB_London_Close_USD) FROM fuel), 3)) AS skewness_Coal_RB_5500,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Coal_RB_5700_FOB_London_Close_USD - (SELECT AVG(Coal_RB_5700_FOB_London_Close_USD) FROM fuel)) / 
    (SELECT STDDEV_POP(Coal_RB_5700_FOB_London_Close_USD) FROM fuel), 3)) AS skewness_Coal_RB_5700,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Coal_RB_6000_FOB_CurrentWeek_Avg_USD - (SELECT AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) FROM fuel)) / 
    (SELECT STDDEV_POP(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) FROM fuel), 3)) AS skewness_Coal_RB_6000,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Coal_India_5500_CFR_London_Close_USD - (SELECT AVG(Coal_India_5500_CFR_London_Close_USD) FROM fuel)) / 
    (SELECT STDDEV_POP(Coal_India_5500_CFR_London_Close_USD) FROM fuel), 3)) AS skewness_Coal_India_5500,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_WTI - (SELECT AVG(Price_WTI) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_WTI) FROM fuel), 3)) AS skewness_Price_WTI,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_Brent_Oil - (SELECT AVG(Price_Brent_Oil) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_Brent_Oil) FROM fuel), 3)) AS skewness_Price_Brent_Oil,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_Dubai_Brent_Oil - (SELECT AVG(Price_Dubai_Brent_Oil) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_Dubai_Brent_Oil) FROM fuel), 3)) AS skewness_Price_Dubai_Brent_Oil,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_ExxonMobil - (SELECT AVG(Price_ExxonMobil) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_ExxonMobil) FROM fuel), 3)) AS skewness_Price_ExxonMobil,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_Shenhua - (SELECT AVG(Price_Shenhua) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_Shenhua) FROM fuel), 3)) AS skewness_Price_Shenhua,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_All_Share - (SELECT AVG(Price_All_Share) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_All_Share) FROM fuel), 3)) AS skewness_Price_All_Share,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_Mining - (SELECT AVG(Price_Mining) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_Mining) FROM fuel), 3)) AS skewness_Price_Mining,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_LNG_Japan_Korea_Marker_PLATTS - (SELECT AVG(Price_LNG_Japan_Korea_Marker_PLATTS) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_LNG_Japan_Korea_Marker_PLATTS) FROM fuel), 3)) AS skewness_Price_LNG,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_ZAR_USD - (SELECT AVG(Price_ZAR_USD) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_ZAR_USD) FROM fuel), 3)) AS skewness_Price_ZAR_USD,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_Natural_Gas - (SELECT AVG(Price_Natural_Gas) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_Natural_Gas) FROM fuel), 3)) AS skewness_Price_Natural_Gas,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_ICE - (SELECT AVG(Price_ICE) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_ICE) FROM fuel), 3)) AS skewness_Price_ICE,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_Dutch_TTF - (SELECT AVG(Price_Dutch_TTF) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_Dutch_TTF) FROM fuel), 3)) AS skewness_Price_Dutch_TTF,

    (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
    SUM(POWER((Price_Indian_en_exg_rate - (SELECT AVG(Price_Indian_en_exg_rate) FROM fuel)) / 
    (SELECT STDDEV_POP(Price_Indian_en_exg_rate) FROM fuel), 3)) AS skewness_Price_Indian_en_exg_rate

FROM fuel;








-- CALCULATING kurtosis






WITH stats AS (
    SELECT 
        COUNT(*) AS n,
        
        AVG(Coal_RB_4800_FOB_London_Close_USD) AS avg_Coal_RB_4800,
        STDDEV(Coal_RB_4800_FOB_London_Close_USD) AS stddev_Coal_RB_4800,

        AVG(Coal_RB_5500_FOB_London_Close_USD) AS avg_Coal_RB_5500,
        STDDEV(Coal_RB_5500_FOB_London_Close_USD) AS stddev_Coal_RB_5500,

        AVG(Coal_RB_5700_FOB_London_Close_USD) AS avg_Coal_RB_5700,
        STDDEV(Coal_RB_5700_FOB_London_Close_USD) AS stddev_Coal_RB_5700,

        AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS avg_Coal_RB_6000,
        STDDEV(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS stddev_Coal_RB_6000,

        AVG(Coal_India_5500_CFR_London_Close_USD) AS avg_Coal_India_5500,
        STDDEV(Coal_India_5500_CFR_London_Close_USD) AS stddev_Coal_India_5500,

        AVG(Price_WTI) AS avg_Price_WTI,
        STDDEV(Price_WTI) AS stddev_Price_WTI,

        AVG(Price_Brent_Oil) AS avg_Price_Brent,
        STDDEV(Price_Brent_Oil) AS stddev_Price_Brent,

        AVG(Price_Dubai_Brent_Oil) AS avg_Price_Dubai,
        STDDEV(Price_Dubai_Brent_Oil) AS stddev_Price_Dubai,

        AVG(Price_ExxonMobil) AS avg_Price_Exxon,
        STDDEV(Price_ExxonMobil) AS stddev_Price_Exxon,

        AVG(Price_Shenhua) AS avg_Price_Shenhua,
        STDDEV(Price_Shenhua) AS stddev_Price_Shenhua,

        AVG(Price_All_Share) AS avg_Price_All_Share,
        STDDEV(Price_All_Share) AS stddev_Price_All_Share,

        AVG(Price_Mining) AS avg_Price_Mining,
        STDDEV(Price_Mining) AS stddev_Price_Mining,

        AVG(Price_LNG_Japan_Korea_Marker_PLATTS) AS avg_Price_LNG,
        STDDEV(Price_LNG_Japan_Korea_Marker_PLATTS) AS stddev_Price_LNG,

        AVG(Price_ZAR_USD) AS avg_Price_ZAR,
        STDDEV(Price_ZAR_USD) AS stddev_Price_ZAR,

        AVG(Price_Natural_Gas) AS avg_Price_Natural_Gas,
        STDDEV(Price_Natural_Gas) AS stddev_Price_Natural_Gas,

        AVG(Price_ICE) AS avg_Price_ICE,
        STDDEV(Price_ICE) AS stddev_Price_ICE,

        AVG(Price_Dutch_TTF) AS avg_Price_TTF,
        STDDEV(Price_Dutch_TTF) AS stddev_Price_TTF,

        AVG(Price_Indian_en_exg_rate) AS avg_Price_INR,
        STDDEV(Price_Indian_en_exg_rate) AS stddev_Price_INR

    FROM fuel
)
SELECT 'Coal_RB_4800_FOB_London_Close_USD' AS Column_Name,
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Coal_RB_4800_FOB_London_Close_USD - stats.avg_Coal_RB_4800) / stats.stddev_Coal_RB_4800, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3))) AS Kurtosis
FROM stats

UNION ALL

SELECT 'Coal_RB_5500_FOB_London_Close_USD',
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Coal_RB_5500_FOB_London_Close_USD - stats.avg_Coal_RB_5500) / stats.stddev_Coal_RB_5500, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats

UNION ALL

SELECT 'Coal_RB_5700_FOB_London_Close_USD',
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Coal_RB_5700_FOB_London_Close_USD - stats.avg_Coal_RB_5700) / stats.stddev_Coal_RB_5700, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats

UNION all

(SELECT 'Coal_RB_6000_FOB_CurrentWeek_Avg_USD', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Coal_RB_6000_FOB_CurrentWeek_Avg_USD - stats.avg_Coal_RB_6000) / stats.stddev_Coal_RB_6000, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Coal_India_5500_CFR_London_Close_USD', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Coal_India_5500_CFR_London_Close_USD - stats.avg_Coal_India_5500) / stats.stddev_Coal_India_5500, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_WTI', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_WTI - stats.avg_Price_WTI) / stats.stddev_Price_WTI, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_Brent_Oil', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_Brent_Oil - stats.avg_Price_Brent) / stats.stddev_Price_Brent, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_Dubai_Brent_Oil', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_Dubai_Brent_Oil - stats.avg_Price_Dubai) / stats.stddev_Price_Dubai, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_ExxonMobil', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_ExxonMobil - stats.avg_Price_Exxon) / stats.stddev_Price_Exxon, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_Shenhua', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_Shenhua - stats.avg_Price_Shenhua) / stats.stddev_Price_Shenhua, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_All_Share', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_All_Share - stats.avg_Price_All_Share) / stats.stddev_Price_All_Share, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_Mining', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_Mining - stats.avg_Price_Mining) / stats.stddev_Price_Mining, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_LNG_Japan_Korea_Marker_PLATTS', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_LNG_Japan_Korea_Marker_PLATTS - stats.avg_Price_LNG) / stats.stddev_Price_LNG, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_ZAR_USD', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_ZAR_USD - stats.avg_Price_ZAR) / stats.stddev_Price_ZAR, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_Natural_Gas', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_Natural_Gas - stats.avg_Price_Natural_Gas) / stats.stddev_Price_Natural_Gas, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_ICE', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_ICE - stats.avg_Price_ICE) / stats.stddev_Price_ICE, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_Dutch_TTF', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_Dutch_TTF - stats.avg_Price_TTF) / stats.stddev_Price_TTF, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats)

UNION ALL

(SELECT 'Price_Indian_en_exg_rate', 
    (stats.n * (stats.n + 1) / ((stats.n - 1) * (stats.n - 2) * (stats.n - 3))) * 
    (SELECT SUM(POWER((Price_Indian_en_exg_rate - stats.avg_Price_INR) / stats.stddev_Price_INR, 4)) FROM fuel) -
    (3 * POWER(stats.n - 1, 2) / ((stats.n - 2) * (stats.n - 3)))
FROM stats);

;
