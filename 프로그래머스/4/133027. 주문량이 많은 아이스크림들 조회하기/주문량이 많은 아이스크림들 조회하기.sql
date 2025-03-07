-- 코드를 입력하세요
# SELECT CASE WHEN a.SHIPMENT_ID = b.SHIPMENT_ID THEN (a.TOTAL_ORDER + b.TOTAL_ORDER )
#     ELSE b.TOTAL_ORDER END TOTAL_ORDER_REAL
# FROM(
#     SELECT *
#     FROM FIRST_HALF a   
#     JOIN JULY b ON a.FLAVOR = b.FLAVOR 
#     ) sub
SELECT FLAVOR
FROM(
    SELECT b.SHIPMENT_ID, b.FLAVOR ,
            CASE WHEN a.SHIPMENT_ID = b.SHIPMENT_ID THEN (a.TOTAL_ORDER + b.TOTAL_ORDER )
                                                    ELSE b.TOTAL_ORDER END TOTAL_ORDER_REAL
    FROM FIRST_HALF a   
    JOIN JULY b ON a.FLAVOR = b.FLAVOR 
    ) SUB
GROUP BY FLAVOR
ORDER BY SUM(TOTAL_ORDER_REAL) DESC
LIMIT 3
