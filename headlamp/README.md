Install Helm charts,

```
helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/
helm install my-headlamp headlamp/headlamp --namespace kube-system -f headlamp/values.yaml
```

