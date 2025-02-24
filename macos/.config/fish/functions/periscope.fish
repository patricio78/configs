function periscope

set CMD_OPTION $argv[1]
set FALCON_K8_CONTEXT $argv[2]
set PSEUDO_API_SERVER $argv[3]


if [ "$CMD_OPTION" = "setup" ]

kubectl config set-credentials periscope-user --token=periscope-token
kubectl config set-cluster $FALCON_K8_CONTEXT --server=$PSEUDO_API_SERVER/$FALCON_K8_CONTEXT
kubectl config set-context $FALCON_K8_CONTEXT --cluster=$FALCON_K8_CONTEXT --user=periscope-user
kubectl config use-context $FALCON_K8_CONTEXT

else if [ "$CMD_OPTION" = "remove" ]

kubectl config delete-cluster $FALCON_K8_CONTEXT
kubectl config delete-context $FALCON_K8_CONTEXT
end

end
