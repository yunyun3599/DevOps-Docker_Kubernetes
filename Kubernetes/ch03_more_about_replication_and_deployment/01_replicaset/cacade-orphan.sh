# ReplicaSet 삭제
kubectl delete rs blue-replicaset

# Replicaset과 pod 목록 확인
kubectl get rs
kubectl get pod

# ReplicaSet 배포
kubectl apply -f replicaset.yaml

# Pod 의 Owner 정보 확인 (어떤 ReplicaSet이 주인인지 여부 확인)
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet만 삭제 (orphan O)
kubectl delete rs blue-replicaset --cascade=orphan

# ReplicaSet과 Pod 목록 확인
kubectl get rs
kuvectl get pod

# Pod의 Owner 정보 확인 
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet의 replicas를 2로 변경 후 재배포  
kubectl apply -f replicaset.yaml

# ReplicaSet 이벤트 확인  
kubectl describe rs blue-replicaset

# ReplicaSet 삭제 
kubectl delete rs/blue-replicaset