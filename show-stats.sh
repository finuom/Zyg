#!/bin/bash

while true
do
	./ixcp.py --show-metrics
	./ixcp.py --print-queues
	./ixcp.py --print-power
	sleep 1
done
