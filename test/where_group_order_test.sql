-- �ǽ�����

-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� ��� �޿�(salary)�� ��ȸ�ϼ���. 
--    ��, �μ���ȣ�� null�̸� 0���� �����Ͽ� ��ȸ����.

-- �μ��� ���!
SELECT
    NVL(department_id, 0) as dep_id
    , ROUND(AVG(salary),1) as salary
FROM employees 
group by NVL(department_id, 0)
ORDER by dep_id
;

-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.
--    ��, �μ���ȣ�� null�̸� 0���� �����Ͽ� ��ȸ����.
-- from / where / group(��Ī��� �Ұ�) / having / select / order
SELECT
    NVL(department_id, 0) as dep_id
    , COUNT (department_id)
FROM employees 
group by NVL(department_id, 0) 
ORDER by dep_id
;

-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.
SELECT
    department_id as dep_id
    , ROUND(AVG (salary),1) as salary
FROM employees
GROUP by department_id
HAVING ROUND(AVG (salary),1) >= 8000
ORDER by dep_id
;


-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
--    ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.
SELECT
    job_id
    , ROUND(AVG (salary),1) as salary
FROM employees
WHERE job_id NOT LIKE 'SA%' 
GROUP by job_id
HAVING ROUND(AVG (salary),1) >= 8000
ORDER BY salary DESC
;


