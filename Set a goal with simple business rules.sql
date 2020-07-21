-- Use the two most recent years available
-- Goal for 2020 is average of two most recent years + 10%

With s1
as
(
select a.branch_id
, year(a.open_date) as open_date_year
, sum(a.loan_amt) as loan_amt_sum
from dbo.tblAccountDim a
where a.branch_id = 4
and year(a.open_date) <= 2018
and year(a.open_date) >= 2017
group by a.branch_id, year(a.open_date)
)
select sum(s1.loan_amt_sum)/2.00 as loan_amt_avg
,sum(s1.loan_amt_sum)/2 * 1.10 as loan_amt_sum_goal
,sum(s1.loan_amt_sum)/2 * 0.10 as increase_over_average
from s1;