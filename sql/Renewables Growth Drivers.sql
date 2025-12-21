CREATE OR REPLACE VIEW Renewables_growth AS

SELECT
    year,
    solar_electricity,

	--Solar Elec Energy Growth in %
        (solar_electricity - LAG(solar_electricity) OVER (ORDER BY year)) 
        / NULLIF(LAG(solar_electricity) OVER (ORDER BY year), 0) * 100
        
     AS solar_growth_pct,

    wind_electricity,

	--Wind Elec Energy Growth in %
        (wind_electricity - LAG(wind_electricity) OVER (ORDER BY year)) 
        / NULLIF(LAG(wind_electricity) OVER (ORDER BY year), 0) * 100
        
     AS wind_growth_pct,

    hydro_electricity,

	--Hydro Elec Energy Growth in %
        (hydro_electricity - LAG(hydro_electricity) OVER (ORDER BY year)) 
        / NULLIF(LAG(hydro_electricity) OVER (ORDER BY year), 0) * 100
        
     AS hydro_growth_pct

FROM ng_energy
WHERE country = 'Nigeria' AND year BETWEEN 2000 AND 2024
ORDER BY year;
