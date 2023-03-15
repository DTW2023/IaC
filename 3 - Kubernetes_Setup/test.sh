#!/bin/sh
# run ansible ping to verify all nodes are running
ansible -m ping -i inventory all
if [ $? -ne 0 ] ; then
	echo Nodes not all up yet......!
fi

