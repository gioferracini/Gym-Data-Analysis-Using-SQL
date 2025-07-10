# 🏋 Gym Management Analytics — SQL Project

This project simulates a **gym management system**, using SQL to explore and extract strategic business insights from a relational database.  
A total of **23 analytical SQL scripts** were developed, covering areas such as financial health, customer profiles, product sales, instructor allocation, and more.

All data are **fictitious and intended purely for portfolio and learning purposes**.

---

🧠 **Key Skills Demonstrated**

* SQL (CTEs, joins, aggregations, window functions)
* Data modeling & KPIs
* Analytical reasoning and business storytelling
* Realistic simulation of a gym operational database

---

## 🗃️ Database Structure

The project uses the following main tables (available in .sql or .csv format):

- `alunos` (students): personal data, age, neighborhood, registration and status
- `planos` (membership plans): plan details and prices
- `pagamentos` (payments): student payments, status, and payment method
- `modalidades` (activities): list of activities offered (muscle training, cardio, pilates, etc.)
- `frequencia` (attendance): daily logs of student presence by activity
- `produtos` (products): supplements, apparel, accessories
- `vendas_produtos` (product sales): transactions with quantities and values
- `professores` (instructors): personal data, profile and salary
- `professor_modalidade` (which instructor teaches which activity)
- `despesas` & `pagamentos_despesas`: operational costs (rent, maintenance, energy)

---

## 📑 Developed Scripts

### 📈 Business Evolution

1. Annual evolution of total costs (payroll + expenses)
2. Annual evolution of total revenues (memberships + product sales)
3. Annual evolution of new enrollments
4. Accumulated revenue by year
5. Accumulated costs by year
6. Product sales evolution over time

### 👥 Customer Profile and Behavior

7. Most frequent gender in attendance
8. Frequency comparison by age group
9. Most represented neighborhoods
10. Average ticket by student
11. Average ticket by neighborhood

### 🏋 Gym Usage Patterns

12. Most crowded periods (morning, afternoon, evening)
13. Most crowded days of the week
14. Most practiced activities
15. Average ticket by activity
16. Most sold products

### 💰 Financial and Strategy

17. Costs vs. revenues comparison
18. Highest-paid instructors (overall)
19. Highest-paid instructors by activity
20. Membership distribution by plan
21. Revenue share by plan
22. Most common payment methods
23. Instructors teaching more than one activity

---

## 🛠️ Tools Used

- SQL (MySQL)
- MySQL Workbench (or any RDBMS client)

---

🗃️ **Files**

/1 - Business Evolution – 6 SQL scripts (.sql format)

/2 - Customer Profile – 5 SQL scripts (.sql format)

/3 - Gym Usage Patterns – 5 SQL scripts (.sql format)

/4 - Financials & Strategy – 7 SQL scripts (.sql format)

/5 - Database – Tables in SQL or CSV format

README.md – Project documentation

---

🚀 **How to Use**

- Clone this repository
- Import the database into your favorite RDBMS (like MySQL)
- Run the SQL scripts to explore the insights
- Feel free to adapt queries or use them in your portfolio

---

📌 **Important Notes**

This dataset was entirely generated with Python and does **not reflect real people or businesses**.

Several queries use advanced SQL features like:
- CTEs (`WITH`)
- window functions (`ROW_NUMBER()`)
- date functions (`DATE_FORMAT`, `DATEDIFF`)

---

## 📬 Contact

- Email: gioferracini97@gmail.com
- LinkedIn: [linkedin.com/in/giovanni-ferracini](https://www.linkedin.com/in/giovanni-ferracini/)

---

⭐ If you found this analysis useful or insightful, feel free to star the repository!
