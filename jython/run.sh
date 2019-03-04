#!/bin/bash
# edit the classpath to to the location of your ABAGAIL jar file
#
export CLASSPATH=../ABAGAIL.jar:$CLASSPATH

# winequality test
winequality() {
	echo "Running winequality test"
	jython winequality.py > results_wine.txt
	echo "Winequality done"
}

# four peaks
fourpeaks() {
	echo "Running four peaks test"
	jython fourpeaks.py > results_peaks.txt
	echo "Four peaks done"
}

# continuous peaks
continuouspeaks() {
	echo "Running continuous peaks test"
	jython continuouspeaks.py > results_cpeaks.txt
	echo "continuous peaks done"
}

# count ones
countones() {
	echo "Running count ones test"
	jython countones.py > results_countones.txt
	echo "count ones done"
}

# k color
kcolor() {
	echo "Running k color test"
	jython kcolor.py > results_kcolor.txt
	echo "k color done"
}

# n queens
nqueens() {
	echo "Running n queens test"
	jython nqueens.py > results_queens.txt
	echo "n queens done"
}

# knapsack
knapsack() {
	echo "Running knapsack test"
	jython knapsack.py > results_knapsack.txt
	echo "knapsack done"
}

# traveling salesman
travelingsalesman() {
	echo "Running traveling salesman test"
	jython travelingsalesman.py > results_salesman.txt
	echo "traveling salesman done"
}

echo "Preparing winequality dataset"
python3 prepare_dataset.py	

for i in {1..5}; do
	fourpeaks &
	continuouspeaks &
	countones &
	kcolor &
	nqueens &
	knapsack &
	travelingsalesman &
	winequality

	mkdir run{$i}
	mv results_* run{$i}
	mv run{$i} new_results
done