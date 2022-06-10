php74:  
  pkg.installed

php74-extensions:
  pkg.installed

/usr/local/etc/php-fpm.d/www.conf:
  file.line:
    - mode: replace
    - match: ';security.limit_extensions = .*'
    - content: 'security.limit_extensions ='

add_fpm_child: 
  file.line:
    - name: /usr/local/etc/php-fpm.d/www.conf
    - mode : replace
    - match: '.*pm.max.children = .*'
    - content: 'pm.max_children = {{ pillar['adumitriu_config']['fpm_child'] }}'

use_socket:    
  file.line:
    - name: /usr/local/etc/php-fpm.d/www.conf
    - mode: replace
    - match: '.*listen = .*'
    - content: 'listen = /var/run/php-fpm.sock'

/usr/local/etc/php.ini-production:
  file.line:
    - mode: replace
    - match: ';cgi.fix_pathinfo=1'
    - content: 'cgi.fix_pathinfo=0'

permission_socket:
  file.line:
    - name: /usr/local/etc/php-fpm.d/www.conf
    - mode: replace
    - match: ';listen.group = www'
    - content: 'listen.group = www'

php-fpm:
  service.running:
    - enable: True
