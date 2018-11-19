# ASSIGNEMNT 1
##  RED SHIFT
Redshift is truly a virtual version of a traditional data warehouse. Database administrators provision resources just like they would in an on-premise warehouse–they choose the type of node, the number of nodes per cluster, the locations of those clusters, and the type of network connection. For teams that want to optimize their data warehouse to get the maximum performance possible, this level of customizability can be very attractive. It also integrates easily with other AWS components, making it extra attractive to teams already using S3 or EC2.

* **Loading Data:** As you might expect, Redshift can load structured data from many AWS sources (S3, DynamoDB, etc.) 
* **Query Processing:** In many head-to-head tests, Redshift has been shown to outperform other cloud-based options, though achieving the highest possible speeds may involve a fair amount of tweaking and customization. Another cool feature of Redshift is Spectrum, which allows you to run queries against data stored in S3 without performing any ETL operations. One downside: Redshift queries are written in a dialect of PostgreSQL that doesn’t support a number of data types and functions.
* **Scalability:** Redshift clusters need to be manually spun up and shut down via the AWS Management Console. It’s important to make sure you shut down clusters that you’re not actively using to avoid extra charges.
* **Support and Maintenance**: Redshift monitors all system components for failures and recovers them automatically. Other maintenance tasks fall on the user.

## GOOGLE BIGQUERY
BigQuery is at the opposite end of the customizability/ease-of-use spectrum. The heart of BigQuery is a novel query engine built on Google’s Dremel project. Like Hive, Dremel sits on a file management system and translates SQL queries into low-level instructions. Dremel’s approach to queries allows it to pore through billions of rows of data in just a few seconds, making it especially adept for ad hoc queries. The other thing that sets BigQuery apart is that it totally abstracts away the provisioning, assigning, and maintaining of resources, all of which is taken care of automatically by Google. This makes BigQuery ideal for small organizations or teams that prioritize ease of use over maximum performance.

* **Loading Data:** Data can be loaded from Google Cloud Storage, readable data sources, or streamed in. Google handles the formatting and processing of data–you just connect the source. Even cooler, BigQuery allows you to query external data sources including Google Cloud Storage and Google Drive. (You can even query shared and public datasets without loading them at all.)
* **Query Processing:** Running queries in BigQuery is pretty straightforward. BigQuery supports standard SQL, as well as some semi-structured data types like JSON and CSV. One consideration is that BigQuery limits the number of queries you can run concurrently–fortunately, it also includes features that allow you to prioritize some queries over others.
* **Scalability:** Scalability isn’t really a concern with BigQuery. All storage is handled by Google’s Colossus file management system, while Google’s Borg cluster-management system handles computing, assigning jobs automatically to Google’s store of machines, consisting of hundreds of thousands of CPUs.
* **Support and Maintenance:** Because Google abstracts away all aspects of resource provisioning and data management, there’s no need for periodic maintenance. In most cases, this is an advantage, since you won’t need to perform maintenance tasks in order to maintain high performance. On the other hand, it also means you easily amend or delete old data–you’ll have to truncate and recreate the whole table with new data.

## SNOWFLAKE

In between the customizability of Redshift and the ease of BigQuery there’s Snowflake. In essence, Snowflake is a custom query engine and data storage format built on top of AWS architecture: Storage is handled by S3, while computing is taken care of by EC2. Once you load data into Snowflake, that’s it–they handle organization, compression, metadata, encryption, etc. The only way you can access your data after that is through queries. Snowflake processes queries across “virtual warehouses,” which are clusters of massively parallel processing (MPP) nodes provisioned from EC2. Each query is assigned to its own warehouse, meaning that complex or computationally expensive queries running in one warehouse won’t affect the performance of your other warehouses. Even better, these warehouses are highly elastic, meaning they can provision additional computing resources automatically.

* **Loading Data:** A key feature of Snowflake is its native support for both structured and semi-structured data, which it can ingest without a complex ETL pipeline or preprocessing. The advantage here is that it preserves the flexibility of semi-structured data without sacrificing performance when it comes to queries. Though Snowflake doesn’t come with support for streaming data out of the box, it does allow you to connect to Spark to ingest streaming data.
* **Query Processing:** Like BigQuery, Snowflake uses standard SQL, but with some added extensions that allow you to query both structured and semi-structured data at the same time. Some tests and anecdotal evidence have shown that Snowflake performs best with smaller datasets (think gigabytes vs petabytes), which could be a consideration for organizations that don’t need to crunch through the biggest datasets in the world.
* **Scalability:** Similar to BigQuery, Snowflake touts its ability to scale up and down seamlessly. Computing and storage are de-coupled, allowing these resources to be distributed more efficiently. That said, as in Redshift, you can still manually provision larger or smaller virtual warehouses depending on the complexity of your queries.
* **Support and Maintenance:** Snowflake handles maintenance, updates, and security. There’s no need to maintain indexes, clean files, or update metadata.