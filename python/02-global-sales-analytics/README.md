# Global Sales Analytics — Cleaning, Insights & BI

**Business problem.** Sales data lives across multiple tables with inconsistent formatting, missing values, duplicates and anomalies. Management needs a clean, joined dataset and a clear read on which categories drive revenue and profit.

**Business questions.**
1. Is the data clean enough to trust (duplicates, missing values, anomalies)?
2. Which product categories generate the most revenue, cost and profit?
3. How do financial metrics compare across categories?

**Approach.** Standardised formatting, computed descriptive statistics, removed missing values / duplicates / anomalies, joined tables, then built pivots and visualised financial metrics by category.

**Findings.**
- Office Supplies and Household generate the highest revenue.
- The same two categories also show the largest profit — strong profitability, not just turnover.

**Next steps.**
- *Product / Merchandising:* prioritise inventory and assortment for the top profit-driving categories.
- *Finance:* review low-profit categories for pricing or cost issues before scaling them.

Notebook: [`notebook.ipynb`](./notebook.ipynb) — renders on GitHub, or open via the Colab link inside.

Tools: pandas, NumPy, Matplotlib, Seaborn.
