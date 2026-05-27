# Setting Up AI Infrastructure

## Step 1. Setting up K3s Cluster

Run the following to install K3s,

```
curl -sfL https://get.k3s.io | sh -
```

Enable the Firewall rules,

```
sudo ufw enable
sudo ufw allow from 10.42.0.0/16 to any
sudo ufw allow 443/tcp
sudo ufw status verbose

# For external services,
# sudo ufw allow from x.x.x.x to 6443/tcp 8000/tcp 8443/tcp 9000/tcp
```

## Step 2. Install LiteLLM Gateway

Create the Kubernetes secret (from HuggingFace),

```
kubectl create secret generic litellm-secrets --from-literal=HF_TOKEN="xxx" --from-literal=LITELLM_MASTER_KEY="my-masterkeyzzz"
```

Setup the LiteLLM deployment,

```
kubectl create -f litellm.yaml
```

## Step 3. Install Istio

Install Helm,

```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

And install Istio Helm chart,

```
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
helm install istio-base istio/base -n istio-system --wait
helm install istiod istio/istiod -n istio-system --wait
```
