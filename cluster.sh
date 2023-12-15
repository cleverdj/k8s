export KOPS_STATE_STORE="s3://clusters.domain.com"
export CLUSTER_NAME="domain.com"
ssh-keygen -t rsa -f ../ssh_key/k8s.key -N ''
export PUBKEY="../ssh_key/k8s.key.pub"
export NODE_SIZE="t2.medium"
export MASTER_SIZE="t2.medium"



kops create cluster \
--cloud aws \
--name  $CLUSTER_NAME \
--state $KOPS_STATE_STORE \
--topology private \
--zones ap-northeast-2a,ap-northeast-2c \
--master-zones ap-northeast-2a \
--networking calico \
--bastion \
--ssh-public-key $PUBKEY \
--node-count=2 \
--node-size=$NODE_SIZE \
--master-size=$MASTER_SIZE \
--master-count=1
