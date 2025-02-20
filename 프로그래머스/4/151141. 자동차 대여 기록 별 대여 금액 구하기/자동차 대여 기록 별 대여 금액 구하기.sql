-- 코드를 입력하세요


SELECT HISTORY_ID, 
        CASE WHEN datetype = '7일 미만' THEN ROUND(daily_fee * datediff) 
            ELSE ROUND(daily_fee * ((100-discount_rate)*0.01) * datediff)  END FEE
FROM (
    SELECT a.*, b.car_type, b.daily_fee ,DATEDIFF(end_date,start_date) + 1 DATEDIFF
         ,CASE 
        WHEN DATEDIFF(end_date,start_date) + 1 BETWEEN 7 AND 29 THEN '7일 이상'
        WHEN DATEDIFF(end_date,start_date) + 1 BETWEEN 30 AND 89 THEN '30일 이상'
        WHEN DATEDIFF(end_date,start_date) + 1 >= 91 THEN '90일 이상'
        ELSE '7일 미만' END  DATETYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY a 
    JOIN CAR_RENTAL_COMPANY_CAR b ON a.car_id = b.car_id
    WHERE b.car_type = '트럭'
    ) sub
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN c ON sub.car_type = c.car_type 
WHERE sub.datetype = c.duration_type 
    OR sub.datetype = '7일 미만'
GROUP BY HISTORY_ID
ORDER BY FEE DESC, HISTORY_ID DESC
                                            