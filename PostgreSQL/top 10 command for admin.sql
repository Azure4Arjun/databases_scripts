1. ��� ����� ����� ������� ������� � ���� ������ PostgreSQL?

# SELECT 
    relname AS "table_name", 
    relpages AS "size_in_pages" 
FROM 
    pg_class 
ORDER BY 
    relpages DESC 
LIMIT 
    1;

����������� ����� ����� ������� ������� (� ������� testtable1) � ���������. ������ ����� �������� ����� 8KB (�.�. ������ ������� � ������� � 2,3GB)

   TABLE_NAME   | size_in_pages 
----------------+---------------
 testtable1     |        299211

 
2. ��� ������ ������ ���� ���� ������ PostgreSQL?

# SELECT pg_database_size( 'sampledb' );

����������� ����� ������ ���� ������ � ������:

 pg_database_size 
------------------
      27641546936

���� �� ������ �������� ������ � ����� �������� (�������������) ������� � ��������� ��������� � ������� pg_size_pretty():

# SELECT pg_size_pretty( pg_database_size( 'sampledb' ) );

���������:

 pg_size_pretty 
----------------
 26 GB

 
3. ��� ������ ������ ������� � ���� ������ PostgreSQL?

# SELECT pg_size_pretty( pg_total_relation_size( 'testtable1' ) );

����������� ����� ������ ������� testtable1, ������� �������. ��������� ����� ��������� ����� � ������� ��� ������ �������, � �� � ������.

 pg_size_pretty 
----------------
 4872 MB

���� ��� ����� ������ ������ ������� ��� ��������, ����� ������� ��������� ����� ������:

# SELECT pg_size_pretty( pg_relation_size( 'testtable1' ) );

���������:

 pg_size_pretty 
----------------
 2338 MB

 
4. ��� ������ ������� ������ ������� PostgreSQL?

# SELECT version();

��������� ����� �������� �����:

                                           version                                            
----------------------------------------------------------------------------------------------
 PostgreSQL 9.3.1 on x86_64-unknown-linux-gnu, compiled by gcc (Debian 4.7.2-5) 4.7.2, 64-bit

 
5. ��� ��������� SQL-���� � PostgreSQL?

��� ������ ���� ���������� ����������� ������� � ���������� �������:

# \i /path/to/file.sql

��� /path/to/file.sql � ��� ���� � ������ SQL-�����. �������� ��������, ��� �� ������ ������ � ��������� ��� ������ ������������ postgres ����������.

 
6. ��� ���������� ������ ���� ��� ������ ������� PostgreSQL?

��� ������ ���� ���������� ����������� ������� � ���������� �������:

# \l

���������:

                                           List of databases
    Name     |   Owner    | Encoding  |   Collate   |    Ctype    |     Access privileges     
-------------+------------+-----------+-------------+-------------+---------------------------
 sampledb    | sampleuser | UTF8      | uk_UA.UTF-8 | uk_UA.UTF-8 | =Tc/sampleuser
             |            |           |             |             | sampleuser=CTc/sampleuser
 postgres    | postgres   | UTF8      | uk_UA.UTF-8 | uk_UA.UTF-8 | 
 template0   | postgres   | UTF8      | uk_UA.UTF-8 | uk_UA.UTF-8 | =c/postgres
             |            |           |             |             | postgres=CTc/postgres
 template1   | postgres   | UTF8      | uk_UA.UTF-8 | uk_UA.UTF-8 | postgres=CTc/postgres
             |            |           |             |             | pgsql=CTc/postgres
             |            |           |             |             | =c/postgres

 
7. ��� ���������� ������ ���� ������ � ���� ������ PostgreSQL?

��� ������ ���� ���������� ����������� ������� � ���������� ������� ��� ������� ������ ������ � ������� ��.

# \dt

���������:

                    List of relations
 Schema |              Name             | Type  | Owner  
--------+-------------------------------+-------+--------
 public | testtable1                    | table | sampleuser
 public | testtable2                    | table | sampleuser
 public | testtable3                    | table | sampleuser
 public | testtable4                    | table | sampleuser
 ...

 
8. ��� �������� ���������, ������� � ������ �������� ��������� ������� � PostgreSQL?

��� ������ ���� ���������� ����������� ������� � ���������� �������:

# \d testtable1

��� testtable1 � ��� �������

���������:

               Table "public.testtable1"
    Column    |          Type          | Modifiers 
--------------+------------------------+-----------
 begin_ip     | ip4                    | not null
 end_ip       | ip4                    | not null
 begin_num    | bigint                 | not null
 end_num      | bigint                 | not null
 country_code | character(2)           | not null
 country_name | character varying(255) | not null
 ip_range     | ip4r                   | 
Indexes:
    "testtable1_iprange_index" gist (ip_range) WITH (fillfactor=100)

 
9. ��� ���������� ����� ���������� ������� � ���������� ������� PostgreSQL?

# \timing

����� ���� ��� ������� ������ ������������ � ���������� ������� �� �������� ����������.
����������� ��� ����������� ����� ��� ��, ��� � ���������� � �������:

# \timing

 
10. ��� ���������� ��� ������� ���������� ������� PostgreSQL?

# \?

��� �������� ����� ������ �����, �.�. ����� DBA ������ ����� ��� ������� ��� ������� :-)

��� ��.
�����.
