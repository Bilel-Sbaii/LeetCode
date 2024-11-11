# Write your MySQL query statement below
select st.student_id, st.student_name,sb.subject_name,count(case when e.subject_name is not null then 1 end) "attended_exams"
from students st
cross join subjects sb
left join examinations e
on e.student_id=st.student_id and e.subject_name=sb.subject_name
group by st.student_id, st.student_name,sb.subject_name
order by st.student_id, sb.subject_name;