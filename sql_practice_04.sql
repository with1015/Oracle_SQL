SELECT DEPTNO,
       TRUNC(AVG(SAL), 0) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(DEPTNO) AS CNT
    FROM EMP
GROUP BY DEPTNO;

SELECT JOB,
       COUNT(*)
    FROM EMP
GROUP BY JOB
    HAVING COUNT(*) >= 3;
    
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       DEPTNO, COUNT(*) AS CNT
    FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
       COUNT(*) AS CNT
    FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

SELECT DEPTNO,
       TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       COUNT(TO_CHAR(HIREDATE, 'YYYY')) AS CNT,
       MAX(SAL) AS MAX_SAL,
       SUM(SAL) AS SUM_SAL,
       AVG(SAL) AS AVG_SAL
    FROM EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));