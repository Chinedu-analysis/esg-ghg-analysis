-- ============================================
-- QUESTION 5: Scope 3 vs. Scope 1+2 Gap (Hidden Climate Risk)
-- ============================================
-- BUSINESS QUESTION:
-- Which company has the largest gap between Scope 3 and direct operations emissions?
--
-- METHODOLOGY:
-- scope_3 - total_scope_1_2
--
-- ASSUMPTIONS:
-- Larger positive gap means more emissions are "hidden" in supply chain or product use
--
-- RESULTS INTERPRETATION:
-- Shell has the largest gap at 460 million tonnes.
-- FedEx shows a negative gap (-13.7M), meaning their direct emissions
-- actually exceed their Scope 3 emissions - unusual for most companies.
-- ============================================
SELECT
company,
(scope_3 - total_scope_1_2) AS "scope_range (in million tonnes)"
FROM emissions_data
ORDER BY scope_3 - total_scope_1_2 DESC;