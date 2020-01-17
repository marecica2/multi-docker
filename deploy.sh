docker build -t marecica2/multi-client:latest -t marecica2/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t marecica2/multi-server:latest -t marecica2/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t marecica2/multi-worker:latest -t marecica2/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push marecica2/multi-client
docker push marecica2/multi-client:$SHA

docker push marecica2/multi-server
docker push marecica2/multi-server:$SHA

docker push marecica2/multi-worker
docker push marecica2/multi-worker:$SHA

kubectl apply -f .k8s

kubectl set image deployments/server-deployment server=marecica2/multi-server:$SHA
kubectl set image deployments/client-deployment server=marecica2/multi-client:$SHA
kubectl set image deployments/worker-deployment server=marecica2/multi-worker:$SHA