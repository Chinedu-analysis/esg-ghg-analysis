-- ============================================
-- QUESTION 10: Concentration Risk
-- ============================================
-- BUSINESS QUESTION:
-- What percentage of total emissions across all companies does each company represent?
--
-- METHODOLOGY:
-- pct_of_total = (company total_emissions / sum of all companies' total_emissions) * 100
--
-- ASSUMPTIONS:
-- Dataset includes 9 major global companies (not exhaustive)
--
-- RESULTS INTERPRETATION:
-- The top 5 emitters (all oil majors) control 96.64% of total emissions.
-- ExxonMobil alone represents 25.07%.
-- Microsoft, Alphabet, FedEx, and UPS combined represent only 3.34%.
-- Climate risk is highly concentrated in the oil and gas sector.
-- ============================================
WITH total_emissions AS(
SELECT
company,
total_emissions,
SUM(total_emissions * 1000000) OVER () AS sum_total_emissions
FROM emissions_data
)
SELECT
company,
total_emissions,
sum_total_emissions,
ROUND(((total_emissions * 1000000) / sum_total_emissions) * 100, 2) AS
pct_of_total_emissions
FROM total_emissions
ORDER BY 4 DESC;