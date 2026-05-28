Create the script configmap,

```
kubectl create configmap postgres-init-scripts --from-file=init-user-db.sh=postgres/init-user-db.sh
```

Install Postgres DB,

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm upgrade --install postgres bitnami/postgresql -n default -f postgres/values.yaml
```
