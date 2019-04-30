#!/bin/bash
start=$(date +%s)
kubectl scale deployment/yelb-ui --replicas=$1
sleep 3
unfinished=$(kubectl get pods | grep "ContainerCreating" | wc -l)
while [ $unfinished -ne 0 ]
do
        unfinished=$(kubectl get pods | grep "ContainerCreating" | wc -l)
	echo "Still Creating"
	sleep 1
done
end=$(date +%s)
echo "Consumed: $(( $end-$start )) seconds"
