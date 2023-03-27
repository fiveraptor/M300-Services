FROM mysql:latest

# Set root user password
ENV MYSQL_ROOT_PASSWORD 123456

# Create a database
ENV MYSQL_DATABASE mydatabase

# Create a new user and grant privileges
ENV MYSQL_USER user
ENV MYSQL_PASSWORD 123456


# Expose default MySQL port
EXPOSE 3306

# Start MySQL server on container start
CMD ["mysqld"]
