# Deployment 생성
kubectl apply -f deployment.yml

# Deployment 배포 진횅중/완료 상태 확인
kubectl rollout status deployment my-app

# deployment 이미지 변경
kubectl set image deployment/my-app my-app=yoonjeong/my-app:2.0

# 쿠버네티스 deployment 확인
kubectl get deployment my-app -o wide

# deployment 변경 사유 남기기
kubectl annotate deployment/my-app kubernetes.io/change-cause="image updated to 2.0"

# revision 기록 확인
kubectl rollout history deployment/my-app

# 특정 revision 상세 기록 보기
kubectl rollout history deployment/my-app --revision=2

# 이전 버전으로 deployment 롤백
kubectl rollout undo deployment/my-app

# 특정 revision 버전으로 deployment 롤백
kubectl rollout undo deployment/my-app --to-revision=1
