-- ============================================
-- QUESTION 1: Total Emissions Ranking
-- ============================================
-- BUSINESS QUESTION:
-- Which companies have the highest and lowest total emissions?
--
-- METHODOLOGY:
-- Simple ranking of total_emissions from highest to lowest
--
-- ASSUMPTIONS:
-- Total emissions = Scope 1 + Scope 2 + Scope 3
-- All values in million metric tonnes CO2e
--
-- RESULTS INTERPRETATION:
-- ExxonMobil (639 Mt) has the highest total emissions.
-- Microsoft (12.36 Mt) has the lowest among the nine companies.
-- Oil majors dominate the top 5 positions.
-- ============================================
SELECT
company,
total_emissions
FROM emissions_data
ORDER BY total_emissions DESC;