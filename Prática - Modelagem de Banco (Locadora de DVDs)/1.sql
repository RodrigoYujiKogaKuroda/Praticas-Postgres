CREATE TABLE "phones" (
	"id" SERIAL PRIMARY KEY,
	"number" TEXT NOT NULL UNIQUE
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "adresses" (
	"id" SERIAL PRIMARY KEY,
	"street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "adress_line_2" TEXT,
    "cep" TEXT NOT NULL,
    "city_id" INTEGER NOT NULL UNIQUE REFERENCES "cities"("id"),
    "state_id" INTEGER NOT NULL UNIQUE REFERENCES "states"("id")
);

CREATE TABLE "clients" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
    "cpf" TEXT NOT NULL UNIQUE,
    "adress_id" INTEGER NOT NULL REFERENCES "adresses"("id")
);

CREATE TABLE "phones_list" (
	"id" SERIAL PRIMARY KEY,
    "client_id" INTEGER NOT NULL REFERENCES "clients"("id"),
    "phone_id" INTEGER NOT NULL REFERENCES "phones"("id")
);

CREATE TABLE "countries" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "actors" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
    "client_id" INTEGER NOT NULL REFERENCES "clients"("id"),
    "birthdate" TIMESTAMP NOT NULL
);

CREATE TABLE "categories" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "movies" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
    "category_id" INTEGER NOT NULL REFERENCES "categories"("id")
);

CREATE TABLE "cast" (
	"id" SERIAL PRIMARY KEY,
    "movie_id" INTEGER NOT NULL REFERENCES "movies"("id"),
    "actor_id" INTEGER NOT NULL REFERENCES "actors"("id")
);

CREATE TABLE "discs" (
	"id" SERIAL PRIMARY KEY,
	"number" INTEGER NOT NULL UNIQUE,
    "codebar" TEXT NOT NULL,
    "movie_id" INTEGER NOT NULL REFERENCES "movies"("id")
);

CREATE TABLE "rentals" (
	"id" SERIAL PRIMARY KEY,
	"client_id" INTEGER NOT NULL REFERENCES "clients"("id"),
    "disc_id" INTEGER NOT NULL UNIQUE REFERENCES "discs"("id"),
    "rental_date" TIMESTAMP NOT NULL,
    "return_date" TIMESTAMP,
    "movie_rating" INTEGER,
        CHECK (movie_rating BETWEEN 0 AND 10),
    "service_rating" INTEGER,
        CHECK (service_rating BETWEEN 0 AND 10)
);

ALTER TABLE "rentals"
	ADD CONSTRAINT check_types 
	CHECK (
		score = 'Abaixo das Expectativas'
		OR score = 'Dentro das Expectativas'
		OR score = 'Acima das Expectativas'
	)