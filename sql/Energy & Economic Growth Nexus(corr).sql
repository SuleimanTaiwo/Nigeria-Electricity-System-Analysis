CREATE OR REPLACE VIEW corr_gdp_elec_gen AS

-- SELECT 
--     CORR(gdp, electricity_generation) AS corr_gdp_elec_gen
-- FROM ng_energy
-- WHERE country = 'Nigeria'
--   AND year BETWEEN 2000 AND 2024;


--Scatter Plot SQL Data (For Python or Power BI)..economic growth (GDP) and electricity generation for Nigeria — the Energy & Economic Growth Nexus.
SELECT 
    year,
    gdp,
    electricity_generation
FROM ng_energy
WHERE country = 'Nigeria'
  AND year BETWEEN 2000 AND 2024;

