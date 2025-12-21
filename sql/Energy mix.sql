CREATE OR REPLACE VIEW Elec_Energy_mix AS

SELECT
    year,
    solar_electricity AS solar_elec_twh,
    wind_electricity AS wind_elec_twh,
    hydro_electricity AS hydro_elec_twh,
    biofuel_electricity AS biofuel_elec_twh,
    other_renewable_electricity AS other_ren_elec_twh,
	gas_electricity AS gas_elec_twh

FROM ng_energy
WHERE country = 'Nigeria'
  AND year BETWEEN 2000 AND 2024
ORDER BY year;
