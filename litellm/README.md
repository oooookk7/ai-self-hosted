## LiteLLM Service Setup

### Step 1) Create the secret

Create the Kubernetes secret (from HuggingFace) and the masterkey,

```
kubectl create secret generic litellm-secrets --from-literal=HF_TOKEN="xxx" --from-literal=LITELLM_MASTER_KEY="my-masterkeyzzz"
```