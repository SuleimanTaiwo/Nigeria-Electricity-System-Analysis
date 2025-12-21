--Energy Mix Over Time
CREATE OR REPLACE VIEW Energy_Mix_Over_Time AS
SELECT
    year,
	renewables_share_elec,
	low_carbon_share_elec,
    fossil_share_elec
	  
FROM ng_energy
WHERE country = 'Nigeria' AND year BETWEEN 2000 AND 2024

ORDER BY year;