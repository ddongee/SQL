-- 코드를 입력하세요
SELECT DISTINCT(a.car_id) 
FROM CAR_RENTAL_COMPANY_CAR a
    LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY b ON a.CAR_ID = b.CAR_ID
WHERE CAR_TYPE = '세단'
    AND b.start_date BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY a.car_id DESC