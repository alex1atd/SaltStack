install_webserver:
  pkg.installed:
    - name: nginx

  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx
