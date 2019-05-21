{% set project_dir = salt['pillar.get']('plone:project_dir') %}

include:
  - .code

plone-buildout:
  cmd.run:
    - name: {{ project_dir }}/env/bin/buildout -N
    - cwd: {{ project_dir }}
    - runas: zope
    - require:
      - file: buildout-config
