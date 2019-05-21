# AWS Auto Website Deployment

Serves as a demo for my "Deploying Services to AWS Without Leaving the Comfort of your Desktop" talk.

- Terraform will deploy a VPC, a salt master, and a ec2 instance to be used for a static website.
- Saltstack will configure the servers and deploy the static website
- static-source is a mkdocs project to generate the static site used in the demo
- static-html is the generated static site
