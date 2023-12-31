-- all lessons during a specific year, each month and lesson type. 
SELECT
-- display months w txt
-- bc of inh – tot lessons are ind lesson_id from table "l"
-- counts only ind lessons, NULL for ggl and e. then gl when e null.
-- counts e. 
    TO_CHAR(ts.date, 'Month') AS month,
    COUNT(l.individual_lesson_id) AS total_lessons,
    COUNT(CASE WHEN gl.individual_lesson_id IS NULL AND e.individual_lesson_id IS NULL THEN l.individual_lesson_id END) AS individual_lessons,
	COUNT (CASE WHEN e.individual_lesson_id IS NULL THEN gl.individual_lesson_id END) AS group_lessons,
    COUNT(e.individual_lesson_id) AS ensembles
FROM
    time_slot ts
JOIN
    individual_lesson l ON ts.timeslot_id = l.timeslot_id
LEFT JOIN
    group_lesson gl ON l.individual_lesson_id = gl.individual_lesson_id
LEFT JOIN
    ensemble e ON l.individual_lesson_id = e.individual_lesson_id
WHERE
    EXTRACT(YEAR FROM ts.date) = 2023
GROUP BY
    TO_CHAR(ts.date, 'Month')
ORDER BY
    MIN(ts.date);


-- siblings.
-- inner: nr of sibl
-- outer: nr of students that have x amnt sibl.
SELECT
    COALESCE(num_siblings, 0) AS num_siblings,
    COUNT(student_id) AS student_count
FROM (
    SELECT
        s.student_id,
        COUNT(ss.sibling_student_id) AS num_siblings
    FROM
        student s
    LEFT JOIN
        sibling ss ON s.student_id = ss.student_id
    GROUP BY
        s.student_id
) AS student_siblings
GROUP BY
    COALESCE(num_siblings, 0)
ORDER BY
    COALESCE(num_siblings, 0);

-- all instructors teaching during a specific month
-- need to show their id, name and nr of lessons
-- name is found in personal_details, the common col is pers_nr
-- date is found in ts, w comn col being instr_id
-- insert month as a nr
SELECT 
    i.instructor_id,
    pd.first_name,
    pd.last_name,
    COUNT(ts.timeslot_id) AS "No of lessons"
FROM 
    instructor i
JOIN 
    personal_details pd ON i.personal_number = pd.personal_number
JOIN 
    time_slot ts ON i.instructor_id = ts.instructor_id
WHERE 
    EXTRACT(MONTH FROM ts.date) = 1
GROUP BY 
    i.instructor_id, pd.first_name, pd.last_name;



-- ensembles
SELECT
    e.individual_lesson_id,
    e.genre,
    g.max_attendees,
    ts.date AS time_slot_date,
    COUNT(b.student_id) AS attendees,
    CASE
        WHEN COUNT(b.student_id) >= g.max_attendees THEN 'Full Booked'
        WHEN COUNT(b.student_id) >= g.max_attendees - 2 THEN '1-2 Seats Left'
        ELSE 'More Seats Left'
    END AS booking_status
FROM
    ensemble e
JOIN
    group_lesson g ON e.individual_lesson_id = g.individual_lesson_id
JOIN
    individual_lesson l ON e.individual_lesson_id = l.individual_lesson_id
JOIN
    time_slot ts ON l.timeslot_id = ts.timeslot_id
LEFT JOIN
    booking b ON e.individual_lesson_id = b.individual_lesson_id
WHERE
    ts.date BETWEEN CURRENT_DATE + INTERVAL '1 day' AND CURRENT_DATE + INTERVAL '7 days'
GROUP BY
    e.individual_lesson_id, e.genre, g.max_attendees, ts.date
ORDER BY
    e.genre, EXTRACT(ISODOW FROM ts.date);
