#!/bin/bash

work() {
        local QPS=$1
	echo "-------------------------------------------------------------------------"
        echo "Actual QPS: $QPS"
	./mutilate/mutilate --cpu-core=0 --threads=2 --depth=4 --connections=16 --binary --keysize=19 --valuesize=2 --update=0.002 --records=1000000 --time=10 --report-stats=5 --server=10.0.0.2:11211 --my-mac=b4:96:91:26:83:88 --server-mac=b4:96:91:26:83:8a --my-ip=10.0.0.1 --loadonly --qps=$QPS
	./mutilate/mutilate --cpu-core=0 --threads=2 --depth=4 --connections=16 --binary --keysize=19 --valuesize=2 --update=0.002 --records=1000000 --time=10 --report-stats=5 --server=10.0.0.2:11211 --my-mac=b4:96:91:26:83:88 --server-mac=b4:96:91:26:83:8a --my-ip=10.0.0.1 --noload --qps=$QPS
        echo "Sleeping..."
	sleep 7
}

LOADS=(0.10 0.56 0.48 0.50 0.37 0.10 1.00 0.80 0.65 0.63 0.76 0.36 0.10 0.37 0.41 0.39 0.36 0.44 0.32 0.10 0.49 0.65 0.64 0.65 0.62 0.32 0.10 0.44 0.44 0.40 0.46 0.55 0.42 0.10 0.89 0.77 0.74 0.64 0.65 0.35 0.10 0.45 0.47 0.42 0.48 0.42 0.33 0.10 0.88 0.65 0.64 0.61 0.65 0.30 0.10 0.41 0.42 0.42 0.50 0.54 0.41 0.10 0.90 0.81 0.71 0.69 0.67 0.31 0.10 0.41 0.45 0.44 0.41 0.57 0.35 0.10 0.91 0.79 0.69 0.67 0.68 0.34 0.10 0.83 0.82 0.74 0.81 0.10 0.51 0.10 0.10 0.48 0.47 0.54 0.51 0.38 0.10 0.80 0.77 0.69)

for l in ${LOADS[@]}; do
	work $(echo "250000.0*$l/1" | bc)
done

