# Databot and Backtesting Scaffold

This is a framework for databot and backtesting.
The bot is designed for heavy-duty work, that can be very smart, but can't move around.

```bash
git clone https://github.com/natebowang/hawking.git
```

## Architect

- Operational Plane
    - EC2 instances

- Analytical Plane:
    - TimeScaled DB
    - Grafana

- Control Plane
    - Curl through an SSH tunnel

## Dependency

### asdf-vm

[install asdf-vm](https://asdf-vm.com/guide/getting-started.html)

```bash
cd ./
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf install
```

> TODO [Only use asdf when the folder contains /.tool-version](https://github.com/asdf-vm/asdf/issues/557)

### docker

[Install docker engine](https://docs.docker.com/engine/install/)
