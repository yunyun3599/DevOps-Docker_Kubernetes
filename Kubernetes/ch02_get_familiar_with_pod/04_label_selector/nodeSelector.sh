kubectl label node gke-my-cluster-default-pool-18f2f739-3cj6 env=animal
kubectl label node gke-my-cluster-default-pool-18f2f739-7h0n env=animal
kubectl label node gke-my-cluster-default-pool-18f2f739-tu27 env=plant

for i in {1..5};
do kubectl run dog-app-$i \
  --labels="species=dog" \
  --image=ubuntu:14.04 \
  --overrides='{"spec":{"nodeSelector":{"env":"animal"}}}'
done

kubectl get pod -o wide

kubectl delete pod -l species=dog