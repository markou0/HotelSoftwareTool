CREATE TABLE "room_type" (
"id" serial NOT NULL PRIMARY KEY,
"name" varchar NOT NULL UNIQUE
);

INSERT INTO "room_type" VALUES(DEFAULT, 'De luxe');
INSERT INTO "room_type" VALUES(DEFAULT, 'Family room');
INSERT INTO "room_type" VALUES(DEFAULT, 'Family studio');
INSERT INTO "room_type" VALUES(DEFAULT, 'Honeymoon room');
INSERT INTO "room_type" VALUES(DEFAULT, 'Standart');
INSERT INTO "room_type" VALUES(DEFAULT, 'Studio');
INSERT INTO "room_type" VALUES(DEFAULT, 'Suite');

CREATE TABLE "room" (
	"id" serial NOT NULL,
	"room_type_id" integer NOT NULL,
	"capacity" integer NOT NULL,
	"number" varchar NOT NULL,
	"price" FLOAT NOT NULL,
	"image" varchar,
	CONSTRAINT room_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "room_booking" (
	"id" serial NOT NULL,
	"room_id" integer NOT NULL,
	"from" DATE NOT NULL,
	"to" DATE NOT NULL,
	"price" FLOAT NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT room_booking_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "service" (
	"id" serial NOT NULL,
	"description" TEXT,
	"capacity" integer NOT NULL,
	"name" varchar NOT NULL UNIQUE,
	"price" FLOAT NOT NULL,
	"image" varchar,
	CONSTRAINT service_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "service_booking" (
	"id" serial NOT NULL,
	"service_id" integer NOT NULL,
	"at_date" DATE NOT NULL,
	"at_time" TIME NOT NULL,
	"price" FLOAT NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT service_booking_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TYPE user_permissions AS ENUM ('CLIENT', 'ADMIN', 'PERSONNEL');

CREATE TABLE "user" (
	"id" serial NOT NULL,
	"email" varchar NOT NULL UNIQUE CHECK ( char_length("email") >= 5 ),
	"password" varchar NOT NULL CHECK ( char_length("password") >= 5 ),
	"phone" varchar NOT NULL CHECK ( char_length("phone") = 12 ),
	"name" varchar NOT NULL,
	"surname" varchar NOT NULL,
	"role" user_permissions NOT NULL DEFAULT 'CLIENT'::user_permissions,
	"enabled" smallint NOT NULL DEFAULT 1,
	CONSTRAINT user_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "room" ADD CONSTRAINT "room_fk0" FOREIGN KEY ("room_type_id") REFERENCES "room_type"("id");
ALTER TABLE "room_booking" ADD CONSTRAINT "room_booking_fk0" FOREIGN KEY ("room_id") REFERENCES "room"("id");
ALTER TABLE "room_booking" ADD CONSTRAINT "room_booking_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("id");


ALTER TABLE "service_booking" ADD CONSTRAINT "service_booking_fk0" FOREIGN KEY ("service_id") REFERENCES "service"("id");
ALTER TABLE "service_booking" ADD CONSTRAINT "service_booking_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("id");



