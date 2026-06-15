-- ============================================
-- QUESTION 13: Oil Major Comparison
-- ============================================
-- BUSINESS QUESTION:
-- Among the five oil majors, which is least exposed to carbon pricing?
--
-- METHODOLOGY:
-- Compare emissions_intensity_percentage = (monetized_total / ebitda) * 100
-- Lower percentage = less financial exposure per dollar of profit
--
-- ASSUMPTIONS:
-- Dataset uses uniform $236/tonne carbon price across all companies
--
-- RESULTS INTERPRETATION:
-- ExxonMobil (147%) is least exposed among oil majors.
-- BP (253%) is most exposed - emissions cost 2.5x their operating profit.
-- Ranking from best to worst: ExxonMobil → Shell → Chevron → TotalEnergies → BP
-- ============================================
SELECT
company,
emissions_intensity_percentage AS oil_companies_emissions_intensity_percentage
FROM emissions_data
WHERE company IN ('BP', 'Shell', 'ExxonMobil', 'Chevron', 'TotalEnergies')
ORDER BY 2;