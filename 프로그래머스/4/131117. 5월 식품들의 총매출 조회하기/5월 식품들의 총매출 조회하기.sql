-- 코드를 입력하세요


SELECT a.product_id PRODUCT_ID, b.product_name PRODUCT_NAME, SUM(price*amount) AS TOTAL_SALES
FROM FOOD_ORDER a 
   JOIN FOOD_PRODUCT b ON a.product_id = b.product_id
WHERE PRODUCE_DATE BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY product_name
ORDER BY TOTAL_SALES DESC, product_id ASC

