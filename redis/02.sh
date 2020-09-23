#!/bin/sh

cat > redis-master-service.yaml << ZZZ
apiVersion: v1
kind: Service
metadata:
  name: redis-master
  labels:
    app: redis
    role: master
    tier: backend
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis
    role: master
    tier: backend
ZZZ
kubectl apply -f redis-master-service.yaml
sleep 1
kubectl get service

