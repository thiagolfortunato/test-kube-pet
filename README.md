# test-kube-pet

Used minikube to deploy Kubernetes cluster.

### Instalation

I use Arch Linux, then the firts step I just run `yay -S virtualbox`

The script below is based on Debian/Ubuntu Distribution:

```bash
./setup.sh
```

### Resources Used

- namespace
- deployments
- service
- ingress

### What I do?

- Create application healthcheck
- Get hostname where application it's running
- Build Image Docker with Docker Mult-Stage Build
- Deployment with Resource Quota
- Deployment with Headiness and Liveness
- Scale to 3 pods

### Deploy Application

This script configure all resources:

- Set minikube docker-env
- Build Docker Image
- Destroy pre exists resources
- Create k8s resources
- Output minikube ip

Just run:

```bash
./deploy.sh
```

### Improves or TODO

- Create EKS or GKE to deploy
- Configure CI/CD process
- Add Protheus + Grafana to monitoring and metrics
