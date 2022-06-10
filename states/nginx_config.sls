/usr/local/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://docs/nginx.conf
    - replace: true

/usr/local/www/default/phpinfo.php:
  file.managed:
    - source: salt://docs/phpinfo.php
    - makedirs: True

/usr/local/www/default/index.html:
  file.managed:
    - source: salt://docs/index.html
