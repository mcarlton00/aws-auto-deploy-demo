{% from "base/map.jinja" import base with context %}

base-packages:
  pkg.installed:
    - pkgs:
      - vim
      - git
      - unzip
      - lsof
      - rsync
      - tmux
      - wget
      - {{ base.ack }}
      - {{ base.bzip2 }}
      - {{ base.pip }}
      - {{ base.virtualenv }}
      - {{ base.libxml2 }}
      - {{ base.libxslt }}
    - reload_modules: true
