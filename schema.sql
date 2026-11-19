CREATE  TABLE "Main" ( -- the table which i  will insert the clean data to it where no missing colunms
    "ID" INTEGER ,
    "VIN" TEXT ,
    "County" TEXT NOT NULL ,
    "City" TEXT NOT NULL ,
    "State" TEXT NOT NULL ,
    "Model Year" INTEGER NOT NULL  ,
    "Make" TEXT NOT NULL ,
    "Model" TEXT NOT NULL ,
    "Electric Vehicle Type" TEXT NOT NULL ,
    "Clean Alternative Fuel Vehicle (CAFV) Eligibility" TEXT NOT NULL ,
    "Electric Range" INTEGER NOT NULL ,
    "Legislative District" TEXT NOT NULL ,
    "DOL Vehicle ID" INTEGER NOT NULL,
    "Vehicle Location" TEXT NOT NULL ,
    "Electric Utility" TEXT NOT NULL ,
    "2020 GEOID" INTEGER  NOT NULL,
    PRIMARY KEY("ID")
);
CREATE VIEW "LOCATION DETAILS" AS -- a simple view to be able to identfy the location of a car through its vin
SELECT "VIN" , "County" , "City" , "State" , "Vehicle Location" FROM "Main" ;
CREATE TABLE "Cars Detail" ( -- a well detailed table on cars where it contains its vin model year and make and its range which are helpful if you wan to know specfic info about a car
    "ID" INTEGER ,
    "VIN" TEXT ,
    "Model Year" INTEGER ,
    "Make" TEXT ,
    "Model" TEXT ,
    "Electric Range" INTEGER ,
    FOREIGN KEY("ID") REFERENCES "Main"("ID")
);
CREATE TABLE "Battery Electric Vehicle (BEV) Type"(
    "ID" INTEGER ,
    "VIN" TEXT ,
    FOREIGN KEY("ID") REFERENCES "Main"("ID")
);
CREATE TABLE "Plug-in Hybrid Electric Vehicle (PHEV) Type"(
    "ID" INTEGER,
    "VIN" TEXT ,
    FOREIGN KEY("ID") REFERENCES "Main"("ID")
);
CREATE VIEW "TESLA CARS" AS
SELECT * FROM "Cars Detail"
 WHERE "Make" = 'TESLA';
CREATE INDEX "Cars Detail INDEX"
ON "Cars Detail"("VIN" , "Model Year" , "Make" , "Model" , "Electric Range");
