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