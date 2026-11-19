INSERT INTO "Main" (
    "VIN",
    "County",
    "City",
    "State",
    "Model Year",
    "Make",
    "Model",
    "Electric Vehicle Type",
    "Clean Alternative Fuel Vehicle (CAFV) Eligibility",
    "Electric Range",
    "Legislative District",
    "Vehicle Location",
    "Electric Utility",
    "DOL Vehicle ID",
    "2020 GEOID"
)
SELECT
    "VIN (1-10)",
    "County",
    "City",
    "State",
    "Model Year",
    "Make",
    "Model",
    "Electric Vehicle Type",
    "Clean Alternative Fuel Vehicle (CAFV) Eligibility",
    "Electric Range",
    "Legislative District",
    "Vehicle Location",
    "Electric Utility",
    "DOL Vehicle ID",
    "2020 GEOID"
FROM "Main_TEMP"
WHERE
    TRIM("County") != ''                     AND TRIM(("City") != ''                                             AND TRIM("State") != ''
    AND TRIM("Model Year") != ''             AND TRIM("Make") != ''                                              AND TRIM("Model") != ''
    AND TRIM("Electric Vehicle Type") != ''  AND TRIM("Clean Alternative Fuel Vehicle (CAFV) Eligibility") != '' AND "Electric Range" != ''
    AND TRIM("Legislative District") != ''   AND TRIM("Vehicle Location") != ''                                  AND "Electric Utility" != '';

INSERT INTO "Cars Detail" 
SELECT "VIN" , "Model Year" , "Make" , "Model" , "Electric Range" FROM "Main" ; 

INSERT INTO "Battery Electric Vehicle (BEV) Type" 
SELECT "VIN" FROM "Main" WHERE "Electric Vehicle Type" LIKE '% (BEV)';


INSERT INTO "Plug-in Hybrid Electric Vehicle (PHEV) Type" 
SELECT "VIN" FROM "Main" WHERE "Electric Vehicle Type" LIKE '% (PHEV)';

SELECT * FROM "Main"  ORDER BY "County" LIMIT 5; 
SELECT * FROM "Cars Detail" WHERE "Model Year" = 2018 LIMIT 5 ;
SELECT * FROM "Battery Electric Vehicle (BEV) Type" LIMIT 5 ;
SELECT * FROM "Plug-in Hybrid Electric Vehicle (PHEV) Type" LIMIT 5;
SELECT * FROM "LOCATION DETAILS" LIMIT 5 ;