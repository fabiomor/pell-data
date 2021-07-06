# From Big Data to Smart Data-centric Software Architectures for City Analytics: the case of the PELL Smart City Platform

## Data repository

### Static Data
Static data should be imported with a dbms, the data has been created using Mysql Community Server 8.0.19.

```
mysqldump pelldb.sql
```
### Dynamic Data
Dynamic data contains 10 days of data daily grouped. Significant data is contained in 
```
["UrbanDataset"].["values"]["line"]
```
