CREATE OR REPLACE VIEW Decarbonization_rate AS

SELECT
    year,
    renewables_share_elec,
    fossil_share_elec,

    -- Net decarbonization index each year
    (renewables_share_elec - fossil_share_elec) AS net_decarbonization_index,

    -- Year-to-year decarbonization speed
    (renewables_share_elec - fossil_share_elec)
    -
    LAG(renewables_share_elec - fossil_share_elec)
        OVER (PARTITION BY country ORDER BY year)
      AS elec_per_year

FROM ng_energy
WHERE country = 'Nigeria' AND year BETWEEN 2000 AND 2024
ORDER BY year;
