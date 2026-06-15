-- ============================================
-- QUESTION 8: Carbon Tax Exposure - Scope 1 Only ($50/tonne)
-- ============================================
-- BUSINESS QUESTION:
-- If a $50/tonne carbon tax is applied to Scope 1 emissions only,
-- which companies are most exposed as a percentage of EBITDA?
--
-- METHODOLOGY:
-- tax_amount = scope_1 * 1,000,000 * 50
-- tax_pct = (tax_amount / ebitda) * 100
--
-- ASSUMPTIONS:
-- $50/tonne is a hypothetical moderate carbon price
-- Tax applies only to direct operational emissions
--
-- RESULTS INTERPRETATION:
-- FedEx (9.30% of EBITDA) is most exposed due to large fleet emissions.
-- Tech companies (Microsoft, Alphabet at 0.01%) are virtually unaffected.
-- Oil majors cluster between 2.89-5.13%.
-- ============================================
SELECT
company,
(scope_1 * 1000000) * 50 AS "carbon_tax_scenario (Scope 1)",
ROUND((((scope_1 * 1000000) * 50 ) / ebitda) * 100, 2) AS tax_pct_of_ebitda,
RANK() OVER (ORDER BY ROUND((((scope_1 * 1000000) * 50 ) / ebitda) * 100, 2) DESC)
AS pct_ranking
FROM emissions_data;