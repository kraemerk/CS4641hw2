# HW2 Setup Instructions

### Konrad Kraemer (kkraemer6)

## Data Sources

1) Wine: https://archive.ics.uci.edu/ml/datasets/wine+quality
The `winequality-white.csv` file is the only file necessary for this analysis

## Wine dataset modifications
1) Save the dataset as `winequality.csv` in the `data` directory, relative to the program.
2) Using a text editor, replace the ";" with "," to fix the formatting
3) Open the file in Excel or your favorite text editor.
4) Delete the first row since we will not be using the CSV headers
5) Using Excel, create a new column at the end (`Column M`), and use this formula to populate these cells: `=IF(L1>5,1,0)`. Apply this formula to all cells in the column
6) Once done, select the entire column, and then paste-as-values into `column L`. (Right-click, "Paste Special", Paste --> "values")
7) Now delete `column M` since it's no longer needed

## Running this script

__Note__: These scripts will be executed using Jython.

1) Ensure the following dependencies are installed:
Java
ant
jython

2) Compile the Java source code for ABAGAIL, and place the resulting JAR in this directory.
3) Install the following python dependencies with pip3:
pandas
numpy

4) change into the jython directory.
5) Execute the "run.sh" script using `./run.sh`. This will automatically prepare the wine dataset, execute RHC, SA, and GA algorithms, as well as write the results to the files.