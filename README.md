# Developing Data Products

Resume: this is a project to create a simple App with the following characteristics:

1. The application generates a sample of random numbers based on a normal distribution. The sample size can vary between 3 and 30 points in two-dimensional space and the user can make this change freely.

To generate the random numbers, the user can also choose from 4 different seeds: seed = 1, 42, 77 and 121.

Each time the random numbers are generated, the application suggests the best solution based on a simple linear regression model.

The application automatically plots the graph of points generated, the linear regression model, some statistics generated points and the residue (error) in this model.

In parallel, the application generates an arbitrary line. This is a line that can be modified by the user through the call control X.

Each time the user generates a new arbitrary straight, the application calculates the residue inherent in this line. Thus, the user can compare in real time the waste inherent in the linear regression model and the residue calculated for each arbitrary line. The objective of this task is to verify that the solution provided by the linear regression model it is an optimum solution, i.e., a straight line (between one family of endless lines) where the waste is minimal. No other line provides best result.

The application still possesses some auxiliary controls. (1) it allows you to turn the user decide whether or not to display the chart legend. (2) it lets the user decide whether to see the vertical line segments that indicate the distance between the sampling points and a straight solution of linear regression model or arbitrary straight.
