CREATE DATABASE IF NOT EXISTS gamestore;
USE gamestore;

CREATE TABLE giochi (
  id     INT AUTO_INCREMENT PRIMARY KEY,
  nome   VARCHAR(100) NOT NULL,
  prezzo DECIMAL(8,2) NOT NULL
);

INSERT INTO giochi (nome, prezzo) VALUES
  ('Kart Racer', 59.90), ('Space Quest', 39.90),
  ('Puzzle Land', 24.90), ('Football 26', 69.90);

CREATE TABLE ordini (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  cliente   VARCHAR(100) NOT NULL,
  totale    DECIMAL(10,2) NOT NULL,
  creato_il TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- un ordine con 3 giochi = 3 righe qui
CREATE TABLE righe_ordine (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  ordine_id INT NOT NULL,
  gioco_id  INT NOT NULL,
  FOREIGN KEY (ordine_id) REFERENCES ordini(id),
  FOREIGN KEY (gioco_id)  REFERENCES giochi(id)
);
