{% from "map.jinja" import global with context %}
{% set static_pillar = salt['pillar.get']('static') %}

include:
  - nginx

static-nginx-config:
  file.managed:
    - name: {{ global.config_prefix }}/nginx/conf.d/static.conf
    - user: root
    - group: {{ global.group }}
    - mode: 664
    - makedirs: True
    - replace: False
    - source: salt://static/files/nginx-static.conf
    - template: jinja
    - require_in:
      - service: nginx

source-directory:
  file.directory:
    - name: {{ static_pillar.project_dir }}
    - user: www-data
    - group: www-data
    - dir_mode: 775

