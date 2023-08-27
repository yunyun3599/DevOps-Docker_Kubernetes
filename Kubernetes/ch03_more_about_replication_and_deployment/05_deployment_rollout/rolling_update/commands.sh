# Deployment 생성
kubectl apply -f deployment.yml

# 쿠버네티스 이벤트 확인
kubectl get events -w

# ReplicaSet이 생성한 Pod 상태 변화 확인
kubectl get rs -w

# Deployment를 통해 생성한 Pod 상태 변화 확인
kubectl get deployment -w

# Deployment 배포 진횅중/완료 상태 확인
kubectl rollout status deployment my-app

# app=my-app 레이브을 가지는 모든 리소스를 레이블과 함께 자세한 정보 조회
kubectl get all -l app=my-app -o wide --show-labels

# ReplicaSet을 yaml 형식으로 조회
kubectl get rs/<replicaset-name> -o yaml

# 컨테이너 이미지와 레이블 변경 후 재배포
kubectl apply -f deployment.yml

# Deployment 이벤트 확인
kubectl describe deployment my-app
