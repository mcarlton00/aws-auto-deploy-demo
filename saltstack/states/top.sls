{% set role = salt['grains.get']('ec2_roles', '')[0] %}

base:
  '*':
    - base
  'ec2_roles:{{ role }}':
    - match: grain
    - {{ role }}
