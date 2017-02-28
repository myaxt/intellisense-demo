select * from MP_DICTIONARY



SELECT 
D.UUID,  
UPPER(TD.VALUE) AS VALUE, 
E.EXPRESSION AS EXPRESSION,
AC.INTERNALCODE AS INTERNALCODE,
D.INTERNALCODEDATATYPE AS INTERNALCODEDATATYPE,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE((UPPER(TD.VALUE) ), 'Á', 'A'), 'É','E'), 'Í', 'I'), 'Ó', 'O'), 'Ú','U') AS TOKEN,
D.UUIDEVENT
FROM MP_DICTIONARY D
JOIN MP_EXPRESSION E
ON D.UUIDEXPRESSION = E.UUID
JOIN MP_TRANSLATION TD
ON D.UUIDLABEL = TD.UUIDLABEL
LEFT JOIN MP_ADVANCEDSEARCHCATEGORY AC
ON D.UUIDADVANCEDSEARCHCATEGORY = AC.UUID
WHERE TD.UUIDLANGUAGE ='DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E'
  --AND (D.UUIDEVENT = 'BCD7806E-FAE2-4773-BFE0-80D662742878' OR D.UUIDEVENT IS NULL)
  AND D.UUIDEVENT IS NULL
  AND AC.INTERNALCODE = 111
UNION ALL
SELECT D.UUID,  
UPPER(S.TEXT) AS VALUE, 
E.EXPRESSION AS EXPRESSION,
AC.INTERNALCODE AS INTERNALCODE,
D.INTERNALCODEDATATYPE AS INTERNALCODEDATATYPE,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE((UPPER(S.TEXT)), 'Á', 'A'), 'É','E'), 'Í', 'I'), 'Ó', 'O'), 'Ú','U') AS TOKEN,
D.UUIDEVENT
FROM MP_DICTIONARY D
JOIN MP_EXPRESSION E
ON D.UUIDEXPRESSION = E.UUID
JOIN MP_TRANSLATION TD
ON D.UUIDLABEL = TD.UUIDLABEL
LEFT JOIN MP_ADVANCEDSEARCHCATEGORY AC
ON D.UUIDADVANCEDSEARCHCATEGORY = AC.UUID
JOIN MP_SYNONYMSDICTIONARY S
ON S.UUIDDICTIONARY = D.UUID
WHERE TD.UUIDLANGUAGE ='DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E' 
AND S.UUIDLANGUAGE = 'DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E'
--AND (D.UUIDEVENT = 'BCD7806E-FAE2-4773-BFE0-80D662742878' OR D.UUIDEVENT IS NULL)
AND D.UUIDEVENT IS NULL
AND AC.INTERNALCODE = 111
ORDER BY UUIDEVENT


-- SELECT D.UUID AS i,  
-- UPPER(TD.VALUE) AS v, 
-- E.EXPRESSION AS e,
-- AC.INTERNALCODE AS c,
-- D.INTERNALCODEDATATYPE AS d,
-- REPLACE(REPLACE(REPLACE(REPLACE(REPLACE((UPPER(TD.VALUE) ), 'Á', 'A'), 'É','E'), 'Í', 'I'), 'Ó', 'O'), 'Ú','U') AS t,
-- D.UUIDEVENT AS r
-- FROM MP_DICTIONARY D
-- JOIN MP_EXPRESSION E
-- ON D.UUIDEXPRESSION = E.UUID
-- JOIN MP_TRANSLATION TD
-- ON D.UUIDLABEL = TD.UUIDLABEL
-- LEFT JOIN MP_ADVANCEDSEARCHCATEGORY AC
-- ON D.UUIDADVANCEDSEARCHCATEGORY = AC.UUID
-- WHERE TD.UUIDLANGUAGE ='DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E'
-- UNION ALL
-- SELECT D.UUID AS i,  
-- UPPER(S.TEXT) AS v, 
-- E.EXPRESSION AS e,
-- AC.INTERNALCODE AS c,
-- D.INTERNALCODEDATATYPE AS d,
-- REPLACE(REPLACE(REPLACE(REPLACE(REPLACE((UPPER(S.TEXT)), 'Á', 'A'), 'É','E'), 'Í', 'I'), 'Ó', 'O'), 'Ú','U') AS t,
-- D.UUIDEVENT AS r
-- FROM MP_DICTIONARY D
-- JOIN MP_EXPRESSION E
-- ON D.UUIDEXPRESSION = E.UUID
-- JOIN MP_TRANSLATION TD
-- ON D.UUIDLABEL = TD.UUIDLABEL
-- LEFT JOIN MP_ADVANCEDSEARCHCATEGORY AC
-- ON D.UUIDADVANCEDSEARCHCATEGORY = AC.UUID
-- JOIN MP_SYNONYMSDICTIONARY S
-- ON S.UUIDDICTIONARY = D.UUID
-- WHERE TD.UUIDLANGUAGE ='DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E' AND S.UUIDLANGUAGE = 'DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E'
-- ORDER BY c

SELECT VALUE
FROM MPD_NARRATIVEWORDEXCLUDED ex
JOIN MP_TRANSLATION td ON ex.UUIDLABEL = td.UUIDLABEL
WHERE td.UUIDLANGUAGE = 'DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E'


SELECT A.INTERNALCODE, T.VALUE from MP_ADVANCEDSEARCHCATEGORY  A
JOIN MP_TRANSLATION T ON A.UUIDLABEL = T.UUIDLABEL
WHERE T.UUIDLANGUAGE = 'DC376CF4-1ABC-4F91-8F48-9A5DB68A4E8E'
  AND INTERNALCODE = 82