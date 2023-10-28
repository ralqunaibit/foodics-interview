# foodics-interview

## Technologies
I would like to highlight that I have designed this solution with a focus on simplicity, utilizing the following components:

- DigitalOcean, for hosting infrastructure.
- Terraform, to provision a Droplet and deploy the stack.
- Docker Compose, to manage the applications and Nginx.
- A Bash script to facilitate seamless application upgrade.
- GitHub Actions, to efficiently build the Docker images and push them to DockerHub.


## Tree


├── airports                &nbsp; &nbsp; &nbsp; Dockerfile and Jar to build the image.\
├── airports-1              &nbsp; &nbsp; &nbsp; The same but for the newer version.\
├── countries               &nbsp; &nbsp; &nbsp; The same but for countries Jar.\
├── docker-compose.yml      &nbsp; &nbsp; &nbsp; The compose for deploying the stack.\
├── nginx.conf              &nbsp; &nbsp; &nbsp; The nginx configurations.\
├── terraform               &nbsp; &nbsp; &nbsp; The terraform main yaml.\
└── upgrade.sh              &nbsp; &nbsp; &nbsp; The script to upgrade the airports.\


## How to run
```
cd terraform
terraform init
terraform apply
# note you need to provide the DigitalOcean token and the ssh Fingerprint
```

## How it Works
The architecture of the stack is simple, comprising Docker containers operating on top of a DigitalOcean Droplet. An Nginx container serves as a reverse proxy, enabling access to the containers via port 8000. Ensuring seamless, zero-downtime upgrades is facilitated by the inclusion of a backup service within the Nginx configuration. This ensures a smooth upgrade process for the primary service without disruption or concern.
