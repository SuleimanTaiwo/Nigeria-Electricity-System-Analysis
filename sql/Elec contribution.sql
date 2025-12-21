SELECT country, year, electricity_generation, carbon_intensity_elec, greenhouse_gas_emissions
FROM ng_energy
WHERE country = 'Nigeria' and year BETWEEN 2000 AND 2024;
