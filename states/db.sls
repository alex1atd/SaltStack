mysql80-server:
  pkg.installed

mysql-server:
  service.running:
    - enable: True

change_sql_pass:
  cmd.run:
    - name: mysql -e 'ALTER USER 'root'@'localhost' IDENTIFIED BY "{{ pillar['adumitriu_config']['sql_password'] }}"; flush privileges;'
    - unless: mysql -u root -p"{{ pillar['adumitriu_config']['sql_password'] }}"
