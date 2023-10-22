# 환경 변수를 이용한 Service 호출

# 네임 스페이스 생성
kubectl create namespace snackbar

# Service, Deployment 배포
kubectl apply -f service.yml

# order 컨테이너 환경변수 확인  
kubectl exec <order-pod> -n snackbar -- env | grep PAYMENT

# payment 컨테이너 환경변수 확인  
kubectl exec <payment-pod> -n snackbar -- env | grep ORDER

# snackbar 네임스페이스의 order Pod의 컨테이너 쉘 접속  
kubectl exec -ti <order-pod> -n snackbar -- sh

# payment 서비스 환경변수를 이용하여 Payment 호출   
curl $PAYMENT_SERVICE_HOST:$PAYMENT_SERVICE_PORT 

# payment 서비스의 로드 밸런싱 확인  
for i in `seq 1 10`; do curl -s $PAYMENT_SERVICE_HOST:$PAYMENT_SERVICE_PORT; done
