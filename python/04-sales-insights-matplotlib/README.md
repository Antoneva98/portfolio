# Sales Insights Dashboard (Matplotlib)

**Business problem.** The team needs a quick visual read on how sales are distributed, how they trend over time, and what drives them — without a BI tool.

**Business questions.**
1. What is the distribution of sale values — which ranges are most common?
2. How do sales change over time, and is there seasonality?
3. Which product categories are most and least popular?
4. Is there a relationship between profit and total sales volume?

**Approach.** Four coordinated Matplotlib charts — histogram (distribution), line (trend over `order_date`), bar (category popularity) and scatter (sales vs profit) — after fixing the `order_date` data type.

**Findings.**
- Sales most frequently fall between 200 and 250.
- Volume grew Mar–Jun 2018, then turned cyclical; the peak was Dec 2018 (holiday-driven), followed by a decline.
- Fashion is the most popular category; Electronics the least.
- Profit and sales are positively related, with a rising sales floor as profit grows.

**Next steps.**
- *Marketing / Planning:* plan inventory and promotions around the December demand peak.
- *Product:* double down on Fashion; investigate why Electronics underperforms.

Preview: `../../assets/sales-insights-python.png` *(optional screenshot)*
Notebook: [`notebook.ipynb`](./notebook.ipynb) — renders on GitHub, or open via the Colab link inside.

Tools: pandas, Matplotlib.
