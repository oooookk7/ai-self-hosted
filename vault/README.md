Install Hashicorp Vault,

```
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update
helm install vault hashicorp/vault -n vault --create-namespace -f vault/values.yaml
```

Then, setup the Vault,

```
kubectl -n vault exec -it vault-0 -- vault operator init

# Do this 3 times until unsealed
kubectl -n vault exec -it vault-0 -- vault operator unseal 

# Check if unsealed
kubectl -n vault exec -it vault-0 -- vault status
```

After that, access the dashboard and create secrets for 3 users `root`, `litellm` and `pgvector`.

Install the external secrets operator to inject secrets,

```
helm repo add external-secrets https://charts.external-secrets.io
helm repo update
helm upgrade --install external-secrets external-secrets/external-secrets -n external-secrets --create-namespace -f vault/external-secrets-values.yaml
```

Generate the token for ESO utility,

```
vault login
vault token create -ttl=720h
```

Generate the secret for the token for ESO utility, 

```
kubectl -n external-secrets create secret generic vault-token --from-literal=token="$TOKEN"
kubectl create -f vault/clusterstore
```



