-- ============================================
-- QUESTION 12: Three-Factor Risk Score
-- ============================================
-- BUSINESS QUESTION:
-- Which companies face the highest overall climate risk combining:
-- 1. Financial exposure (emissions cost as % of EBITDA)
-- 2. Supply chain reliance (Scope 3 % of total emissions)
-- 3. Absolute scale (total emissions)
--
-- METHODOLOGY:
-- Rank each factor from 1 (lowest risk/best) to 9 (highest risk/worst)
-- Sum the three ranks. Lower total score = lower overall risk
--
-- ASSUMPTIONS:
-- All three factors weighted equally
--
-- RESULTS INTERPRETATION:
-- BP (23) is highest risk. Alphabet (7) is lowest risk.
-- All five oil majors occupy the top 5 risk positions (scores 17-23).
-- Tech (Alphabet, Microsoft) and logistics (FedEx, UPS) show much lower risk.
-- ============================================
WITH risk_factors AS(
SELECT
company,
scope_3 * 1000000 AS scope_3,
ROUND((monetized_total / ebitda) * 100, 2) AS emission_cost_per_ebitda,
ROUND((scope_3 / total_emissions) * 100, 2) AS scope_3_pct_of_total,
total_emissions
FROM emissions_data
)
SELECT
*,
(RANK() OVER (ORDER BY emission_cost_per_ebitda) +
RANK() OVER (ORDER BY scope_3_pct_of_total) +
RANK() OVER (ORDER BY total_emissions)) AS total_risk_score
FROM risk_factors
ORDER BY total_risk_score;