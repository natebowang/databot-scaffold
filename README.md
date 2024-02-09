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

### docker

[Install docker engine](https://docs.docker.com/engine/install/)
