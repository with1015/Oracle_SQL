-- BEFORE SQL 99

SELECT EMP.DEPTNO, DNAME, EMPNO, ENAME, SAL
    FROM EMP, DEPT
  WHERE EMP.DEPTNO = DEPT.DEPTNO
        AND SAL > 2000
ORDER BY EMP.DEPTNO;

SELECT EMP.DEPTNO, DNAME,
       TRUNC(AVG(SAL), 0) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP, DEPT
  WHERE EMP.DEPTNO = DEPT.DEPTNO
GROUP BY EMP.DEPTNO, DNAME;

SELECT DEPT.DEPTNO, DNAME, EMPNO, ENAME, JOB, SAL
    FROM EMP, DEPT
  WHERE EMP.DEPTNO(+) = DEPT.DEPTNO
ORDER BY EMP.DEPTNO;

SELECT DEPT.DEPTNO, DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL,
       E1.DEPTNO AS DEPTNO_1,
       LOSAL, HISAL, GRADE,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2, DEPT, SALGRADE
  WHERE E1.DEPTNO(+) = DEPT.DEPTNO
        AND E1.SAL BETWEEN LOSAL(+) AND HISAL(+)
        AND E1.MGR = E2.EMPNO(+)
ORDER BY DEPT.DEPTNO, E1.EMPNO;