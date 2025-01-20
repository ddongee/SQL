-- 코드를 입력하세요
SELECT mp.member_name MEMBER_NAME, rr.review_text REVIEW_TEXT, DATE_FORMAT(rr.review_date, '%Y-%m-%d') REVIEW_DATE
FROM MEMBER_PROFILE mp 
    LEFT JOIN REST_REVIEW rr ON mp.member_id = rr.member_id 
WHERE mp.member_id IN (
                        SELECT member_id 
                        FROM rest_review 
                        GROUP BY member_id
                        HAVING COUNT(*) = (
                                            SELECT COUNT(*)
                                            FROM rest_review
                                            GROUP BY member_id
                                            ORDER BY COUNT(*) DESC
                                            LIMIT 1 
                                             )
                    )
ORDER BY review_date, review_text

