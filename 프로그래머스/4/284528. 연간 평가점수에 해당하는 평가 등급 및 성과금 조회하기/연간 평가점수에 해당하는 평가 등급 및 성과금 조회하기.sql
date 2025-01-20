-- 코드를 작성해주세요

# SELECT * 
# FROM HR_EMPLOYEES ep
#     LEFT JOIN HR_DEPARTMENT dp ON ep.DEPT_ID = dp.DEPT_ID
SELECT sub3.EMP_NO, sub3.EMP_NAME, sub3.GRADE, sub3.SAL*BONUSS AS BONUS
FROM (
        SELECT emp.*, sub2.GRADE,
                CASE WHEN GRADE = 'S' THEN 0.2
                WHEN GRADE = 'A' THEN 0.15
                WHEN GRADE = 'B' THEN 0.1
                ELSE 0 END BONUSS
        FROM HR_EMPLOYEES emp 
            LEFT JOIN (
                        SELECT sub.EMP_NO, CASE WHEN sub.SCORE >= 96 THEN 'S'
                                WHEN sub.SCORE >= 90 THEN 'A'
                                WHEN sub.SCORE >= 80 THEN 'B'
                                ELSE 'C' END GRADE
                        FROM(
                            SELECT EMP_NO, SUM(SCORE)/2 AS SCORE
                            FROM HR_GRADE 
                            GROUP BY EMP_NO
                            ) AS sub
                        ) AS sub2 ON emp.EMP_NO = sub2.EMP_NO
    ) AS sub3