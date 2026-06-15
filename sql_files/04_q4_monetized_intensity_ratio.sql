-- ============================================
-- QUESTION 4: Monetized Emissions Intensity Ratio
-- ============================================
-- BUSINESS QUESTION:
-- How many dollars of emissions cost does each company incur per dollar of EBITDA?
--
-- METHODOLOGY:
-- monetized_total / ebitda
--
-- ASSUMPTIONS:
-- Ratio > 1 means emissions cost exceeds profit
-- Ratio < 1 means emissions cost is less than profit
--
-- RESULTS INTERPRETATION:
-- BP (2.53): $2.53 of emissions cost per $1 of EBITDA
-- Microsoft (0.03): $0.03 of emissions cost per $1 of EBITDA
-- Oil majors face 50-80x higher intensity than tech companies.
-- ============================================
SELECT
company,
ROUND(monetized_total / ebitda, 2) AS calculated_intensity_ratio
FROM emissions_data;