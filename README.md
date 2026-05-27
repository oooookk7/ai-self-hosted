# Setting Up AI Infrastructure

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
