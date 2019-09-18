DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS toys;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    breed VARCHAR(255)
);

CREATE TABLE toys (
  id SERIAL PRIMARY KEY,
  price INTEGER,
  color VARCHAR(255), 
  name VARCHAR(255)
);

CREATE TABLE cattoys(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,

    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO cats 
  (name, color, breed) 
VALUES 
  ('Fred','Yellow','Tabby'), 
  ('Tosha', 'Black', 'Alley'), 
  ('Felix','Ginger','House Cat'), 
  ('Leo','Tan','Lion'), 
  ('Shadow','Black','Panther');

INSERT INTO 
  toys (price, color, name) 
VALUES
  (60, 'red', 'Laser'), 
  (30, 'Gray', 'Catnip'),
  (20, 'White', 'Stuffed Mouse'),
  (200, 'Striped', 'Stuffed Zebra'),
  (1000, 'Beige', 'Scratching Wall');

INSERT INTO 
  cattoys(cat_id, toy_id)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5);
