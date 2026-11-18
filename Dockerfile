FROM mysql
COPY init.sql /docker-entrypoint-initdb.d. 
ENV MYSQL_ROOT_PASSWORD=Hyma123
EXPOSE 3306
