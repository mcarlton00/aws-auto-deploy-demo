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
    - user: root
    - group: {{ global.group }}
    - dir_mode: 700

website-source:
  git.latest:
    - name: {{ static_pillar.repo }}
    - user: root
    - target: {{ static_pillar.project_dir }}
    - rev: master
    - branch: master
    - require_in:
      - service: nginx
