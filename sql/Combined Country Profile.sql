-- Combined Country Profile Summary
CREATE OR REPLACE VIEW v_Combined_Country_Profile AS 
SELECT
    country,
    year,
    population,
    gdp / 1e9 AS gdp_billion_usd,
	primary_energy_consumption AS primary_energy_twh,
	electricity_generation AS elec_generation_twh,
    (electricity_generation * 1e9 / NULLIF(gdp, 0)) AS kwh_per_usd_gdp,
    electricity_demand_per_capita AS elec_demand_per_person_kwh,
	greenhouse_gas_emissions,
	carbon_intensity_elec,

	--computing electricity_share_energy
	 CASE 
    WHEN primary_energy_consumption IS NULL OR primary_energy_consumption = 0 
        THEN 0
    ELSE (electricity_generation / primary_energy_consumption) * 100
END AS computed_electricity_share_energy,

--Elect_Energy_Shares/Energy_Mix_Over_Time
	renewables_share_elec,
	low_carbon_share_elec,
    fossil_share_elec,


--Compare_per_capita_electricity_vs_renewables_elec_per_capita

	per_capita_electricity,                 -- total electricity per person (kWh/person)
    renewables_elec_per_capita,             -- renewable electricity per person (kWh/person)

    -- GAP: how much of total per capita electricity is NOT renewable
    (per_capita_electricity - renewables_elec_per_capita) AS non_renewable_per_capita,

    -- PERCENT renewable share per capita
    
        (renewables_elec_per_capita / NULLIF(per_capita_electricity, 0)) * 100
        
     AS renewables_share_per_capita_pct,

--Scatter Plot Correlation_carbon_intensity_elec_vs_renewables_share_elec (For Python or Power BI)
    

--Decarbonization_rate
	
    -- Net decarbonization index each year
    (renewables_share_elec - fossil_share_elec) AS net_decarbonization_index,

    -- Year-to-year decarbonization speed
    (renewables_share_elec - fossil_share_elec)
    -
    LAG(renewables_share_elec - fossil_share_elec)
        OVER (PARTITION BY country ORDER BY year)
      AS elec_per_year,
	
--Scatter Plot economic growth (GDP) and electricity generation for Nigeria — the Energy & Economic Growth Nexus.(For Python or Power BI)
    electricity_generation,

--Elec_Energy_mix
	solar_electricity AS solar_elec_twh,
    wind_electricity AS wind_elec_twh,
    hydro_electricity AS hydro_elec_twh,
    biofuel_electricity AS biofuel_elec_twh,
    other_renewable_electricity AS other_ren_elec_twh,
	gas_electricity AS gas_elec_twh,


--Renewables_growth
	
	--Solar Elec Energy Growth in %
        (solar_electricity - LAG(solar_electricity) OVER (ORDER BY year)) 
        / NULLIF(LAG(solar_electricity) OVER (ORDER BY year), 0) * 100
        AS solar_growth_pct,

    

	--Wind Elec Energy Growth in %
        (wind_electricity - LAG(wind_electricity) OVER (ORDER BY year)) 
        / NULLIF(LAG(wind_electricity) OVER (ORDER BY year), 0) * 100
        AS wind_growth_pct,


	--Hydro Elec Energy Growth in %
        (hydro_electricity - LAG(hydro_electricity) OVER (ORDER BY year)) 
        / NULLIF(LAG(hydro_electricity) OVER (ORDER BY year), 0) * 100
        AS hydro_growth_pct

FROM ng_energy
WHERE country = 'Nigeria' AND year BETWEEN 2000 AND 2024;
