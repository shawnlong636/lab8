-- QUERY 1
SELECT COUNT(part_number)
FROM part_nyc
WHERE on_hand >= 70;

-- QUERY 2

SELECT SUM(P.on_hand)
FROM (
    SELECT part_number, color, on_hand
    FROM part_nyc

    UNION

    SELECT part_number, color, on_hand
    FROM part_sfo) AS P, color C
WHERE C.color_id = P.color AND 
    C.color_name = 'Red';

-- QUERY 3

SELECT NYC.supplier
FROM part_nyc NYC, part_sfo SFO
WHERE NYC.supplier = SFO.supplier
GROUP BY NYC.supplier
HAVING SUM(NYC.on_hand) > SUM(SFO.on_hand);

-- QUERY 4
SELECT DISTINCT supplier
FROM part_nyc NYC
WHERE NYC.part_number IN 
    (SELECT DISTINCT part_number FROM part_nyc
    EXCEPT
    SELECT DISTINCT part_number FROM part_sfo);

-- QUERY 5
UPDATE part_nyc
SET on_hand = on_hand - 10;


-- QUERY 6
DELETE FROM part_nyc
WHERE on_hand < 30;