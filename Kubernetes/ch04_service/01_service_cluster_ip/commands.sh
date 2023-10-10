# 네임 스페이스 생성
kubectl create namespace snackbar

# Service, Deployment 배포
kubectl apply -f order.yml
kubectl apply -f order_deployment.yml
kubectl apply -f service.yml
kubectl apply -f service_deployment.yml
# 한 번에 모두 배포
kubectl apply -f service.yml

# 네임 스페이스의 모든 리소스 조회  
kubectl get all -n snackbar

# 네임 스페이스의 Service 상세 조회
kubectl get svc order -o wide -n snackbar
kubectl get svc payment -o wide -n snackbar

# snackbar 네임스페이스의 모든 Endpoints 리소스 확인
kubectl get endpoints -n snackbar

# Service ClusterIP 조회
kubectl get svc order -o jsonpath="{.spec.clusterIP}" -n snackbar
kubectl get svc payment -o jsonpath="{.spec.clusterIP}" -n snackbar

# 로컬에서 Service IP와 Port 호출 확인  
curl $(kubectl get svc order -o jsonpath="{.spec.clusterIP}" -n snackbar)
curl $(kubectl get svc payment -o jsonpath="{.spec.clusterIP}" -n snackbar)
