# fancy-snackbar 네임스페이스 생성 
kubectl create namespace fancy-snackbar

# 오브젝트 생성
kubectl apply -f delivery.yml

# project=snackbar 레이블을 가진 모든 리소스 조회
kubectl get all -l project=snackbar --all-namespaces

# project=snackbar 레이블을 가진 Service endpoints 조회
kubectl get endpoints -l project=snackbar --all-namespaces

# ip 주소를 이용한 curl 요청  
kubectl exec <order pod 이름> -n snackbar -- curl -s <delivery-service ip>:8080

# 서비스 이름을 이용한 curl 요청
kubectl exec <order pod 이름> -n snackbar -- curl -s delivery.fancy-snackbar

# order 컨테이너 환경변수 목록 조회
kubectl exec <order pod 이름> -n snackbar -- env

# 리소스 전체 삭제
kubectl delete all -l projet=snackbar --all-namespace