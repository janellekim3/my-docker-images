FROM wordpress:latest

# install the PHP extensions we need
RUN apt-get update && apt-get install -y unzip && rm -r /var/lib/apt/lists/*
RUN touch /usr/local/etc/php/conf.d/upload-limit.ini \ && echo "upload_max_filesize = 32M" >> /usr/local/etc/php/conf.d/upload-limit.ini \ && echo "post_max_size = 32M" >> /usr/local/etc/php/conf.d/upload-limit.ini	

RUN a2enmod headers

VOLUME /var/www/html
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
