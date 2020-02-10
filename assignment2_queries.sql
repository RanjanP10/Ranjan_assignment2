/**********Ranjan Patel 8622791 ********************************************/
/*********************************PART_1**********************************/
/*Query-1:*/
SELECT sum(QuotedPrice*QuantityOrdered) AS Revenue , OrderNumber
FROM `order_details` 
group by OrderNumber 

/*Query -2:*/
SELECT EmpFirstName, (EXTRACT(YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM EmpBirthDate)) AS AGE 
FROM `employees` ORDER BY AGE

/*********************************PART_2**********************************/
/*Query-1:*/
SELECT EmpFirstName, EmpLastName 
FROM `employees` 
WHERE EmpFirstName LIKE '%r%' AND EmpLastName NOT LIKE'%q%'

/*********************************PART_3**********************************/
Query-1:
/*In my understanding products should not be in one column otherwise later you cannot able to find product details any way like total sale of particular product stock of particular
product so all product name in single column is wrong here.
we have use normalization here by creating one product table which have productid and its name so, further we can use product id with all table.*/



/*********************************PART_4**********************************/
/*Query-1:*/
SELECT DISTINCT customers.CustFirstName , customers.CustLastName, customers.CustPhoneNumber,products.ProductName ,products.ProductNumber
FROM `customers` 
JOIN orders ON orders.CustomerID = customers.CustomerID 
JOIN order_details On order_details.OrderNumber = orders.OrderNumber 
JOIN products On products.ProductNumber = order_details.ProductNumber 
where products.ProductName LIKE '%helmet%'

/*Query-2*/
SELECT CustFirstName 
FROM `customers` 
where CustFirstName 
IN(SELECT EmpFirstName from employees)


/*********************************PART_5**********************************/
/*Query-1*/
SELECT DISTINCT customers.CustFirstName , customers.CustLastName, sum(order_details.QuantityOrdered * order_details.QuotedPrice * 2) ASrevenue_double_for_OR_customer,customers.CustState FROM `customers` 
JOIN orders ON orders.CustomerID = customers.CustomerID 
JOIN order_details On order_details.OrderNumber = orders.OrderNumber 
where customers.CustState = 'OR'

