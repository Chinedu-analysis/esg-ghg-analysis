-- ============================================
-- QUESTION 7: Verify Implicit Carbon Price
-- ============================================
-- BUSINESS QUESTION:
-- What carbon price per tonne is embedded in the dataset's monetized emissions?
--
-- METHODOLOGY:
-- monetized_total / (total_emissions * 1,000,000)
-- (Multiply by 1,000,000 to convert million tonnes to tonnes)
--
-- ASSUMPTIONS:
-- Monetized_total represents social cost of carbon applied to total emissions
--
-- RESULTS INTERPRETATION:
-- EVERY company shows exactly $236 per metric tonne CO2e.
-- The dataset uses a uniform internal carbon price across all companies.
-- This is significantly higher than the global average (~$21/tonne).
-- ============================================
SELECT
company,
total_emissions,
monetized_total,
ROUND(monetized_total / (total_emissions * 1000000), 0) AS carbon_tax_per_tonne
FROM emissions_data;