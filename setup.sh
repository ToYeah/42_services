minikube delete

minikube start

eval $(minikube docker-env)

docker build -t ft_nginx ./srcs/nginx/

kubectl apply -f ./srcs/nginx/ft_nginx.yaml