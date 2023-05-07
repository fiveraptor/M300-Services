FROM ubuntu:20.04

ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
    && rm -rf /var/lib/apt/lists/*

RUN rm /var/www/html/index.html

RUN echo '<h1>Test</h1>' > /var/www/html/index.html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
