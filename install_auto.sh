#!/bin/bash
# 
#	Created by long.luo 
# 		2013/09/06
#

# Install The WebServer Software

# bison
tar -xvf bison-3.0.tar.gz 
cd bison-3.0
./configure 
make && make install
cd ..

# make
tar -xvf make-3.82.tar.gz 
cd make-3.82
./configure 
make && make install
cd ..

# cmake
tar -xvf cmake-2.8.11.2.tar.gz 
cd cmake-2.8.11.2
./configure   
make && make install
cd ..

# pcre
unzip -n pcre-8.31.zip 
cd pcre-8.31
./configure 
make && make install
cd ..

# zlib
tar -xvf zlib-1.2.6.tar.gz 
cd zlib-1.2.6
./configure 
make && make install
cd ..

# libpng
tar -xvf libpng-1.5.9.tar.gz 
cd libpng-1.5.9
./configure 
make && make install
cd ..

# libxml2
tar -xvf libxml2-2.6.32.tar.gz 
cd libxml2-2.6.32
./configure 
make && make install
cd ..
  
# freetype
tar -xvf freetype-2.4.9.tar.gz 
cd freetype-2.4.9
./configure
make && make install
cd ..

# curl
tar -xvf curl-7.25.0.tar.gz 
cd curl-7.25.0
./configure
make && make install
cd ..

# ncurses
tar -xvf ncurses-5.9.tar.gz 
cd ncurses-5.9
./configure
make && make install
cd ..

# MySQL
mkdir -p /usr/local/mysql                 //��װmysql 
mkdir -p /usr/local/mysql/data            //������ݿ�
groupadd mysql
useradd -r -g mysql mysql

tar -xvf mysql
cd mysql

cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql 	\ #��װ·��
-DMYSQL_DATADIR=/usr/local/mysql/data       	\ #�����ļ����λ��
-DSYSCONFDIR=/etc              				\ #my.cnf·��
-DWITH_MYISAM_STORAGE_ENGINE=1    			\ #֧��MyIASM����
-DWITH_INNOBASE_STORAGE_ENGINE=1 \     #֧��InnoDB����
-DWITH_MEMORY_STORAGE_ENGINE=1 \        #֧��Memory����
-DWITH_READLINE=1                    \     #��ݼ�����(��û�ù�)
-DMYSQL_UNIX_ADDR=/tmp/mysqld.sock      \   #�������ݿ�socket·��
-DMYSQL_TCP_PORT=3306                  \               #�˿�
-DENABLED_LOCAL_INFILE=1            \                #����ӱ��ص�������
-DWITH_PARTITION_STORAGE_ENGINE=1  \   #��װ֧�����ݿ����
-DEXTRA_CHARSETS=all                  \                   #��װ���е��ַ���
-DDEFAULT_CHARSET=utf8              \                   #Ĭ���ַ�
-DDEFAULT_COLLATION=utf8_general_ci

cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/usr/local/mysql/data -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DEXTRA_CHARSETS=all -DENABLED_LOCAL_INFILE=1 -DSYSCONFDIR=/etc -DMYSQL_TCP_PORT=3306 -DMYSQL_UNIX_ADDR=/tmp/mysqld.sock -DWITH_MEMORY_STORAGE_ENGINE=1 -DWITH_PARTITION_STORAGE_ENGINE=1 -DWITH_MYISAM_STORAGE_ENGINE=1
make && make install

cd /usr/local/mysql  
chown -R mysql:mysql . (Ϊ�˰�ȫ��װ��ɺ����޸�Ȩ�޸�root�û�)
scripts/mysql_install_db --user=mysql (�Ƚ�����һ����������Ȩ�޵��޸�)
chown -R root:mysql .  (��Ȩ�����ø�root�û��������ø�mysql�飬 ȡ�������û��Ķ�дִ��Ȩ�ޣ�������mysql "rx"��ִ��Ȩ�ޣ������û����κ�Ȩ��)
chown -R mysql:mysql ./data   (�����ݿ���Ŀ¼���ó�mysql�û�mysql�飬������chmod -R ug+rwx  ��дִ��Ȩ�ޣ������û�Ȩ��һ��ɾ������mysql�û�Ȩ��)
cd ..

# Nginx
group add www
useradd -r -g www www
cd /usr/local/src/
tar -xvf nginx-1.4.2.tar.gz 
cd nginx-1.4.2
./configure --user=www --group=www --prefix=/usr/local/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-http_realip_module --with-http_addition_module --with-http_gzip_static_module --with-http_random_index_module --with-http_stub_status_module --with-http_sub_module --with-http_dav_module
mkdir -p /var/nginx
mkdir -p /var/nginx/logs
chown -R /var/nginx
chmod +w /var/nginx
cd ..

# PHP




# WordPress






 













