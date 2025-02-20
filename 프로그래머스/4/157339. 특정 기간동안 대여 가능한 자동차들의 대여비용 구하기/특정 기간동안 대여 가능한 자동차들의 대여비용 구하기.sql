# -- 코드를 입력하세요

SELECT a.car_id CAR_ID, a.car_type CAR_TYPE, ROUND(a.daily_fee*(100 - c.discount_rate)*0.01*30) AS FEE
FROM CAR_RENTAL_COMPANY_CAR a
    JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY b ON a.car_id = b.car_id
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN c ON a.car_type = c.car_type
WHERE a.car_type IN ('세단','SUV')
    AND a.car_id NOT IN (
                        SELECT car_id
                        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
                        WHERE start_date <= '2022-11-30' 
                            AND end_date >= '2022-11-01'
                        )
    AND c.duration_type = '30일 이상'
GROUP BY a.car_id
HAVING FEE BETWEEN 500000 AND 2000000
ORDER BY FEE DESC, CAR_TYPE, CAR_ID

# SELECT *
# FROM CAR_RENTAL_COMPANY_CAR a
#     JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY b ON a.car_id = b.car_id
#     JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN c ON a.car_type = c.car_type
# WHERE a.car_type IN ('세단','SUV')
# ORDER BY b.end_date DESC
