{% from "supervisor/map.jinja" import supervisor with context %}

{{ supervisor.pkg }}:
  pkg.installed

supervisor-service:
  service.running:
    - name: {{ supervisor.service }}
    - enable: True
