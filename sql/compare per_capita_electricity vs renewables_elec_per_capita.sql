CREATE OR REPLACE VIEW Compare_per_capita_electricity_vs_renewables_elec_per_capita AS

SELECT
    year,
    per_capita_electricity,                 -- total electricity per person (kWh/person)
    renewables_elec_per_capita,             -- renewable electricity per person (kWh/person)

    -- GAP: how much of total per capita electricity is NOT renewable
    (per_capita_electricity - renewables_elec_per_capita) AS non_renewable_per_capita,

    -- PERCENT renewable share per capita
    
        (renewables_elec_per_capita / NULLIF(per_capita_electricity, 0)) * 100
        
     AS renewables_share_per_capita_pct


	 
        
FROM ng_energy
WHERE country = 'Nigeria' AND year BETWEEN 2000 AND 2024
ORDER BY year;
