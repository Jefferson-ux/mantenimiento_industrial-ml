CREATE DATABASE IF NOT EXISTS mantenimiento_ml;
USE mantenimiento_ml;

DROP TABLE IF EXISTS lecturas_maquinas;
CREATE TABLE lecturas_maquinas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  temperatura DECIMAL(8,2) NOT NULL,
  vibracion DECIMAL(8,2) NOT NULL,
  presion DECIMAL(8,2) NOT NULL,
  horas_operacion INT NOT NULL,
  dias_mantenimiento INT NOT NULL,
  falla TINYINT NOT NULL
);