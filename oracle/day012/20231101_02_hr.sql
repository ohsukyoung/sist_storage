SELECT USER
FROM DUAL;
--==>> HR

-- ○ EMPLOYEES 테이블의 직원들 SALARY 를 10% 인상한다.
--    단, 부서명이 'IT'인 직원들만 한정한다.
--    (또한, 쿼리문에 대한 변경 결과 확인 후 ROLLBACK을 수행한다~!!!)

-- *DEPARTMENT 조회 확인하지 말것~!!

SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

-- IT 부서 직원들의 FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 조회
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE 부서명 = 'IT';

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE 부서아이디 = 부서명이 'IT'인 부서의 부서아이디;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 부서명이 'IT'인 부서의 부서아이디;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> 
/*
Alexander	Hunold	    9000	60
Bruce	    Ernst	    6000	60
David	    Austin	    4800	60
Valli	    Pataballa	4800	60
Diana	    Lorentz	    4200	60
*/

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
    ,SALARY * 1.1 "10%인상된급여"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>>
/*
Alexander	Hunold	9000	60	9900
Bruce	    Ernst	6000	60	6600
David	    Austin	4800	60	5280
Valli	    Pataballa	4800	60	5280
Diana	    Lorentz	4200	60	4620
*/

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> 5개 행 이(가) 업데이트되었습니다.

SELECT *
FROM EMPLOYEES;
--==>>
/*
100	Steven	King	SKING	515.123.4567	2003-06-17	AD_PRES	24000			90
101	Neena	Kochhar	NKOCHHAR	515.123.4568	2005-09-21	AD_VP	17000		100	90
102	Lex	De Haan	LDEHAAN	515.123.4569	2001-01-13	AD_VP	17000		100	90
103	Alexander	Hunold	AHUNOLD	590.423.4567	2006-01-03	IT_PROG	9900		102	60
104	Bruce	Ernst	BERNST	590.423.4568	2007-05-21	IT_PROG	6600		103	60
105	David	Austin	DAUSTIN	590.423.4569	2005-06-25	IT_PROG	5280		103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	5280		103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4620		103	60
108	Nancy	Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	12008		101	100
109	Daniel	Faviet	DFAVIET	515.124.4169	2002-08-16	FI_ACCOUNT	9000		108	100
110	John	Chen	JCHEN	515.124.4269	2005-09-28	FI_ACCOUNT	8200		108	100
111	Ismael	Sciarra	ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	7700		108	100
112	Jose Manuel	Urman	JMURMAN	515.124.4469	2006-03-07	FI_ACCOUNT	7800		108	100
113	Luis	Popp	LPOPP	515.124.4567	2007-12-07	FI_ACCOUNT	6900		108	100
114	Den	Raphaely	DRAPHEAL	515.127.4561	2002-12-07	PU_MAN	11000		100	30
115	Alexander	Khoo	AKHOO	515.127.4562	2003-05-18	PU_CLERK	3100		114	30
116	Shelli	Baida	SBAIDA	515.127.4563	2005-12-24	PU_CLERK	2900		114	30
117	Sigal	Tobias	STOBIAS	515.127.4564	2005-07-24	PU_CLERK	2800		114	30
118	Guy	Himuro	GHIMURO	515.127.4565	2006-11-15	PU_CLERK	2600		114	30
119	Karen	Colmenares	KCOLMENA	515.127.4566	2007-08-10	PU_CLERK	2500		114	30
120	Matthew	Weiss	MWEISS	650.123.1234	2004-07-18	ST_MAN	8000		100	50
121	Adam	Fripp	AFRIPP	650.123.2234	2005-04-10	ST_MAN	8200		100	50
122	Payam	Kaufling	PKAUFLIN	650.123.3234	2003-05-01	ST_MAN	7900		100	50
123	Shanta	Vollman	SVOLLMAN	650.123.4234	2005-10-10	ST_MAN	6500		100	50
124	Kevin	Mourgos	KMOURGOS	650.123.5234	2007-11-16	ST_MAN	5800		100	50
125	Julia	Nayer	JNAYER	650.124.1214	2005-07-16	ST_CLERK	3200		120	50
126	Irene	Mikkilineni	IMIKKILI	650.124.1224	2006-09-28	ST_CLERK	2700		120	50
127	James	Landry	JLANDRY	650.124.1334	2007-01-14	ST_CLERK	2400		120	50
128	Steven	Markle	SMARKLE	650.124.1434	2008-03-08	ST_CLERK	2200		120	50
129	Laura	Bissot	LBISSOT	650.124.5234	2005-08-20	ST_CLERK	3300		121	50
130	Mozhe	Atkinson	MATKINSO	650.124.6234	2005-10-30	ST_CLERK	2800		121	50
131	James	Marlow	JAMRLOW	650.124.7234	2005-02-16	ST_CLERK	2500		121	50
132	TJ	Olson	TJOLSON	650.124.8234	2007-04-10	ST_CLERK	2100		121	50
133	Jason	Mallin	JMALLIN	650.127.1934	2004-06-14	ST_CLERK	3300		122	50
134	Michael	Rogers	MROGERS	650.127.1834	2006-08-26	ST_CLERK	2900		122	50
135	Ki	Gee	KGEE	650.127.1734	2007-12-12	ST_CLERK	2400		122	50
136	Hazel	Philtanker	HPHILTAN	650.127.1634	2008-02-06	ST_CLERK	2200		122	50
137	Renske	Ladwig	RLADWIG	650.121.1234	2003-07-14	ST_CLERK	3600		123	50
138	Stephen	Stiles	SSTILES	650.121.2034	2005-10-26	ST_CLERK	3200		123	50
139	John	Seo	JSEO	650.121.2019	2006-02-12	ST_CLERK	2700		123	50
140	Joshua	Patel	JPATEL	650.121.1834	2006-04-06	ST_CLERK	2500		123	50
141	Trenna	Rajs	TRAJS	650.121.8009	2003-10-17	ST_CLERK	3500		124	50
142	Curtis	Davies	CDAVIES	650.121.2994	2005-01-29	ST_CLERK	3100		124	50
143	Randall	Matos	RMATOS	650.121.2874	2006-03-15	ST_CLERK	2600		124	50
144	Peter	Vargas	PVARGAS	650.121.2004	2006-07-09	ST_CLERK	2500		124	50
145	John	Russell	JRUSSEL	011.44.1344.429268	2004-10-01	SA_MAN	14000	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	13500	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	12000	0.3	100	80
148	Gerald	Cambrault	GCAMBRAU	011.44.1344.619268	2007-10-15	SA_MAN	11000	0.3	100	80
149	Eleni	Zlotkey	EZLOTKEY	011.44.1344.429018	2008-01-29	SA_MAN	10500	0.2	100	80
150	Peter	Tucker	PTUCKER	011.44.1344.129268	2005-01-30	SA_REP	10000	0.3	145	80
151	David	Bernstein	DBERNSTE	011.44.1344.345268	2005-03-24	SA_REP	9500	0.25	145	80
152	Peter	Hall	PHALL	011.44.1344.478968	2005-08-20	SA_REP	9000	0.25	145	80
153	Christopher	Olsen	COLSEN	011.44.1344.498718	2006-03-30	SA_REP	8000	0.2	145	80
154	Nanette	Cambrault	NCAMBRAU	011.44.1344.987668	2006-12-09	SA_REP	7500	0.2	145	80
155	Oliver	Tuvault	OTUVAULT	011.44.1344.486508	2007-11-23	SA_REP	7000	0.15	145	80
156	Janette	King	JKING	011.44.1345.429268	2004-01-30	SA_REP	10000	0.35	146	80
157	Patrick	Sully	PSULLY	011.44.1345.929268	2004-03-04	SA_REP	9500	0.35	146	80
158	Allan	McEwen	AMCEWEN	011.44.1345.829268	2004-08-01	SA_REP	9000	0.35	146	80
159	Lindsey	Smith	LSMITH	011.44.1345.729268	2005-03-10	SA_REP	8000	0.3	146	80
160	Louise	Doran	LDORAN	011.44.1345.629268	2005-12-15	SA_REP	7500	0.3	146	80
161	Sarath	Sewall	SSEWALL	011.44.1345.529268	2006-11-03	SA_REP	7000	0.25	146	80
162	Clara	Vishney	CVISHNEY	011.44.1346.129268	2005-11-11	SA_REP	10500	0.25	147	80
163	Danielle	Greene	DGREENE	011.44.1346.229268	2007-03-19	SA_REP	9500	0.15	147	80
164	Mattea	Marvins	MMARVINS	011.44.1346.329268	2008-01-24	SA_REP	7200	0.1	147	80
165	David	Lee	DLEE	011.44.1346.529268	2008-02-23	SA_REP	6800	0.1	147	80
166	Sundar	Ande	SANDE	011.44.1346.629268	2008-03-24	SA_REP	6400	0.1	147	80
167	Amit	Banda	ABANDA	011.44.1346.729268	2008-04-21	SA_REP	6200	0.1	147	80
168	Lisa	Ozer	LOZER	011.44.1343.929268	2005-03-11	SA_REP	11500	0.25	148	80
169	Harrison	Bloom	HBLOOM	011.44.1343.829268	2006-03-23	SA_REP	10000	0.2	148	80
170	Tayler	Fox	TFOX	011.44.1343.729268	2006-01-24	SA_REP	9600	0.2	148	80
171	William	Smith	WSMITH	011.44.1343.629268	2007-02-23	SA_REP	7400	0.15	148	80
172	Elizabeth	Bates	EBATES	011.44.1343.529268	2007-03-24	SA_REP	7300	0.15	148	80
173	Sundita	Kumar	SKUMAR	011.44.1343.329268	2008-04-21	SA_REP	6100	0.1	148	80
174	Ellen	Abel	EABEL	011.44.1644.429267	2004-05-11	SA_REP	11000	0.3	149	80
175	Alyssa	Hutton	AHUTTON	011.44.1644.429266	2005-03-19	SA_REP	8800	0.25	149	80
176	Jonathon	Taylor	JTAYLOR	011.44.1644.429265	2006-03-24	SA_REP	8600	0.2	149	80
177	Jack	Livingston	JLIVINGS	011.44.1644.429264	2006-04-23	SA_REP	8400	0.2	149	80
178	Kimberely	Grant	KGRANT	011.44.1644.429263	2007-05-24	SA_REP	7000	0.15	149	
179	Charles	Johnson	CJOHNSON	011.44.1644.429262	2008-01-04	SA_REP	6200	0.1	149	80
180	Winston	Taylor	WTAYLOR	650.507.9876	2006-01-24	SH_CLERK	3200		120	50
181	Jean	Fleaur	JFLEAUR	650.507.9877	2006-02-23	SH_CLERK	3100		120	50
182	Martha	Sullivan	MSULLIVA	650.507.9878	2007-06-21	SH_CLERK	2500		120	50
183	Girard	Geoni	GGEONI	650.507.9879	2008-02-03	SH_CLERK	2800		120	50
184	Nandita	Sarchand	NSARCHAN	650.509.1876	2004-01-27	SH_CLERK	4200		121	50
185	Alexis	Bull	ABULL	650.509.2876	2005-02-20	SH_CLERK	4100		121	50
186	Julia	Dellinger	JDELLING	650.509.3876	2006-06-24	SH_CLERK	3400		121	50
187	Anthony	Cabrio	ACABRIO	650.509.4876	2007-02-07	SH_CLERK	3000		121	50
188	Kelly	Chung	KCHUNG	650.505.1876	2005-06-14	SH_CLERK	3800		122	50
189	Jennifer	Dilly	JDILLY	650.505.2876	2005-08-13	SH_CLERK	3600		122	50
190	Timothy	Gates	TGATES	650.505.3876	2006-07-11	SH_CLERK	2900		122	50
191	Randall	Perkins	RPERKINS	650.505.4876	2007-12-19	SH_CLERK	2500		122	50
192	Sarah	Bell	SBELL	650.501.1876	2004-02-04	SH_CLERK	4000		123	50
193	Britney	Everett	BEVERETT	650.501.2876	2005-03-03	SH_CLERK	3900		123	50
194	Samuel	McCain	SMCCAIN	650.501.3876	2006-07-01	SH_CLERK	3200		123	50
195	Vance	Jones	VJONES	650.501.4876	2007-03-17	SH_CLERK	2800		123	50
196	Alana	Walsh	AWALSH	650.507.9811	2006-04-24	SH_CLERK	3100		124	50
197	Kevin	Feeney	KFEENEY	650.507.9822	2006-05-23	SH_CLERK	3000		124	50
198	Donald	OConnell	DOCONNEL	650.507.9833	2007-06-21	SH_CLERK	2600		124	50
199	Douglas	Grant	DGRANT	650.507.9844	2008-01-13	SH_CLERK	2600		124	50
200	Jennifer	Whalen	JWHALEN	515.123.4444	2003-09-17	AD_ASST	4400		101	10
201	Michael	Hartstein	MHARTSTE	515.123.5555	2004-02-17	MK_MAN	13000		100	20
202	Pat	Fay	PFAY	603.123.6666	2005-08-17	MK_REP	6000		201	20
203	Susan	Mavris	SMAVRIS	515.123.7777	2002-06-07	HR_REP	6500		101	40
204	Hermann	Baer	HBAER	515.123.8888	2002-06-07	PR_REP	10000		101	70
205	Shelley	Higgins	SHIGGINS	515.123.8080	2002-06-07	AC_MGR	12008		101	110
206	William	Gietz	WGIETZ	515.123.8181	2002-06-07	AC_ACCOUNT	8300		205	110
*/

-- 롤백
ROLLBACK;
--==>> 롤백완료

/* 1-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMPLOYEES 테이블에서 JOB_TITLE 이 'Sales Manager' 인 사원들의
--   SALARY 를 해당 직무(직종)의 최고급여(MAX_SALARY)로 수정한다.
--   단, 입사일이 2006년 이전(해당 년도 제외) 입사자에 한해 적용할 수 있도록 처리한다.
--   (또한, 변경에 대한 결과 확인 후 ROLLBACK 수행한다~!!!)

SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;

SELECT *, SALARY, 직무(직종)의 최고급여(MAX_SALARY)
FROM EMPLOYEES
WHERE JOB_TITLE 이 'Sales Manager' 인 사원들
    AND 입사일이 2006년 이전(해당 년도 제외) 입사자;
    
    
SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID, HIRE_DATE
FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID = 'Sales Manager';

SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID = ( SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');

SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID = ( SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND TO_NUMBER(TO_CHAR(HIRE_DATE,'YYYY'))<2006;

SELECT *
FROM EMPLOYEES
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE,'YYYY'))<2006;

SELECT MAX(E.SALARY)
FROM(
    SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID, HIRE_DATE
    FROM EMPLOYEES
    WHERE JOB_ID = ( SELECT JOB_ID
                    FROM JOBS
                    WHERE JOB_TITLE = 'Sales Manager')
) E;

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = ( SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND TO_NUMBER(TO_CHAR(HIRE_DATE,'YYYY'))<2006;

/* 1-문제 & 다른사람이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- JOIN 사용
UPDATE
    (SELECT E.*, J.MAX_SALARY
    FROM EMPLOYEES E INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
        AND J.JOB_TITLE = 'Sales Manager'
        AND EXTRACT(YEAR FROM HIRE_DATE)<2006
    )
SET SALARY = MAX_SALARY;

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
UPDATE EMPLOYEES
SET SALARY = ('Sales Manager' 의 MAX_SALARY)
WHERE JOB_IE = ('Sales Manager' 의 JOB_ID)
 AND HIRE_DATE가 2006 년 이전;
 
UPDATE EMPLOYEES
SET SALARY = ('Sales Manager' 의 MAX_SALARY)
WHERE JOB_IE = ('Sales Manager' 의 JOB_ID)
 AND TO_NUMBER(TO_CAHR(HIRE_DATE,'YYYY')) < 2006;
 
UPDATE EMPLOYEES
SET SALARY = ('Sales Manager' 의 MAX_SALARY)
WHERE JOB_IE = ('Sales Manager' 의 JOB_ID)
 AND TO_NUMBER(TO_CAHR(HIRE_DATE,'YYYY')) < 2006; 

-- 'Sales Manager' 의 MAX_SALARY
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> 20080

-- 'Sales Manager' 의 JOB_ID
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> SA_MAN

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = ( SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND TO_NUMBER(TO_CHAR(HIRE_DATE,'YYYY')) < 2006;
--==>> 3개 행 이(가) 업데이트되었습니다.

-- 업데이트 된 내용 확인
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = ( SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND TO_NUMBER(TO_CHAR(HIRE_DATE,'YYYY')) < 2006;
--==>> 
/*
145	John	Russell	JRUSSEL	011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/

ROLLBACK;
--==>> 롤백 완료.

/* 2-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMPLOYEES 테이블에서 SALARY를
--   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance -> 10% 인상
--   Executive -> 15% 인상
--   Accounting -> 20% 인상
--   (쿼리문에 의한 변경 결과 확인 후 ROLLBACK 수행~!!!)

SELECT *
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE 부서이름=F;

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Finance');
                        
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE EMPLOYEES의 부서ID = (SELECT 부서ID
                            FROM DEPARTENTS
                            WHERE 부서이름 = F);

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Finance');
                        
                        
    SELECT 
    FROM EMPLOYEES 
    WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                            )
                            
;


SELECT DECODE(DEPARTMENT_ID,90,'Finance',100,'Executive',110,'Accounting')
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                        );
-- 수정전                            
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID      
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                        );
--==>> 
/*
100	Steven	    24000	90
101	Neena	    17000	90
102	Lex	        17000	90
108	Nancy	    12008	100
109	Daniel	    9000	100
110	John	    8200	100
111	Ismael	    7700	100
112	Jose Manuel	7800	100
113	Luis	    6900	100
205	Shelley	    12008	110
206	William	    8300	110
*/
    
UPDATE EMPLOYEES
SET SALARY = DECODE(DEPARTMENT_ID
                        ,(SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Finance'),SALARY*1.1
                        ,(SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Executive'),SALARY*1.15
                        ,(SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Accounting'),SALARY*1.2)
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                        );
--==>> 11개 행 이(가) 업데이트되었습니다.

-- 수정후                            
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID      
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                        );
--==>> 
/*
100	Steven	    27600	90
101	Neena	    19550	90
102	Lex	        19550	90
108	Nancy	    13208.8	100
109	Daniel	    9900	100
110	John	    9020	100
111	Ismael	    8470	100
112	Jose Manuel	8580	100
113	Luis	    7590	100
205	Shelley	    14409.6	110
206	William	    9960	110
*/

-- 방법2
UPDATE
    (SELECT E.*, DECODE(DEPARTMENT_NAME,'Finance',SALARY*1.1,'Executive', SALARY*1.15,'Accounting',SALARY*1.2, SALARY) "인상급여"
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND D.DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
    )
SET SALARY = 인상급여;
--==>> 11개 행 이(가) 업데이트되었습니다.

/* 2-문제 & 같이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

SELECT *
FROM DEPARTMENTS
WHERE 부서명 IN ('Finance','Executive','Accounting');

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting');

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting');

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                            );
                            'Finance',SALARY*1.1,'Executive', SALARY*1.15,'Accounting',SALARY*1.2
                            
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance' 의 부서 아이디)       THEN SALARY*1.1
                                WHEN ('Executive' 의 부서 아이디)     THEN SALARY*1.15
                                WHEN ('Accounting' 의 부서 아이디)    THEN SALARY*1.2
                                ELSE SALARY
            END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                         );

-- ('Finance' 의 부서 아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME ='Finance';

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Finance')       THEN SALARY*1.1
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Executive')     THEN SALARY*1.15
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Accounting')    THEN SALARY*1.2
                                ELSE SALARY
            END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
                         );
--==>> 11개 행 이(가) 업데이트되었습니다.

-- *WHERE 가 없어도 'ELSE SALARY'덕분에 UPDATE SET으로 작동함*  
-- *하지만 WHERE 절이 있어야 더 세분화된 목록을 추려서 실행하기 때문에*  
-- *속도측면에서 WHERE 절을 수행하는 것이 더 좋다.

ROLLBACK;

--------------------------------------------------------------------------------

--■■■ DELETE ■■■--
-- 1. 테이블에서 지정된 행(레코드)을 삭제하는데 사용하는 구문  

-- 2. 형식 및 구조  
-- DELETE [FROM] 테이블명  
-- [WHERE 조건절]  

-- *2가지 강조*  
-- *DELEFE **FROM** 테이블명에서 'FROM' 꼭 붙여서 작업*  
-- *SELECT * -> DELETE 로 SELECT 조회 후 삭제*  

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;

-- *레코드, 참조 구성이 어떻게 되어있는지에 따라서 삭제되지 않는다*

-- *MGR컬럼이 EMP_ID를 참조하고 있음
-- *EMP_ID가 등록되어 있지 않으면 MGR이 등록되지 않음
-- *참조 구성을 삭제해야 지워질 수 있음

--○ EMPLOYEES 테이블에서 직원들의 데이터를 삭제한다
--   단, 부서명이 'IT'인 경우로 한정한다.
SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT'
                        );

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT'
                        );

--※ 실제로는 EMPLOYEES 테이블의 데이터가 (-> 삭제하고자 하는 대상 데이터)
--   다른 레코드에 의해 참조당하고 있는 경우
--   삭제되지 않을 수 있다는 사실을 인지할 수 있어야 하며...
--   그에 대한 이유도 알아야 한다.
