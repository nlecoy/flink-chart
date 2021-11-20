# Apache Flink Helm Chart

⚠️ This is a work in progress and should not be used in production ⚠️

This chart will bootstrap an Apache Flink deployment on a Kubernetes cluster using the Helm package manager.

## Quickstart

### Install

#### Step 1 - Add this Helm repository

```sh
$ helm repo add nlecoy https://nlecoy.github.io/flink-chart/
$ helm repo update
```

#### Step 2 - Install this chart

```sh
$ export FLINK_NAME="flink-cluster"
$ export FLINK_NAMESPACE="flink"

$ helm install \
  $FLINK_NAME \
  nlecoy/flink \
  --namespace $FLINK_NAMESPACE \
  --version "1.X.X" \
  --values ./custom-values.yaml
```

#### Step 3 - Locally expose the Flink UI

```sh
kubectl port-forward svc/${FLINK_NAME}-jobmanager 8081:8081 --namespace $FLINK_NAMESPACE
```

### Upgrade

> __WARNING__: always consult the [CHANGELOG](CHANGELOG) before upgrading chart versions

```sh
$ helm repo update

$ helm upgrade \
  $FLINK_NAME \
  nlecoy/flink \
  --namespace $FLINK_NAMESPACE \
  --version "1.X.X" \
  --values ./custom-values.yaml
```

### Uninstall:

```sh
$ helm uninstall $FLINK_NAME --namespace $FLINK_NAMESPACE
```