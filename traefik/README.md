Create the ingress TLS secret,

```
kubectl create secret tls ingress-tls --cert=k8sflow.space.crt --key=k8sflow.space.key
```

Create the ingressroute to access the proxy dashboard,

```
kubectl create -f traefik/ingressroute.yaml
```