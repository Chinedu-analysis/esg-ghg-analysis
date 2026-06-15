-- ============================================
-- QUESTION 2: Scope 3 Percentage of Total Emissions
-- ============================================
-- BUSINESS QUESTION:
-- What percentage of each company's total emissions comes from Scope 3?
--
-- METHODOLOGY:
-- (scope_3 / total_emissions) * 100
--
-- ASSUMPTIONS:
-- Scope 3 includes 15 categories (purchased goods, business travel, product use, etc.)
--
-- RESULTS INTERPRETATION:
-- BP has the highest Scope 3 percentage at 90.75%.
-- FedEx has the lowest at 19.20%, meaning their direct operations (fleet)
-- dominate their emissions profile rather than supply chain.
-- Most companies are between 84-90%, showing high supply chain reliance.
-- ============================================
SELECT
company,
ROUND((scope_3 / total_emissions) * 100, 2) AS scope3_pct
FROM emissions_data
ORDER BY scope3_pct DESC;
