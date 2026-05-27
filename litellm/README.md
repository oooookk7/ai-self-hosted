Create the Kubernetes secret (from HuggingFace) and the masterkey,

```
kubectl create secret generic litellm-secrets --from-literal=HF_TOKEN="xxx" --from-literal=LITELLM_MASTER_KEY="my-masterkeyzzz"
```

Install the rest of the Kubernetes components,

```
kubectl create -f litellm/configmap.yaml
kubectl create -f litellm/deployment.yaml
kubectl create -f litellm/service.yaml
kubectl create -f litellm/ingress.yaml
```
