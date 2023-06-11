# ReplicaSet todtjd
kubectl apply -f replicaset.yaml

# Pod 목록과 app 레이블 확인
kubectl get pod -L app

# ReplicaSet과 Pod Template 확인
kubectl get rs my-app-replicasest -o wide

# 포트포워딩 8080:8080
kubectl port-forward rs/my-app-replicaset 8080:8080

# 5번 요청 실행
for i in {0..5};for i in {0..5};
do curl -vs localhost:8080;
done

# ReplicaSet의 my-app 컨테이너 이미지를 이전 버전(1.0)으로 변경
kubectl set image rs/my-app-replicaset my-app=yoonjeong/my-app:1.0

# ReplicaSet과 Pod Template 확인
kubectl get rs my-app-replicaset -o wide

# Pod의 Owner 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# 실행중인 2.0 버전의 모든 Pod Label 변경
kubectl label pod <pod-name> app=to-be-fixed --overwrite
kubectl label pod <pod-name> app=to-be-fixed --overwrite
kubectl label pod <pod-name> app=to-be-fixed --overwrite

# 레이블을 변경한 Pod의 owner 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet 확인 (변경된 이미지 확인)
kubectl get rs my-app-replicaset -o wide

# Pod 목록 확인
kubectl get pod

# ReplicaSet 이벤트 확인 
kubectl describe rs my-app-replicaset

# Pod의 로그 확인
kubectl logs <pod-name>

# 포트포워딩 8080:8080
kubectl port-forward rs/my-app-replicaset 8080:8080

# 요청 실행
curl localhost:8080

# ReplicaSet 스케일 조정
kubectl scale rs/my-app-replicaset --replicas 0
kubectl scale rs/my-app-replicaset --replicas 3

# ReplicaSet 삭제
kubectl delete rs/my-app-replicaset
