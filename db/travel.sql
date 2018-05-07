DROP TABLE journeys;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries(
  id serial8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE cities(
  id serial8 PRIMARY KEY,
  name VARCHAR(255),
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE journeys(
  id serial8 PRIMARY KEY,
  city_id INT8 references cities(id),
  country_id INT8 references countries(id) ON DELETE CASCADE -- inner join and take out the country id
);
