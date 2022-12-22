CREATE TABLE "companies" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE
);

CREATE TABLE "flights" (
	"id" SERIAL PRIMARY KEY,
	"acronym" TEXT NOT NULL UNIQUE,
	"company_id" integer NOT NULL REFERENCES "companies"("id"),
	"departure" TIMESTAMP NOT NULL,
	"arrival" TIMESTAMP NOT NULL,
	"origin_id" integer NOT NULL REFERENCES "airports"("id"),
	"destination_id" integer NOT NULL REFERENCES "airports"("id"),
);

CREATE TABLE "airports" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE
);