```sql
CREATE USER developer IDENTIFIED BY mypassword;
GRANT CONNECT TO developer;
GRANT SELECT, INSERT, UPDATE ON books TO developer;
GRANT SELECT, INSERT, UPDATE ON users TO developer;
GRANT SELECT, INSERT, UPDATE ON rent TO developer;
```
