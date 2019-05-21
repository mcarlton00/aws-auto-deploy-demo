{% from "map.jinja" import global with context %}

nginx-packages:
  pkg.installed:
    - pkgs:
      - nginx
{% if grains['os_family'] == 'RedHat' and
    grains['osmajorrelease'] > 7 %}
      - policycoreutils
      - policycoreutils-python
{% endif %}

nginx-config:
  file.managed:
    - name: {{ global.config_prefix }}/nginx/nginx.conf
    - user: root
    - group: {{ global.group }}
    - mode: 664
    - source: salt://nginx/files/nginx.conf
    - require:
      - nginx-packages

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - file: nginx-config
    - watch:
      - file: nginx-config

{% if grains['os_family'] == 'Debian' %}
disable-default-site:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
{% endif %}

{% if grains["os_family"] == "FreeBSD" and grains['osrelease']|float >= 10.1 %}
/etc/newsyslog.conf.d/nginx.conf:
  file.managed:
    - user: root
    - group: {{ global.group }}
    - mode: 644
    - source: salt://nginx/files/rotatelogs.conf
{% endif %}

nginx_conf_directory:
  file.directory:
    - name: {{ global.config_prefix }}/nginx/conf.d
    - user: root
    - group: {{ global.group }}
