# ReplicaSet 생성
kubectl apply -f my-app-replicaset2.yaml

# Pod와 레이블 확인 
kubectl get pod --show-labels

# ReplicaSet과 Pod Template 확인
kubectl get rs my-app-replicaset -o wide

# ReplicaSet의 replicas 변경
kubectl scale rs my-app-replicaset --replicas=3

# ReplicaSet과 Pod Template 확인
kubectl get rs my-app-replicaset -o wide

# Pod replicas 3 -> 1로 줄이기
# ReplicaSet의 replicas 변경
kubectl scale rs my-app-replicaset --replicas=1

# ReplicaSet 이벤트 확인
kubectl describe rs my-app-replicaset

# Replicaset 삭제
kubectl delete rs my-app-replicaset