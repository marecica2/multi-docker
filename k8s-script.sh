# set the project
gcloud config set project multi-k8s-265412

# set the zone
gcloud config set compute/zone europe-west3-a

# log in
gcloud container clusters get-credentials multi-cluster

# create a secret
kubectl create secret generic pgpassword --from-literal PGPASSWORD=xxx

# download and install helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

# set up nginx ingress
  helm repo add stable https://kubernetes-charts.storage.googleapis.com/
  helm install my-nginx stable/nginx-ingress --set rbac.create=true