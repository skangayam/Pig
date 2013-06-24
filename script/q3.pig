/*

Data: pig/data/emp; pig/data/salgrade
Query: Print the name of the employee and his corresponding salary grade. 

Error thrown when i used dot(.) to select rows in the logical operation.
Backend error : Scalar has more than one row in the output.

solution: 
Use double colon (::) to select columns of a table from a relation

*/

EMP = load 'pig/data/emp' using PigStorage(',') as (no, name, desig, mgrid, hiredate, sal, comm, deptno);
SAL = load 'pig/data/salgrade' using PigStorage(',') as (grade, losal, hisal);
X = CROSS EMP,SAL;
Y = filter X by EMP::sal >= SAL::losal AND EMP::sal <= SAL::hisal;  --this was the line generating error.
Z = foreach Y generate EMP::name, SAL::grade;
store Z into 'pig/result/q2';
