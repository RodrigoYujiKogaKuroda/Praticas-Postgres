CREATE TABLE "companies" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE
);

CREATE TABLE "flights" (
	"id" serial NOT NULL,
	"acronym" TEXT NOT NULL UNIQUE,
	"company_id" integer NOT NULL REFERENCES "companies"("id"),
	"departure" TIMESTAMP NOT NULL,
	"arrival" TIMESTAMP NOT NULL,
	"origin_id" integer NOT NULL REFERENCES "airports"("id"),
	"destination_id" integer NOT NULL REFERENCES "airports"("id"),
);

CREATE TABLE "airports" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE
);