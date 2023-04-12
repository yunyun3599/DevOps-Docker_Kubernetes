# 관련 명령어 모음  

### pod 실행
```sh
kubectl apply -f blue-green-app.yml
kubectl apply -f red-app.yml
```

### pod 실행 및 IP 확인  
```sh
kubectl get pod -o wide
```

### 컨테이너 IP 확인
```sh
kubectl exec blue-green-app -c blue-app -- ifconfig eth0  
kubectl exec blue-green-app -c green-app -- ifconfig eth0  
kubectl exec red-app -c red-app -- ifconfig eth0  
```

### 컨테이너 실행 로그 확인  
```sh
kubectl logs blue-green-app -c blue-app
kubectl logs blue-green-app -c green-app
kubectl logs red-app -c red-app
```

### 컨테이너에 설정된 환경변수 확인 (printenv)
```sh
kubectl exec blue-green-app -c blue-app -- printenv POD_IP NAMESPACE NODE_NAME
kubectl exec blue-green-app -c green-app -- printenv POD_IP NAMESPACE NODE_NAME
kubectl exec red-app -c red-app -- printenv POD_IP NAMESPACE NODE_NAME
```

### blue-app 컨테이너 -> green-app 컨테이너 /tree, /hello 요청 실행  
```sh
kubectl exec blue-green-app -c blue-app -- curl -vs localhost:8081/tree
kubectl exec blue-green-app -c blue-app -- curl -vs localhost:8081/hello
```

### blue-app 컨테이너 -> red-app 컨테이너 /rose, /hello 요청 실행  
```sh
$ export BLUE_POD_IP=$(kubectl get pod blue-green-app -o jsonpath="{.status.podIP}")
$ kubectl exec red-app -c red-app -- curl -vs $BLUE_POD_IP:8080/sky
$ kubectl exec red-app -c red-app -- curl -vs $BLUE_POD_IP:8080/hello
```

### 포트포워딩을 통해 웹브라우저로 각 컨테이너 요청/응답 확인  
```sh
$ kubectl port-forward blue-green-app 8080:8080
$ kubectl port-forward blue-green-app 8081:8081
$ kubectl port-forward red-app 8082:8080
```

### pod 종료
```sh
$ kubectl delete pod --all
```