1)Churn Distribution

SELECT Churn,
COUNT(CustomerID) as Customer_Count
FROM CustomerChurnDataset
GROUP BY Churn

2)Average Spend by Churn

SELECT Churn, avg("Total Spend") as Average_Spend from CustomerChurnDataset
GROUP by Churn

3)Average Support Calls by Churn

Select Churn, avg("Support Calls") as Average_Support_Calls from CustomerChurnDataset
GROUP by Churn

4)Subscription Type Analysis

Select "Subscription Type", Count(Churn) as Customer_Count from CustomerChurnDataset
WHERE Churn=1
GROUP by "Subscription Type"\\

5)Churn Rate by Subscription Type

Select
"Subscription Type",
count(CustomerID) as Total_Customers,
Sum(Churn) as Churned_Customers,
Sum(Churn) * 100.0 / Count(CustomerID) as Churn_Rate
from CustomerChurnDataset
GROUP by "Subscription Type"

6)Age Analysis

Select Churn, avg(Age) as Average_Age from CustomerChurnDataset
GROUP by Churn

7)Contract Length Analysis

Select "Contract length", 
sum(Churn) * 100.0 / Count(CustomerID) as Churn_Rate
from CustomerChurnDataset
GROUP by "Contract Length"

8)High Risk Customers

Select CustomerID, Age, "Support Calls", "Payment Delay", "Total Spend" from CustomerChurnDataset 
WHERE "Support Calls">5 AND "Payment Delay">15 AND Churn=1

9)Customer Risk Segmentation

Select CustomerID, "Support Calls",
CASE
WHEN "Support Calls" > 7 THEN 'High Risk'
WHEN "Support Calls" BETWEEN 4 AND 7 THEN 'Medium Risk'
ELSE 'Low Risk'
END As Risk_Level
From CustomerChurnDataset

10)Risk Level Distribution

Select Count(CustomerID) as Customer_Count,
CASE
WHEN "Support Calls" > 7 THEN 'High Risk'
WHEN "Support Calls" BETWEEN 4 AND 7 THEN 'Medium Risk'
ELSE 'Low Risk'
END As Risk_Level
From CustomerChurnDataset
GROUP by Risk_Level

11)Churn by Risk Level

Select Sum(Churn) As Churned_Customers,
CASE
WHEN "Support Calls" > 7 THEN 'High Risk'
WHEN "Support Calls" BETWEEN 4 AND 7 THEN 'Medium Risk'
ELSE 'Low Risk'
END As Risk_Level
From CustomerChurnDataset
GROUP by Risk_Level

12)Churn Rate by Risk Level

Select Count(CustomerID) as Total_Customer, 
Sum(Churn) as Churned_Customers,
Sum(Churn) * 100.0/count(CustomerID) as Churn_Rate,
CASE 
WHEN "Support Calls">7 THEN 'High Risk'
WHEN "Support Calls" BETWEEN 4 AND 7 THEN 'Medium Risk'
Else 'Low Risk'
END as Risk_Level
from CustomerChurnDataset 
GROUP by Risk_Level

13)Tenure Analysis

Select Churn, avg(Tenure) as Average_Tenure
from CustomerChurnDataset
GROUP by Churn

14)Spend Segmentation

Select CustomerID, "Total Spend",
CASE
WHEN "Total Spend">800 THEN 'High Value'
WHEN "Total Spend" BETWEEN 500 AND 800 THEN 'Medium Value'
Else 'Low Value'
END as Customer_Value
from CustomerChurnDataset

15)Churn by Customer Value

Select count(CustomerID) as Total_Customer,
Sum(Churn) as Churned_Customer,
Sum(Churn) * 100.0/ count(CustomerID) as Churn_Rate,
CASE
WHEN "Total Spend" > 800 THEN 'High Value'
WHEN "Total Spend" BETWEEN 500 AND 800 THEN 'Medium Value'
Else 'Low Value'
End as Customer_Value
from CustomerChurnDataset
GROUP by Customer_Value

16)Payment Delay Analysis

Select Churn, avg("Payment Delay") as Average_Payment_Delay
from CustomerChurnDataset
GROUP by Churn

17)High Churn Risk Conditions

Select CustomerID, 
"Support Calls", 
"Payment Delay", 
Tenure, 
"Total Spend"
from CustomerChurnDataset 
Where "Support Calls">5 
AND "Payment Delay">10 
AND Tenure<12 
AND Churn=1