USE mantenimiento_ml;

INSERT INTO lecturas_maquinas
  (temperatura, vibracion, presion, horas_operacion, dias_mantenimiento, falla)
SELECT
  temperatura, vibracion, presion, horas_operacion, dias_mantenimiento,
  IF(RAND() < LEAST(0.95, 0.02
        + (temperatura - 60) / 300
        + (vibracion - 1) / 45
        + dias_mantenimiento / 900), 1, 0) AS falla
FROM (
  SELECT
    ROUND(60 + RAND() * 40, 2)    AS temperatura,
    ROUND(1 + RAND() * 9, 2)      AS vibracion,
    ROUND(80 + RAND() * 70, 2)    AS presion,
    FLOOR(100 + RAND() * 9900)    AS horas_operacion,
    FLOOR(1 + RAND() * 180)       AS dias_mantenimiento
  FROM
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
  LIMIT 1000
) t;