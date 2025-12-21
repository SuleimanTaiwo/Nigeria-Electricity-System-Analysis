CREATE OR REPLACE VIEW Correlation_carbon_intensity_elec_vs_renewables_share_elec AS

--Correlation carbon_intensity_elec and renewables_share_elec
-- SELECT
--     CORR(carbon_intensity_elec, renewables_share_elec) AS corr_gdp_energy_intensity
-- FROM ng_energy
-- WHERE country = 'Nigeria' AND year BETWEEN 2000 AND 2024;


--Scatter Plot SQL Data (For Python or Power BI)
SELECT
    year,
    renewables_share_elec,
    carbon_intensity_elec
FROM ng_energy
WHERE country = 'Nigeria' AND year BETWEEN 2000 AND 2024;


