FROM centos:6.7

MAINTAINER Kapiwebdev <www.Kapiwebdev.com>

# install http
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm


# install httpd
RUN yum -y install httpd

#install complements
RUN yum -y install vim-enhanced bash-completion unzip wget

#install mysql 5.7
RUN wget http://dev.mysql.com/get/mysql57-community-release-el6-11.noarch.rpm
RUN yum -y localinstall mysql57-community-release-el6-11.noarch.rpm
RUN yum -y install mysql mysql-community-server 

# install PHP 7.1.11 with all the dependencies necessary for magento 2.2.1
#RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
#RUN yum install -y mod_php71cd w php71w-cli php71w-common php71w-gd php71w-mbstring php71w-mysqlnd php71w-xml php71w-bcmath php71w-intl php71w-mcrypt php71w-soap

RUN yum -y update && yum -y install epel-release && wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm && wget https://centos6.iuscommunity.org/ius-release.rpm && rpm -Uvh ius-release*.rpm && yum -y update
RUN yum -y install php70u php70u-pdo php70u-mysqlnd php70u-opcache php70u-xml php70u-mcrypt php70u-gd php70u-devel php70u-mysql php70u-intl php70u-mbstring php70u-bcmath php70u-json php70u-iconv php70u-soap




# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar composer && chmod a+x composer && mv composer /usr/local/bin/composer





	
CMD ["echo","Image completed!"]