## pod 생성
```sh
$ kubectl apply -f dog-app.yaml
$ kubectl apply -f cat-app.yaml
$ kubectl apply -f bird-app.yaml
$ kubectl apply -f tree-app.yaml
```

## pod 조회
```sh
$ kubernetes get pod dog-app --show-labels
$ kubernetes get pod dog-app -L group
$ kubernetes get pod dog-app --label-columns group
```

## label 추가, 수정, 삭제
```sh
# label 추가
$ kubectl label pod bird-app location=ground

# label 수정
$ kubectl label pod bird-app location=sky --overwrite

# label 삭제
$ kubectl label pod bird-app location-
```

## Selector를 위해 설정해 둘 label
`group, location, species, legs`
```sh
# dog-app
$ kubectl label pod dog-app group=animal location=ground species=dog legs=four

# cat-app
$ kubectl label pod cat-app group=animal location=ground species=cat legs=four

# bird-app
$ kubectl label pod bird-app group=animal location=sky species=bird legs=two

# tree-app
$ kubectl label pod tree-app group=plant location=ground species=tree
```