CREATE TABLE "public.companies" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE,
	CONSTRAINT "companies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.flights" (
	"id" serial NOT NULL,
	"acronym" TEXT NOT NULL UNIQUE,
	"company_id" integer NOT NULL,
	"departure" TIMESTAMP NOT NULL,
	"arrival" TIMESTAMP NOT NULL,
	"origin_id" integer NOT NULL UNIQUE,
	"destination_id" integer NOT NULL UNIQUE,
	CONSTRAINT "flights_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.airports" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"acronym" TEXT NOT NULL UNIQUE,
	CONSTRAINT "airports_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("company_id") REFERENCES "companies"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("origin_id") REFERENCES "airports"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("destination_id") REFERENCES "airports"("id");





