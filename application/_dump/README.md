MySQL script for rainbowDB
==========================

##Export

###Full Dump

```sql
mysqldump -uroot --password= rainbow -r rainbow.sql

mysqldump -uroot --password= --databases rainbow --add-drop-database -r rainbow.sql
```

###Only Data

```sql
mysqldump --complete-insert --extended-insert --no-create-db -x -u root --password= rainbow > rainbowDataOnly.sql

mysqldump -u root --password= --complete-insert --no-create-info rainbow -r rainbowDataOnly.sql

mysqldump -uroot --password= rainbow -r rainbowDataOnly.sql
```

 - --complete-insert
 - --extended-insert
 - -n, --no-create-db
 - -x, --lock-all-tables

	 Locks all tables across all databases. This is achieved
	 by taking a global read lock for the duration of the
	 whole dump. Automatically turns --single-transaction and
	 --lock-tables off.

 - -u, --user=name
 - -p --password[=name]
 - --dump-date


###Only Structure

```mysql
mysqldump -uroot --password= --no-data rainbow -r rainbowStructure.sql
```

 * -d, --no-data
 * -r, --result-file=name

##Import
```mysql
mysql -uroot -p --default-character-set=utf8 database
SET names 'utf8'
SOURCE utf8.dump
```

###Drop all tables in DB
```mysql
 mysqldump -u[USERNAME] -p[PASSWORD] --add-drop-table --no-data [DATABASE] | grep ^DROP | mysql -u[USERNAME] -p[PASSWORD] [DATABASE]
```