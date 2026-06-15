-- ============================================
-- QUESTION 3: Emissions Cost Exceeding EBITDA
-- ============================================
-- BUSINESS QUESTION:
-- Which companies have monetized emissions costs that exceed their operating profit?
--
-- METHODOLOGY:
-- Filter where monetized_total > ebitda
--
-- ASSUMPTIONS:
-- Monetized_total uses the dataset's implicit $236/tonne carbon price
--
-- RESULTS INTERPRETATION:
-- Five companies (BP, ExxonMobil, Shell, Chevron, TotalEnergies) all show
-- monetized emissions costs greater than their EBITDA.
-- BP's emissions cost ($81.9B) is more than double its EBITDA ($32.4B).
-- Tech and logistics companies are not in this list.
-- ============================================
SELECT
company,
monetized_total,
ebitda
FROM emissions_data
WHERE monetized_total > ebitda;