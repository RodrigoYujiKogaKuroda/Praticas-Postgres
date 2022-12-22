CREATE TABLE "classes" (
	"id" SERIAL PRIMARY KEY,
	"code" TEXT NOT NULL UNIQUE
);

CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"cpf" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"class_id" INTEGER NOT NULL UNIQUE REFERENCES "classes"("id")
);

CREATE TABLE "past_classes" (
	"id" SERIAL PRIMARY KEY,
	"class_id" INTEGER NOT NULL UNIQUE REFERENCES "classes"("id"),
	"student_id" INTEGER NOT NULL UNIQUE REFERENCES "students"("id"),
	"sign_in_day" TIMESTAMP NOT NULL,
	"sign_out_day" TIMESTAMP NOT NULL,
);

CREATE TABLE "modules" (
	"id" SERIAL PRIMARY KEY,
	"class_id" INTEGER NOT NULL UNIQUE REFERENCES "classes"("id"),
	"name" TEXT NOT NULL
);

CREATE TABLE "project_names" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"class_id" INTEGER NOT NULL UNIQUE REFERENCES "classes"("id"),
	"modules_id" INTEGER NOT NULL UNIQUE REFERENCES "modules"("id"),
);

CREATE TABLE "projects" (
	"id" SERIAL PRIMARY KEY,
	"student_id" INTEGER NOT NULL UNIQUE REFERENCES "students"("id"),
	"project_name_id" INTEGER NOT NULL UNIQUE REFERENCES "project_names"("id"),
	"deliver_date" TIMESTAMP NOT NULL,
	"score" TEXT NOT NULL
);

ALTER TABLE "projects"
	ADD CONSTRAINT check_types 
	CHECK (
		score = 'Abaixo das Expectativas'
		OR score = 'Dentro das Expectativas'
		OR score = 'Acima das Expectativas'
	)