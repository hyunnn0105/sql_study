SELECT
    first_name, LENGTH(first_name)
FROM employees;

-- lower�� ����ؼ� ��/�� ������� ����� �� ����
SELECT
    first_name, last_name
FROM employees
WHERE LOWER(first_name) = 'david'
;

-- Q. employees ���̺��� job_id�� it_prog-�ҹ��ں��� ����� first_name�� salary�� ����ϼ���.
--  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
--  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. 
--          �� ���� ��Ī�� name�Դϴ�.
--  ����3 ) �޿��� ��ü 10�ڸ��� ����ϵ� �������ڸ��� *�� ����մϴ�. 
--           �� ���� ��Ī�� salary�Դϴ�.
SELECT
    RPAD( SUBSTR(first_name, 1, 3), LENGTH(first_name) , '*') AS name
    , LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog'
;


