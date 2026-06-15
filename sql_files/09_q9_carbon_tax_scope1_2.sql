-- ============================================
-- QUESTION 9: Carbon Tax Exposure - Scope 1+2 Combined ($50/tonne)
-- ============================================
-- BUSINESS QUESTION:
-- If a $50/tonne carbon tax is applied to Scope 1 and Scope 2 combined,
-- which companies are most exposed as a percentage of EBITDA?
--
-- METHODOLOGY:
-- tax_amount = (scope_1 + scope_2) * 1,000,000 * 50
-- tax_pct = (tax_amount / ebitda) * 100
--
-- ASSUMPTIONS:
-- $50/tonne hypothetical carbon price
-- Scope 2 includes purchased electricity emissions
--
-- RESULTS INTERPRETATION:
-- Adding Scope 2 increases exposure for all companies.
-- FedEx remains most exposed (9.77%).
-- Ranking order remains largely unchanged from Q8.
-- Tech companies move from 0.01% to 0.08-0.10% due to electricity use.
-- ============================================
SELECT
company,
(total_scope_1_2 * 1000000) * 50 AS "carbon_tax_scenario (Scope 1 & 2)",
ROUND((((total_scope_1_2 * 1000000) * 50 ) / ebitda) * 100, 2) AS tax_pct_of_ebitda,
RANK() OVER (ORDER BY ROUND((((total_scope_1_2 * 1000000) * 50 ) / ebitda) * 100, 2)
DESC) AS pct_ranking
FROM emissions_data;