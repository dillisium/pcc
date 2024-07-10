        # Use an official Ubuntu as a parent image
        FROM ubuntu:20.04

        # Set non-interactive mode for apt-get
        ENV DEBIAN_FRONTEND=noninteractive
        
        # Install necessary packages
        RUN apt-get update -y && \
            apt-get install -y apache2 mysql-client unzip nfs-common software-properties-common wget && \
            add-apt-repository ppa:ondrej/php -y && \
            apt-get update -y && \
            apt-get install -y libapache2-mod-php7.4 php7.4-mysql php7.4-intl php7.4-zip php7.4-xml php7.4-mbstring php7.4-gd php7.4-curl
        
        # Create and set permissions for ownCloud directory
        WORKDIR /var/www/html/
        RUN wget https://download.owncloud.com/server/stable/owncloud-complete-20210721.zip && \
            apt-get install -y unzip && \
            unzip owncloud-complete-20210721.zip && \
            chown -R www-data:www-data owncloud
        
        # Download and replace the image
        RUN cd /var/www/html/owncloud/core/img/ && \
            wget https://tunnelix.com/wp-content/uploads/2016/02/docker-wallpaper-black.jpg && \
            mv background.jpg background.jpg.back && \
            mv docker-wallpaper-black.jpg background.jpg
        
        # Set the ServerName directive globally
        RUN echo "ServerName 34.224.26.9" >> /etc/apache2/apache2.conf
        
        # Copy custom Apache configuration
        COPY owncloud-apache.conf /etc/apache2/sites-available/000-default.conf
        
        # Enable site and necessary Apache modules
        RUN a2enmod rewrite headers env dir mime && \
            a2ensite 000-default
        
        # Copy entrypoint script
        COPY docker-entrypoint.sh /usr/local/bin/
        RUN chmod +x /usr/local/bin/docker-entrypoint.sh
        
        # Expose port 80
        EXPOSE 80
        
        # Use the entrypoint script
        ENTRYPOINT ["docker-entrypoint.sh"]
        