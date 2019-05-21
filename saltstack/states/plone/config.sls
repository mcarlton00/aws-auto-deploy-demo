{% from "supervisor/map.jinja" import supervisor with context %}
{% from "map.jinja" import global with context %}
{% set project_dir = salt['pillar.get']('plone:project_dir') %}

include:
  - supervisor
  - .user

{{ project_dir }}-exists:
  file.directory:
    - name: {{ project_dir }}
    - user: zope
    - group: zope
    - dir_mode: 775

supervisor-plone-config:
  file.managed:
    - name: {{ supervisor.conf_dir }}/plone.conf
    - user: root
    - group: {{ global.group }}
    - mode: 664
    - makedirs: True
    - replace: False
    - source: salt://plone/files/supervisor-plone.conf
    - template: jinja
    - require:
      - user: zope
    - require_in:
      - service: supervisor-service

nginx-plone-config:
  file.managed:
    - name: {{ global.config_prefix }}/nginx/conf.d/plone.conf
    - user: root
    - group: {{ global.group }}
    - mode: 664
    - makedirs: True
    - replace: False
    - source: salt://plone/files/nginx-plone.conf
    - template: jinja

{% if grains['os_family'] == 'FreeBSD' %}
freetype-symlink:
  file.symlink:
    - name: /usr/local/include/freetype
    - user: root
    - group: {{ global.group }}
    - mode: 755
    - target: /usr/local/include/freetype2
    - force: True
{% endif %}
