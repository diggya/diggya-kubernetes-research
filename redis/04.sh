#!/bin/sh

cat > redis-slave-service.yaml << ZZZ
apiVersion: v1
kind: Service
metadata:
  name: redis-slave
  labels:
    app: redis
    role: slave
    tier: backend
spec:
  ports:
  - port: 6379
  selector:
    app: redis
    role: slave
    tier: backend
ZZZ

kubectl apply -f redis-slave-service.yaml
sleep 1
kubectl get services

