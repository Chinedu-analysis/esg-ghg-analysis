# Corporate GHG Emissions Analysis - ESG Portfolio

## Executive Summary

This portfolio analyzes greenhouse gas emissions data for nine major global companies (BP, Shell, ExxonMobil, Chevron, TotalEnergies, Microsoft, Alphabet, UPS, FedEx) for the 2023 reporting year. The analysis addresses the Environmental (E) pillar of ESG through thirteen structured business questions, revealing patterns in emissions concentration, carbon pricing exposure, operational efficiency, and multi-factor climate risk.

**Three headline findings emerged:**

1. **Emissions are highly concentrated.** The top five emitters (all oil majors) control 96.6% of total emissions across the dataset. ExxonMobil alone represents 25.1% of the total.

2. **The dataset uses a uniform $236/tonne carbon price.** This implicit price is applied consistently across all nine companies, converting total emissions to monetized values. This is significantly higher than the global average carbon price (~$21/tonne), making the financial exposure analysis conservative.

3. **BP faces the highest multi-factor climate risk.** When combining financial exposure (emissions cost as % of EBITDA), supply chain reliance (Scope 3 %), and absolute emissions scale, BP ranks worst. ExxonMobil ranks best among oil majors, while Microsoft and Alphabet show the lowest overall risk.

**Additional insights** include the finding that company size (EBITDA) shows no correlation with Scope 3 percentage — industry sector, not scale, drives supply chain emissions exposure. FedEx emerges as the least operationally efficient (1,953 tonnes CO2e per $1M EBITDA), while Microsoft is the most efficient (16 tonnes per $1M EBITDA).

All analysis was conducted in PostgreSQL with data cleaning performed in Power Query. Visualizations were built using Python (Matplotlib/Seaborn). This project demonstrates the analytical rigor, domain awareness, and communication skills required for ESG Analyst and Sustainability Data Analyst roles.

---

## Overview

This project analyzes greenhouse gas emissions data for nine major global companies across oil & gas, technology, and logistics sectors for the 2023 reporting year. The analysis addresses real-world ESG (Environmental) questions and demonstrates core skills required for ESG Analyst, Sustainability Analyst, and Climate Risk Analyst roles by translating complex business questions into technical SQL queries with actionable insights.

**Data Source:** Company sustainability reports (BP, Shell, ExxonMobil, Chevron, TotalEnergies, Microsoft, Alphabet, UPS, FedEx) for the 2023 reporting year.

**Units:** All emissions values are in million metric tonnes of CO2 equivalent (Mt CO2e) per the GHG Protocol Corporate Standard.

---

## Business Questions

1. **Total Emissions Ranking:** Which companies have the highest and lowest total emissions?
2. **Scope 3 Percentage:** What percentage of each company's total emissions comes from Scope 3 (supply chain and product use)?
3. **Emissions Cost Exceeding EBITDA:** Which companies have monetized emissions costs that exceed their operating profit?
4. **Monetized Intensity Ratio:** How many dollars of emissions cost does each company incur per dollar of EBITDA?
5. **Hidden Climate Risk:** Which company has the largest gap between Scope 3 and direct operations emissions (Scope 1+2)?
6. **Size vs. Scope 3 Relationship:** Do larger companies (higher EBITDA) have different Scope 3 profiles than smaller ones?
7. **Implicit Carbon Price:** What carbon price per tonne is embedded in the dataset's monetized emissions column?
8. **Carbon Tax Exposure (Scope 1 Only):** At $50/tonne carbon tax, which companies are most exposed as a percentage of EBITDA?
9. **Carbon Tax Exposure (Scope 1+2 Combined):** How does exposure change when purchased electricity emissions are included?
10. **Concentration Risk:** What percentage of total emissions across all companies does each company represent?
11. **Operational Efficiency:** Which company produces the least direct emissions (Scope 1+2) per dollar of profit?
12. **Three-Factor Risk Score:** Which companies face the highest overall climate risk when combining financial exposure, supply chain reliance, and absolute scale?
13. **Oil Major Comparison:** Among the five oil majors, which is least exposed to carbon pricing?

---

## Analysis Approach

### 1. Total Emissions Ranking

**Methodology:** Simple ranking of `total_emissions` from highest to lowest.

**📊 Visualization:**
![Total Emissions Ranking](/visualizations/01_q1_total_emissions_ranking.png)

**📊 Key Findings:**
- ExxonMobil has the highest total emissions (639 Mt CO2e)
- Microsoft has the lowest among the nine companies (12.36 Mt CO2e)
- Oil majors occupy all top 5 positions

**💡 Business Insight:**
Climate risk mitigation efforts should prioritize oil majors, as they drive the vast majority of absolute emissions in this dataset.

---

### 2. Scope 3 Percentage

**Methodology:** Calculated as `(scope_3 / total_emissions) × 100`.

**📊 Visualization:**
![Scope 3 Percentage](/visualizations/02_q2_scope3_percentage.png)

**📊 Key Findings:**
- BP has the highest Scope 3 percentage (90.75%)
- FedEx has the lowest (19.20%)
- Most companies are between 84-90%, showing high supply chain reliance

**💡 Business Insight:**
FedEx's low Scope 3 percentage indicates their emissions profile is dominated by direct operations (fleet), while most other companies have significant "hidden" emissions in their supply chain or product use.

---

### 3. Emissions Cost Exceeding EBITDA

**Methodology:** Filtered where `monetized_total > ebitda`.

**📊 Visualization:**
![Emissions Cost Exceeding EBITDA](/visualizations/03_q3_emissions_cost_exceeding_ebitda.png)

**📊 Key Findings:**
- Five companies (BP, ExxonMobil, Shell, Chevron, TotalEnergies) have monetized emissions costs exceeding EBITDA
- BP's emissions cost ($81.9B) is more than double its EBITDA ($32.4B) — a ratio of 2.53x
- Tech and logistics companies are not in this list

**💡 Business Insight:**
Oil majors are financially exposed to carbon pricing. A $236/tonne carbon price would turn their operating profits negative. This represents significant transition risk.

---

### 4. Monetized Intensity Ratio

**Methodology:** Calculated as `monetized_total / ebitda`.

**📊 Visualization:**
![Monetized Intensity Ratio](/visualizations/04_q4_monetized_intensity_ratio.png)

**📊 Key Findings:**
- BP: $2.53 of emissions cost per $1 of EBITDA
- Microsoft: $0.03 of emissions cost per $1 of EBITDA
- Oil majors face 50-80x higher intensity than tech companies

**💡 Business Insight:**
Investors concerned about carbon pricing exposure should note the dramatic difference between sectors. Tech companies are largely insulated from direct carbon costs at current price levels.

---

### 5. Hidden Climate Risk (Scope 3 vs. Scope 1+2 Gap)

**Methodology:** Calculated as `scope_3 - total_scope_1_2`.

**📊 Visualization:**
![Scope 3 Gap](/visualizations/05_q5_scope3_vs_scope1_2_gap.png)

**📊 Key Findings:**
- Shell has the largest gap at 460 million tonnes
- FedEx shows a negative gap (-13.7 Mt), meaning direct emissions exceed Scope 3
- Oil majors show gaps of 280-460 Mt

**💡 Business Insight:**
Companies with large positive gaps face higher transition risk if Scope 3 emissions come under regulation. FedEx's negative gap means most of their emissions are directly controllable through fleet electrification.

---

### 6. Company Size vs. Scope 3 Relationship

**Methodology:** Split companies into High EBITDA (above median) and Low EBITDA (below median) groups.

**📊 Visualization:**
![Size vs. Scope 3](/visualizations/06_q6_size_vs_scope3.png)

**📊 Key Findings:**
- No clear pattern between company size and Scope 3 percentage
- High EBITDA group includes both very high Scope 3 (Chevron 405 Mt) and very low Scope 3 (Alphabet 15 Mt)
- Industry sector, not size, drives Scope 3 variation

**💡 Business Insight:**
Don't assume larger companies have proportionally larger supply chain emissions. Industry-specific factors (e.g., product use emissions for oil) dominate the Scope 3 profile.

---

### 7. Implicit Carbon Price

**Methodology:** Calculated as `monetized_total / (total_emissions × 1,000,000)`.

**📊 Visualization:**
![Implicit Carbon Price](/visualizations/07_q7_implicit_carbon_price.png)

**📊 Key Findings:**
- Every company shows exactly $236 per metric tonne CO2e
- The dataset uses a uniform internal carbon price across all companies
- This is significantly higher than the global average (~$21/tonne)

**💡 Business Insight:**
The monetized values are purely mechanical (`total_emissions × 236`), not reflecting different abatement costs or regional carbon prices. This is a methodological limitation to document.

---

### 8. Carbon Tax Exposure (Scope 1 Only) — $50/tonne

**Methodology:** Calculated tax as `(scope_1 × 1,000,000 × 50) / ebitda × 100`.

**📊 Visualization:**
![Carbon Tax Scope 1](/visualizations/08_q8_q9_carbon_tax_comparison.png)

**📊 Key Findings:**
- FedEx is most exposed (9.30% of EBITDA)
- Tech companies are virtually unaffected (0.01%)
- Oil majors cluster between 2.89-5.13%

**💡 Business Insight:**
Even at a moderate $50/tonne carbon price, logistics companies show meaningful EBITDA exposure. FedEx should prioritize fleet electrification and operational efficiency.

---

### 9. Carbon Tax Exposure (Scope 1+2 Combined) — $50/tonne

**Methodology:** Calculated tax as `(total_scope_1_2 × 1,000,000 × 50) / ebitda × 100`.

**📊 Visualization:**
![Carbon Tax Scope 1+2](/visualizations/08_q8_q9_carbon_tax_comparison.png)

**📊 Key Findings:**
- Adding Scope 2 increases exposure for all companies
- FedEx remains most exposed (9.77%)
- Tech companies move from 0.01% to 0.08-0.10% due to electricity use

**💡 Business Insight:**
Purchased electricity (Scope 2) is a minor factor for most companies in this dataset. Direct operational emissions (Scope 1) drive the overwhelming majority of carbon tax exposure.

---

### 10. Concentration Risk

**Methodology:** Calculated as `(company total_emissions / sum of all companies' total_emissions) × 100`.

**📊 Visualization:**
![Concentration Risk](/visualizations/09_q10_concentration_risk.png)

**📊 Key Findings:**
- Top 5 emitters (all oil majors) control 96.6% of total emissions
- ExxonMobil alone represents 25.1%
- Microsoft, Alphabet, FedEx, and UPS combined represent only 3.34%

**💡 Business Insight:**
Climate risk is highly concentrated. Investors concerned about portfolio emissions should focus engagement efforts on oil majors, not spread attention evenly across all holdings.

---

### 11. Operational Efficiency

**Methodology:** Calculated as `(total_scope_1_2 × 1,000,000,000,000) / ebitda` — result is tonnes of CO2e per $1M EBITDA.

**📊 Visualization:**
![Operational Efficiency](/visualizations/10_q11_operational_efficiency.png)

**📊 Key Findings:**
- Microsoft is most efficient (16 tonnes/$1M EBITDA)
- FedEx is least efficient (1,953 tonnes/$1M EBITDA)
- Among oil majors, Shell leads (659 tonnes/$1M EBITDA)

**💡 Business Insight:**
FedEx's high emissions intensity per dollar of profit indicates significant room for operational improvement and potential vulnerability to carbon pricing on direct operations.

---

### 12. Three-Factor Risk Score

**Methodology:** Ranked each company on three factors (1 = lowest risk, 9 = highest risk), then summed ranks:

- Factor 1: Financial exposure (`monetized_total / ebitda × 100`)
- Factor 2: Supply chain reliance (`scope_3 / total_emissions × 100`)
- Factor 3: Absolute scale (`total_emissions`)

**📊 Visualization:**
![Three-Factor Risk Score](/visualizations/11_q12_three_factor_risk_score.png)

**📊 Key Findings:**
- BP has the highest risk score (23)
- Alphabet has the lowest risk score (7)
- All five oil majors occupy the top 5 risk positions

**💡 Business Insight:**
The risk score provides a single metric for comparing climate risk across diverse sectors. BP emerges as the highest overall risk due to extreme financial exposure combined with high Scope 3 percentage.

---

### 13. Oil Major Comparison

**Methodology:** Compared `emissions_intensity_percentage` for the five oil majors.

**📊 Visualization:**
![Oil Major Comparison](/visualizations/12_q13_oil_major_comparison.png)

**📊 Key Findings:**
- ExxonMobil is least exposed (147% of EBITDA)
- BP is most exposed (253% of EBITDA)
- Ranking from best to worst: ExxonMobil → Shell → Chevron → TotalEnergies → BP

**💡 Business Insight:**
ExxonMobil's lower intensity suggests either more efficient operations or different emissions reporting boundaries. Investors should examine methodology disclosures before drawing conclusions.

---

## Cross-Cutting Observation

The dataset uses a **uniform $236/tonne implicit carbon price** across all nine companies. While this allows for consistent comparison, it does not reflect real-world carbon pricing variation (global average ~$21/tonne, EU ETS ~$68/tonne). This means the monetized values and intensity ratios are best used for **relative ranking** rather than absolute financial forecasting.

---

## Strategic Recommendations

### For Oil & Gas Companies
- **BP:** Highest multi-factor risk. Prioritize Scope 3 reduction (product use emissions) and diversify portfolio away from highest-carbon products.
- **ExxonMobil:** Lowest intensity among oil majors. Maintain operational efficiency advantage while accelerating low-carbon investments.
- **All oil majors:** Develop robust internal carbon pricing aligned with future regulatory scenarios ($100+/tonne by 2030).

### For Logistics Companies
- **FedEx:** High operational emissions intensity. Fleet electrification and route optimization should be top capital priorities.
- **Both FedEx and UPS:** Model exposure to carbon taxes at various price points ($50, $100, $150/tonne) as part of financial risk assessment.

### For Technology Companies
- **Microsoft and Alphabet:** Continue low direct emissions advantage. Scope 3 (supply chain) represents the primary risk — map supplier emissions and set procurement standards.

### For ESG Data Systems
- **Unit standardization:** Explicitly document that all emissions are in million metric tonnes CO2e.
- **Carbon price transparency:** Disclose the carbon price assumption used for monetization.
- **Scope breakdowns:** Provide separate reporting for Scope 3 categories (purchased goods, business travel, product use, etc.) for more granular analysis.

---

## Technical Details

| Category | Details |
| :--- | :--- |
| Analysis Tool | PostgreSQL 17 |
| Data Cleaning | Power Query (Excel) |
| Visualization | Python (Matplotlib, Seaborn) |
| Key Metrics | Total Emissions (Mt CO2e), Scope 3 %, Intensity Ratio, Risk Score |
| Data Source | Company sustainability reports (2023) |
| Companies Analyzed | BP, Shell, ExxonMobil, Chevron, TotalEnergies, Microsoft, Alphabet, UPS, FedEx |
| Records Analyzed | 9 companies, 13 analysis queries |

---

## SQL Code Structure

All analysis queries are organized as separate SQL files:


Each SQL file includes:
- Business question statement
- Methodology explanation
- Key assumptions documented
- Results interpretation

---

## Methodology Note

**Emissions Units:** All emissions values are in million metric tonnes of CO2 equivalent (Mt CO2e) per the GHG Protocol Corporate Standard.

**Implicit Carbon Price:** Derived as `monetized_total / (total_emissions × 1,000,000)`. The consistent $236/tonne across all companies indicates the dataset uses a uniform internal carbon price rather than region- or sector-specific prices.

**Fatality Density Equivalent:** In the absence of hours-worked data for a full carbon intensity calculation (e.g., tonnes per employee or tonnes per revenue), this analysis uses emissions intensity per EBITDA as a proxy for cross-company comparison.

---

## Appropriate Use

This project is intended for:
- ESG research and benchmarking
- Educational demonstrations of GHG accounting
- Climate risk assessment methodologies
- SQL portfolio development for sustainability roles

This project is **not** intended for:
- Investment decisions without additional validation
- Regulatory compliance reporting
- Replacement of audited company disclosures
- Legal proceedings or carbon liability assessment

---

## Visualizations

All 13 visualizations are available in the `/visualizations` directory:

| Chart | File Name |
| :--- | :--- |
| Total Emissions Ranking | `01_q1_total_emissions_ranking.png` |
| Scope 3 Percentage | `02_q2_scope3_percentage.png` |
| Emissions Cost Exceeding EBITDA | `03_q3_emissions_cost_exceeding_ebitda.png` |
| Monetized Intensity Ratio | `04_q4_monetized_intensity_ratio.png` |
| Scope 3 Gap | `05_q5_scope3_vs_scope1_2_gap.png` |
| Size vs. Scope 3 | `06_q6_size_vs_scope3.png` |
| Implicit Carbon Price | `07_q7_implicit_carbon_price.png` |
| Carbon Tax Comparison | `08_q8_q9_carbon_tax_comparison.png` |
| Concentration Risk | `09_q10_concentration_risk.png` |
| Operational Efficiency | `10_q11_operational_efficiency.png` |
| Three-Factor Risk Score | `11_q12_three_factor_risk_score.png` |
| Oil Major Comparison | `12_q13_oil_major_comparison.png` |
| Master Dashboard | `13_master_dashboard.png` |

---

*Built with PostgreSQL 17, Power Query, and Python (Matplotlib/Seaborn). All findings are based on 2023 sustainability report data and should not be interpreted as investment advice or regulatory compliance verification without independent validation.*

*Data sources: BP, Shell, ExxonMobil, Chevron, TotalEnergies, Microsoft, Alphabet (Google), UPS, FedEx sustainability reports for the 2023 reporting year.*
