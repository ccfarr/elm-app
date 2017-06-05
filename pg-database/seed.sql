CREATE TABLE votes (
  id INTEGER PRIMARY KEY,
  option_name VARCHAR(20),
  number_of_votes INTEGER
);
INSERT INTO votes (id, option_name, number_of_votes) values (1, 'sandwiches', 7);
INSERT INTO votes (id, option_name, number_of_votes) values (2, 'tacos', 7);
