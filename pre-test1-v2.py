#!/usr/bin/env python

import os
import csv

def main():
	with open(os.path.expanduser('~') + '/mf-dir/sh-dir/s-log.csv', 'w+') as f:
		writer = csv.writer(f)
		writer.writerow(["Datetime", "CPU", "Qu. Size", "Qu. Delay (us)", "Batch Size"])
		f.close()

if __name__ == '__main__':
	main()

