# Sera-Growth-Analysis

## Objectives

Sera is an international SaaS company providing clients with financial information for investments, I was tasked with transforming and analyzing subscription payment data. The primary objective of this project is to help the business gain insights into sales trends, customer retention, and transaction performance. To achieve this, I designed a database transformation process followed by data analysis and visualization in Power BI, creating actionable insights to guide business decisions.

This project covers the entire workflow from transforming raw data to visualizing insights through an interactive dashboard.

## Tools & Techniques

- **SQL (PostgreSQL)**: For data transformation and analysis.
- **Power BI**: For data modeling and visualization.
- **Power Query**: For data cleaning and importing into Power BI.
  
## Datasource
<a href = "https://resagratia.com"> DataScience Capstone project on Resagratia </a>

## Data Transformation in SQL

The initial data provided by the sales team was raw and unstructured. I wrote a SQL view to transform the data, focusing on standardizing key fields like transaction dates, user IDs, payment channels, card types, and transaction statuses. This transformation was necessary to enable efficient querying and analysis of the data.

- **Key Transformations:**
  - Conversion of string-based transaction dates to timestamp format.
  - Grouping and categorization of card types into broader groups (e.g., Visa, Mastercard).
  - Creating a clear distinction between credit and debit cards.
  - Standardizing the transaction statuses (e.g., success, failed, abandoned).
  
![Data Tranformation in SQL](https://github.com/RihannatAdekunle/Sera-Growth-Analysis/blob/main/Data%20Tranformation%20sera.sql)

## Data Analysis in SQL

Several analytical queries were designed to answer business-critical questions:
- The total number of transactions.
- The period covered in the dataset and the trends over time.
- Transaction counts by status (success, failed, abandoned) and their respective percentages.
- Monthly revenue split by payment channel, with currency conversion for USD transactions.
- Subscriber activity and retention by tracking active months and user behaviors.
- Identification of users with unsuccessful subscription attempts over multiple months.

These analyses provided the foundation for the visual insights presented in the dashboard.
![Data Analysis in SQL](https://github.com/RihannatAdekunle/Sera-Growth-Analysis/blob/main/Data_analysis_sera_payments.sql)

## Data Modeling and Visualization in Power BI

After cleaning and transforming the data, I imported it into Power BI to create a dynamic and interactive dashboard. The dashboard includes the following key features:

### Sales Dashboard:
- **Total Sales in NGN and USD**: Summarized monthly sales figures and comparisons with the previous month.
- **Monthly Trend of Subscribers**: Displays the number of subscribers over time, showing peaks and dips.
- **Sales by Transaction Status**: A breakdown of sales by success, failed, and abandoned transactions.
- **Sales by Channel**: Visualizes how different payment channels contribute to overall sales.
- **Sales by Card Bank**: Highlights the distribution of transactions based on card types and banks.
- **Sales by Country**: Provides insights into the geographic distribution of sales.

### Transaction Dashboard:
- **Total Transactions and Successful Transactions**: Summarizes the number of transactions and the success rate.
- **Monthly Trend of Transactions**: Tracks the volume of transactions over time, identifying peak periods.
- **Transaction Status Breakdown**: A pie chart showing the percentage of successful, failed, and abandoned transactions.
- **Transactions by Channel**: Displays which payment methods are most frequently used by customers.
- **Transaction by Country**: A world map view showing transaction distribution by geographic location.
## Data modelling
![Data Modelling](https://github.com/RihannatAdekunle/Sera-Growth-Analysis/blob/main/Assets/Data%20modelling.JPG)

## Sales Dashboard
![Sales Dashboard](https://github.com/RihannatAdekunle/Sera-Growth-Analysis/blob/main/Assets/sera%20sales.JPG)

## Transaction Dashboard
![Transaction Dashboard](https://github.com/RihannatAdekunle/Sera-Growth-Analysis/blob/main/Assets/sera%20transaction.JPG)

## Growth Analysis & Recommendations

- **Sales Growth Trends**: The dashboard clearly shows seasonal patterns and a peak in August, followed by a gradual decline. This presents an opportunity to analyze factors contributing to the peak and implement strategies to sustain higher sales volumes.
- **Retention Strategies**: The analysis of active subscribers and failed transactions suggests that there is a significant number of users with multiple failed attempts. A targeted re-engagement strategy for these users could help improve retention and boost successful transactions.
- **Channel Optimization**: The performance of different payment channels highlights opportunities to streamline and promote more efficient channels, particularly where card types like "Visa" and "Mastercard" show strong success rates.

## Download
<a href = "https://github.com/RihannatAdekunle/Sera-Growth-Analysis/raw/refs/heads/main/Assets/sera%20sales.pbix"> Download Power bi

