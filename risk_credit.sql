
--==============================================================================================
-- CREDIT RISK ANALYSIS - SQL QUERIES
-- Objectif : Analyser les facteurs influençant le risque de défaut 
-- Dataset : credit_data
-- Auteur : Cliford CUPIDON
--===============================================================================================


Select name FROM sqlite_master WHERE type="table";


-- Vérifions que la table est bien chargée
SELECT*
FROM credit_data
LIMIT 10;

-- KPI PRINCIPAUX
-- 1- Taux de défaut global 
SELECT 
	round(AVG(loan_status)*100,2)AS default_rate_pct
FROM credit_data;

-- Insight :
-- Le taux de défaut global s'élève à 21.88% , ce qui est relativement élevé. Cela signifie qu'environ un client sur cinq est en situation de défaut, indiquant un
-- portefeuille de crédit à risque et nécessitant des stratégies de gestionplus strictes

-- Nombre de clients
SELECT count(*)AS total_clients
FROM credit_data;

-- Revenu moyen 
SELECT round(AVG(person_income),2) AS avg_income
FROM credit_data;


--- Risque par revenu--
SELECT 
	CASE 
		WHEN person_income< 30000 THEN "Low"
		WHEN person_income <  60000 THEN "Medium"
		WHEN person_income < 100000 THEN "High"
		ELSE " Very High"
	END AS income_group,
	COUNT(*) AS nb_clients,
	ROUND (avg(loan_status)*100,2) AS default_rate_pct
FROM credit_data 

GROUP BY income_group
ORDER BY default_rate_pct DESC;

-- Insight : Les clients à faible revenu présentent un risque significativement plus élevé.


--Risque par âge
SELECT 
	CASE 
		WHEN person_age BETWEEN 18 AND 25  THEN "18-25"
		WHEN person_age BETWEEN 26 AND 35 THEN "26-35"
		WHEN person_age BETWEEN 36 AND 50 THEN "36-50"
		ELSE " 50+"
	END AS age_group,
	COUNT(*) AS nb_clients,
	ROUND (avg(loan_status)*100,2) AS default_rate_pct
FROM credit_data 

GROUP BY age_group
ORDER BY default_rate_pct DESC;

-- Insight : 
-- Le risque de défaut est le plus élevé chez les clients de plus de 50 ans (26.55%), suivis par les jeunes adultes (18-50 ans) avec 23.13%.
-- les groupes d'âge intermédiaires (26-50 ans) présentent un rique plus faible (~20%).
-- Cela suggère un risque accru aux extrémités de la distribution d'âge. 


-- Risque par statut résidentiel

SELECT 
	person_home_ownership,
	COUNT(*) AS nb_clients,
	ROUND(AVG(loan_status) *100, 2) AS default_rate_pct
FROM credit_data
GROUP BY person_home_ownership
ORDER BY default_rate_pct DESC;


-- Taux de défaut par grade de prêt

SELECT 
	loan_grade,
	COUNT(*) AS nb_clients,
	ROUND(AVG(loan_status) *100, 2) AS default_rate_pct
FROM credit_data
GROUP BY loan_grade
ORDER BY default_rate_pct DESC;

-- Risque par type de prêt

SELECT 
	loan_intent,
	COUNT(*) AS nb_clients,
	ROUND(AVG(loan_status) *100, 2) AS default_rate_pct
FROM credit_data
GROUP BY loan_intent
ORDER BY default_rate_pct DESC;

-- Revenu moyen selon défaut/non défaut
SELECT loan_status,
	round(AVG(person_income),2) AS avg_income
FROM credit_data
GROUP BY loan_status;

--- Montant moyen du prêt selon défaut/non défaut
SELECT loan_status,
	round(AVG(loan_amnt),2) AS avg_loan_amount
FROM credit_data
GROUP BY loan_status;



--- Montant moyen du prêt selon défaut/non défaut
SELECT loan_status,
	round(AVG(loan_int_rate),2) AS avg_loan_int_rate
FROM credit_data
GROUP BY loan_status;


-- Top Profils les plus risqués
SELECT
	CASE 
		WHEN person_income< 30000 THEN "Low"
		WHEN person_income <  60000 THEN "Medium"
		WHEN person_income < 100000 THEN "High"
		ELSE " Very High"
	END AS income_group,
	CASE 
		WHEN person_age BETWEEN 18 AND 25  THEN "18-25"
		WHEN person_age BETWEEN 26 AND 35 THEN "26-35"
		WHEN person_age BETWEEN 36 AND 50 THEN "36-50"
		ELSE " 50+"
	END AS age_group,
	person_home_ownership,
	COUNT (*) AS nb_clients,
	ROUND (AVG(loan_status) *100,2)AS risk_pct
FROM credit_data
GROUP BY income_group, age_group, person_home_ownership
HAVING COUNT(*) >= 20
ORDER BY risk_pct DESC
LIMIT 10;


-- Insigth : Les clients à faible revenu (income =Low) et locataires (RENT) présentent les niveaux de risque les plus élevés, avec des taux de défaut
--  pouvant depasseer 50%. 
-- Le risque est particulièrement concentré chez les juenes adultes (18-35 ans) et les personnes de plus de 50 ans.
-- Cela suggère un profil à surveiller en priorité dans les stratégies de crédit. 

-- Top Profils les moins risqués
SELECT
	CASE 
		WHEN person_income< 30000 THEN "Low"
		WHEN person_income <  60000 THEN "Medium"
		WHEN person_income < 100000 THEN "High"
		ELSE " Very High"
	END AS income_group,
	CASE 
		WHEN person_age BETWEEN 18 AND 25  THEN "18-25"
		WHEN person_age BETWEEN 26 AND 35 THEN "26-35"
		WHEN person_age BETWEEN 36 AND 50 THEN "36-50"
		ELSE " 50+"
	END AS age_group,
	person_home_ownership,
	COUNT (*) AS nb_clients,
	ROUND (AVG(loan_status)* 100,2)AS risk_pct
FROM credit_data
GROUP BY income_group, age_group, person_home_ownership
HAVING COUNT(*) >=20
ORDER BY risk_pct ASC
LIMIT 10;

-- Insigth : Les profils les moins risqués sont principelement des clients à revenus moyens à élevés (Higth / Very Higth et propriétaires (OWN)
-- Leur taux de défaut est quasi nul, ce qui en fait des profils très fiables pour l'octroie de crédit. 
-- Ces clients peuvent être ciblés pour des offres premium ou des montants plus élevés. 


-- Répartition des clients par statut de défaut
SELECT 
	loan_status, 
	COUNT (*) AS nb_clients
FROM credit_data
GROUP BY loan_status;


-- Répartition des clients par type de logement
SELECT 
	person_home_ownership, 
	COUNT (*) AS nb_clients
FROM credit_data
GROUP BY person_home_ownership;

-- ===============================================
-- Conclusion global
--=================================================
-- Le risque de défaut global est globalement élevé (21,88%), indiquant un portefeuille de crédit risqué.

-- Les clients à faible revenu( Low) présentent les taux de défaut les plus élevés, en particulier lorsqu'ils sont locataires (RENT).

-- Le risque est plus impotant chez lzs jeunes adultes (18-35 ans)  ainsi que chez les personnes de plus de 50ans.

-- A l'inverse, les clients à revenus élevés  (High / Very High) et propriétaire s (OWN) présentent un risque très faible.

-- Recommandation : 
-- Adapter les stratégies de crédit en renforçant les critères pour les profils à risque et en ciblant les profils sûrs pour des offres premium.
