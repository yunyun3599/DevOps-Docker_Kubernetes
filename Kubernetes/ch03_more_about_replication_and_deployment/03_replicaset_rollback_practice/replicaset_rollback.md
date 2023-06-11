# ReplicaSet으로 Pod 롤백하기

## label 변경을 통한 rollback
1. 2.0 버전의 이미지를 ReplicaSet으로 배포
2. ReplicaSet이 생성한 파드로 요청을 전달해서 응답을 확인
3. ReplicaSet의 Pod 템플릿 이미지를 1.0 버전으로 변경하고 적용
4. 2.0 버전의 pod label을 모두 변경
5. 1.0 버전으로 요청을 실행하고 2번과 응답을 비교 (롤백 여부 확인)