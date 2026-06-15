-- ============================================
-- QUESTION 11: Operational Efficiency Leader
-- ============================================
-- BUSINESS QUESTION:
-- Which company produces the least direct emissions per dollar of profit?
--
-- METHODOLOGY:
-- (total_scope_1_2 * 1,000,000) / (ebitda / 1,000,000)
-- Result = tonnes of CO2e per $1M EBITDA
--
-- ASSUMPTIONS:
-- Lower number = more operationally efficient
-- Scope 1+2 represents emissions the company directly controls
--
-- RESULTS INTERPRETATION:
-- Microsoft (16 tonnes/$1M) and Alphabet (20) are most efficient.
-- FedEx (1,953) is least efficient - their operations are carbon-intensive.
-- Among oil majors, Shell (659) leads in operational efficiency.
-- ============================================
SELECT
company,
ROUND((total_scope_1_2 * 1000000) / (ebitda / 1000000), 0) AS
scope_1_2_per_million_ebitda
FROM emissions_data
ORDER BY 2 DESC;
