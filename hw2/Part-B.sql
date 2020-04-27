    /*
    Vivek Patel
    CSC 453 Section 810
    Assignment 2
    2/03/2019
*/

select distinct fname, minit, lname from employee e, project p, works_on w where e.ssn = w.essn and p.pnumber = w.pno;
select dname, dnumber, avg(salary) from department d, employee e where d.dnumber = e.dno group by dname, dnumber order by dnumber;
select lname from employee e, dependent d minus(select lname from employee e, dependent d where e.ssn = d.essn);
select fname, minit, lname from employee e where dno = (select dno from employee where salary = (select min(salary) from employee));
select d.dname, count(Employees), count(Dependents) 
    from department d, (select e.ssn as Employees from department d, employee e where d.dnumber = e.dno), 
    (select dn.dependent_name as Dependents from department d, employee e, dependent dn where d.dnumber = e.dno and e.ssn = dn.essn) 
    group by d.dname;
select fname, minit, lname from employee e where salary >= (select max(salary) from employee) - 20000;