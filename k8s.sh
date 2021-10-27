#!/bin/bash

#关闭防火墙
ufw disable

#关闭swap
sed -ri 's/.*swap.*/#&/' /etc/fstab

cat > /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

systemctl start docker

cat > /etc/docker/daemon.json << EOF
{
  "registry-mirrors": ["https://b9pmyelo.mirror.aliyuncs.com"],
  "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF
systemctl restart docker

apt-get update && apt-get install -y apt-transport-https

curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

apt-get update
apt-get install -y kubelet kubeadm kubectl

systemctl daemon-reload
systemctl restart kubelet

kubeadm init --kubernetes-version=v1.22.0 \
--pod-network-cidr=10.244.0.0/16 \
--image-repository registry.aliyuncs.com/google_containers

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
#网络插件
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

#export KUBECONFIG=/etc/kubernetes/admin.conf
#export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/root/istio-1.11.4/bin:/root/istio-1.11.4/bin

#istioctl install --set profile=default -y

#cat <<EOF | kubectl apply -f -
#apiVersion: install.istio.io/v1alpha1
#kind: IstioOperator
#metadata:
#  namespace: istio-system
#  name: istio-control-plane
#spec:
#  components:
#    egressGateways:
#      - enabled: true
#        name: istio-egressgateway
#  hub: harbor1.zlibs.com/istio
#  meshConfig:
#    accessLogFile: /dev/stdout
#    outboundTrafficPolicy:
#      #      mode: ALLOW_ANY
#      mode: REGISTRY_ONLY
#  profile: default
#  tag: 1.9.2
#EOF

#kubectl create -n istio-system secret tls istio-ingressgateway-certs --key ssl/key.pem --cert ssl/cert.pem

#kubectl taint nodes k8s-master node-role.kubernetes.io/master=:NoSchedule
kubectl taint nodes k8s-master node-role.kubernetes.io/master-


