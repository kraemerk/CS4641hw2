import os
import csv
import numpy as np
import pandas as pd

INPUT_FILE_RAW = os.path.join("..", "data", "winequality.csv")
OUTPUT_FILE_PATH = os.path.join("..", "data", "winequality_PROCESSED.csv")

def loadFile(path, headers):
	return pd.read_csv(path, header=None, names=headers, na_values="?")

def main():
	columns = ['FixedAcidiy', 'VolatileAcidity', 'CitricAcid', 'ResidualSugar', 'Chlorides', 'FreeSulfurDioxide', 'TotalSulfurDioxide', 'Density', 'pH', 'Sulphates', 'Alcohol', 'Quality']
	cc = loadFile(INPUT_FILE_RAW, columns)

	count_class_0, count_class_1 = cc.Quality.value_counts()

	# Divide by class
	df_class_0 = cc[cc.Quality == 0]
	df_class_1 = cc[cc.Quality == 1]

	df_class_1_over = df_class_1.sample(count_class_0, replace=True)
	df_test_over = pd.concat([df_class_0, df_class_1_over], axis=0)

	Y = df_test_over.Quality
	X = df_test_over.drop(['Quality'], axis=1)

	# X = (X - X.min()) / (X.max() - X.min())
	testing = (df_test_over - df_test_over.min()) / (df_test_over.max() - df_test_over.min())

	processed = pd.concat([X, Y], axis=1)

	testing.to_csv(OUTPUT_FILE_PATH, header=False, index=False)

if __name__ == "__main__":
    main()
