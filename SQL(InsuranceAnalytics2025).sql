
-- KPI 1 =  No. of Invoice by Account Executive
Select * from invoice_csv;
SELECT "Account Executive", COUNT(invoice_number) AS total_invoice_csv
FROM invoice_csv
GROUP BY "Account Executive"
ORDER BY total_invoice_csv DESC;

-- KPI 2 = Yearly meeting count
Select * from Meeting_csv;
Select Year("meeting_date") as meeting_year, Count(*) as meeting_count
From meeting_csv 
Group by meeting_year
Order by meeting_year;

-- KPI 3 
-- 1) Cross Sell--Target,Achive,new
-- 2)New-Target,Achive,new
-- 3)Renewal-Target, Achive,new

SELECT 
    category,
    SUM(target) AS total_target,
    SUM(achieved) AS total_achieved,
    SUM(new) AS total_new
FROM sales_data
WHERE category IN ('Cross Sell','New','Renewal')
GROUP BY category
ORDER BY category;

-- KPI 4 = Stage by revenue
Select * from opportunity_csv;
Select stage, Sum(revenue_amount) as total_revenue
From Opportunity_csv
Group by stage
Order by total_revenue DESC;

-- KPI 5 = No of meeting By Account Exe
SELECT 
    account_exec, COUNT(meeting_id) AS total_meetings
FROM
    meeting_csv
GROUP BY account_exec
ORDER BY total_meetings DESC;

-- KPI 6 = Top 4 open opportunity
Select * from opportunity_csv;
Select Opportunity_name, stage, revenue_amount
From opportunity_csv 
Where stage = "Qualify Opportunity"
Order by revenue_amount DESC
Limit 4;





