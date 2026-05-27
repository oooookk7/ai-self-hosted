Create the Kubernetes service account,

```
kubectl create -f headlamp/serviceaccount.yaml
kubectl create -f headlamp/clusterrolebinding.yaml
```

Create the config file,

```
kubectl -n kube-system create secret generic headlamp-kubeconfig --from-file=config=headlamp/kubeconfig.yaml
```

Then, install the Headlamp service,

```
helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/
helm install headlamp headlamp/headlamp --namespace kube-system -f headlamp/values.yaml
```
