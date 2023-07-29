# build MySql

docker pull mysql:8.0.20

# ports:
# - "3306:3306"

# volumes:
# - /home/projects/mbp/mysql/conf/my.cnf:/etc/mysql/my.cnf
# - /home/projects/mbp/mysql/data:/var/lib/mysql

# MYSQL_ROOT_PASSWORD:tj2feMK8ppTyLlei

docker run --restart=on-failure:5 \
--privileged=true \
--name mysql-mbp \
-p 3306:3306 \
-v /home/projects/mbp/mysql/conf/my.cnf:/etc/mysql/my.cnf \
-v /home/projects/mbp/mysql/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=12345678 \
-d mysql:8.0.20 \