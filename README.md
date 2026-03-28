# 📊 Credit Risk Analysis – Python, SQL & Power BI

---

## 📌 Présentation du projet

Ce projet vise à analyser le **risque de crédit des clients** afin d’identifier les profils les plus susceptibles de faire défaut.

L’objectif est de transformer des données brutes en **insights exploitables** pour aider à la prise de décision dans un contexte financier.

Le projet combine trois outils principaux :

- **Python** → nettoyage, analyse exploratoire et modélisation
- **SQL** → extraction d’insights et segmentation des clients
- **Power BI** → création d’un dashboard interactif

---

## 🎯 Objectifs du projet

- Identifier les profils clients à **haut risque**
- Comprendre les facteurs influençant le défaut de paiement
- Construire un **modèle de prédiction**
- Créer un **dashboard interactif** pour visualiser les résultats

---

## 📂 Dataset & Source des données

Le dataset utilisé contient des informations sur :

- les revenus des clients
- leur âge
- leur statut de logement
- les caractéristiques du prêt
- le statut de défaut (target)

⚠️ Le fichier étant trop volumineux, il n’est pas inclus dans ce repository.

👉 Vous pouvez utiliser un dataset similaire sur :
- Kaggle (Credit Risk / Loan Prediction datasets)

---

## 🛠️ Technologies utilisées

- **Python** (Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn)
- **SQL (SQLite)** pour l’analyse des données
- **Power BI** pour la visualisation
- **Jupyter Notebook**

---

## 🔄 Étapes du projet

### 1. Nettoyage & préparation des données (Python)

- Gestion des valeurs manquantes
- Transformation des variables
- Création de nouvelles features (income group, age group…)

---

### 2. Analyse exploratoire (EDA)

- Analyse des distributions
- Identification des variables importantes
- Analyse du déséquilibre des classes

---

### 3. Modélisation (Machine Learning)

- Entraînement d’un modèle de classification
- Ajustement du seuil de décision
- Optimisation du recall pour détecter les clients à risque

#### 📌 Matrice de confusion
![Confusion Matrix](images/confusion_matrix.png)

#### 📌 Courbe ROC
![ROC Curve](roc_curve.png)

---

### 4. Analyse SQL

Utilisation de SQL pour extraire des insights business :

- Identification des profils les plus risqués
- Analyse par revenu, âge et statut de logement

#### 📌 Clients les plus à risque
![High Risk](sql_high_risk.png)

#### 📌 Clients les moins à risque
![Low Risk](sql_low_risk.png)

---

### 5. Dashboard Power BI

Création d’un dashboard interactif permettant de visualiser :

- le taux de défaut par âge
- le taux de défaut par revenu
- le taux de défaut par type de logement
- le taux de défaut par niveau de crédit

#### 📊 Aperçu du dashboard
![Dashboard](dashboard.png)

---

## 📈 Résultats principaux

- Les clients à **faible revenu** présentent le risque le plus élevé
- Les **locataires (RENT)** sont plus exposés au défaut
- Certains groupes d’âge (jeunes adultes) sont plus risqués
- Le modèle atteint une **AUC ≈ 0.82**, indiquant une bonne performance globale

---

## 🧠 Importance des outils utilisés

- **Python** permet une analyse approfondie et la création de modèles prédictifs
- **SQL** facilite l’extraction rapide d’insights business
- **Power BI** rend les résultats accessibles et exploitables pour les décideurs

👉 La combinaison de ces outils permet une approche complète :
**Data → Analyse → Modélisation → Visualisation**

---

## 🏁 Conclusion

Ce projet démontre l’importance de l’analyse de données dans la gestion du risque de crédit.

Le modèle développé permet d’identifier efficacement les clients à risque, tout en mettant en évidence les facteurs clés influençant le défaut.

Le dashboard Power BI permet une **visualisation claire et interactive**, facilitant la prise de décision.

---

## 📁 Structure du projet

```
Credit_Risk_Analysis/
│── data/
│── notebook/
│── sql/
│── power_bi/
│── images/
│── clean_credit_risk.csv
```

---

## 🚀 Améliorations possibles

- Tester des modèles plus performants (Random Forest, XGBoost)
- Optimiser les hyperparamètres
- Améliorer la gestion du déséquilibre des classes
- Déployer le modèle (API ou application)

---

## 👤 Auteur

Projet réalisé par **Cliford Cupidon**
