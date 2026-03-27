# SuperMart_Analysis_2014-2017
## Company Background
**SuperMart** is  a retail chain that operates across the United States offering a wide range of products including office supplies, furnitures, technology, and appliances. The company has 531 retail stores that operates across the United States with 10,000+ employees generating annual sales that grew from $484,000 in 2014 to $730,000 in 2017. 

Business growth, customers acquisition and retention have been the main goals to achieve in the company. By producing and analyzing clean transactional sales dataset, the company will be able to identify essential metrics and indicators to evaluate its performance in the marketplace.

## North Star Metrics
1. Sales Trends - Focusing on Sales Revenue, Quantity Sold,  Average Order Value (AOV), Total Profit, and Profit Margin
2. Product Performance - Analyzing sales and profits for each product sub-category, understanding the impact on sales and profit for its business growth.
3. Customer segment- Analyzing and evaluating customer segmentation by comparing between customer acquisition and retention.
4. Regional Comparison - An evaluation of sales and order by region.
An interactive Tableau dashboard can be downloaded here
The SQL queries regarding business analysis can be found here

 ## Data Structure Overview
 **SuperMart** database structure as seen below consists of 1 table:  with a total row count of 9994 records

![Data Structure Overview](https://github.com/handokosugiarto/SuperMart_Analysis_2014-2017/blob/main/Data%20Structure.png)
 
 
 ## Executive Summary

  ![Executive Summary](https://github.com/handokosugiarto/SuperMart_Analysis_2014-2017/blob/main/SuperMart%20Analysis.png) 
 
 
 ### Overview Findings
 1. Since its establishment in 2014, **SuperMart** has delivered consistent revenue growth, rising from $487K in 2014 to $733K in 2017, with average yearly growth rate or CAGR of 15%.
 2. Dispite of rising in sales revenue, **SuperMart** AOV has shown a decline trend on average from $243 in 2014 to $221 in 2017, with average yearly decline rate of -4%. This situation means that sales growth is driven by the increase in number of order and customer aquisition rather than higher spending per transaction.
 3. **SuperMart** has delivered consistent growth in quantity sales, rising from 7.6K in 2014 to 12.5K in 2017, with average yearly growth rate or CAGR of 18%.
 4. **SuperMart** has delivered consistent growth in profit, rising from $50K in 2014 to 93K in 2017, with average yearly growth rate of 24%.
 5. Profit margin is rising from 10% in 2014 to 13% in 2017.

## Insights Deep Dive

### Sales Trends
![Sales Trends](https://github.com/handokosugiarto/SuperMart_Analysis_2014-2017/blob/main/SuperMart%20Sales%20Trends.png)

1. SuperMart's sales performance demonstrates consistent revenue growth, achieving a CAGR 15% from 2014 to 2017. Additionally, sales trends exhibit a clear seasonal pattern with revenue peaking in Q4 each year, driven by an increased in consumer spending during the holiday shopping period in November and December. Notably, sales reached a peak of $280K in Q4 2017, representing a 30% increase from $196K in Q3 2017. While Q4 consistently represents the sales peak period, Q1 marks lowest point of the year, with performance gradually improving in subsequent quarters. On average, sales decline by approximatelly 53% from Q4 to Q1.
2. SuperMart demonstrates consistent growth in sales quantity or market demand, achieving a CAGR of 18% from 2014 to 2017. Following the seasonal pattern from sales revenue, sales quantity reached their peak in Q4 2017 (5K units sold) while Q1 reached the lowest sales in the year. With a CAGR 18% in sales quantity and 15% in sales revenue, this shows that sales volume is growing faster than revenue, sugesting a decline in average selling price, potentially driven by increase in discounting or shift toward lower price products. 
3. Profit has taken the same movement as sales revenue over the years. It has shown consistent growh with a CAGR 24% From 2014 to 2017. Despite of its growth movement, profit has reached its highest peak of $38K in Q4 2016, representing 58% increased from $16K in Q3 2016.  
4. Despite of consistent growth in sales revenue and profit, Average Order Value (AOV) has shown a fluctuative trends with downward tendencies from Q1 2014 to Q4 2017. At the establishment AOV reached $264 in Q1 2014, representing -13% decreased from $230 in Q4 2017. AOV exhibits a fluctuating trend, reflecting inconsistent customer purchasing behavior and the influence of seasonal or promotional factors.
5.  Profit margin shows quarterly fluctuations over the 2014-2017 period, while demonstrating an overal upward trend, increasing from 5% in Q1 2014 to 10% in Q4 2017. The margin peaked in Q1 2017 at 19% ($24K in profit), compared to 16% in Q4 2016 ($38K in profit). This comparison highlights a trade off between volume and profitability: Q4 2016 performance was driven by high sales volume likely due to holiday promotions, whereas Q1 2017 achieved higher profit margin despite of lower sales volume.

### Product Performance
![Product Performance](https://github.com/handokosugiarto/SuperMart_Analysis_2014-2017/blob/30cc455950b9c3d9bf8667e9f68285e41a288239/Subcategory%20metrics%20by%20year.png) 
1. Phones have become the leading revenue contributor from 2014 to 2017, outperforming other sub categories in total Sales. Total Phones sales has reached $330K from 2014 to 2017, representing 14.4% from total sales revenue in 2014 to 2017. Phones sales have consistently generated positive sales across period indicating stable and sustained demand. Phones sales has grown from $77K in 2014, representing 36% growth, to $106K in 2017. Phones' profits have grown from $12K in 2014 , representing 9% growth, to $13K in 2017. Eventhough profit margin has shown declining trends from 2014 to 2017 (15% to 12%), it is showing strong performance since the profit margin is in the range of average profit margin 2017 is 12%. Please find below for Top 10 highest and lowest selling products and  name that contributes to the phones sub-category performance over time (2014 -2017)

![Phones](https://github.com/handokosugiarto/SuperMart_Analysis_2014-2017/blob/54dd41907055e3748e350282a842679920c6fc6c/Tableaucharts/Top%2010%20Worst.png)
 
2. Chairs are next leading product sub-category after phones. The revenue has contributed 14.3% from total sales revene in 2014 to 2017.  The sales revenue has increased from $77K in 2014 to $96K in 2017 (23% increase).   

