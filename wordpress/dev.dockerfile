FROM wordpress:php8.2-fpm

RUN yes | pecl install xdebug-3.3.2 \
    && echo "zend_extension=xdebug" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=develop,debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.log_level=0" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN echo "upload_max_filesize = 128M" > /usr/local/etc/php/conf.d/user.ini \
    && echo "post_max_size = 128M" >> /usr/local/etc/php/conf.d/user.ini