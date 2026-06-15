-- ============================================
-- QUESTION 6: Company Size vs. Scope 3 Relationship
-- ============================================
-- BUSINESS QUESTION:
-- Do larger companies (higher EBITDA) have different Scope 3 profiles than smaller ones?
-- -- METHODOLOGY:
-- Calculated median EBITDA, split companies into High and Low EBITDA groups
--
-- ASSUMPTIONS:
-- Median used as split point to create two roughly equal groups
--
-- RESULTS INTERPRETATION:
-- No clear pattern. High EBITDA group includes both very high Scope 3 (Chevron 405 Mt)
-- and very low Scope 3 (Alphabet 15 Mt). Industry sector appears to drive
-- Scope 3 variation more than company size.
-- ============================================
WITH ebitda_median AS(
SELECT
percentile_cont(.5) WITHIN GROUP (ORDER BY ebitda) AS median_ebitda
FROM emissions_data
),
company_category AS (
SELECT
company,
scope_3 AS "scope_3 (in million tonnes)",
CASE
WHEN ebitda >= median_ebitda THEN 'High EBITDA'
ELSE 'Low EBITDA'
END AS ebitda_category
FROM emissions_data, ebitda_median
)
SELECT
*
FROM company_category
ORDER BY ebitda_category;
