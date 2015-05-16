# Simple Linear Regression with Random Numbers

### Resume
This is a Project to create a simple App to help understand the inherent residual in the Linear Regression Models.

### Where can you find this application?
This App is posted in *shinyapps.io* Website: https://jefa.shinyapps.io/RegressionModel/

### Where can you read a little more about this application?
I published a short Presentation about it in RPUBS. This is a R-Studio Presentation about my Application. The link to RPub is:.

### Details about the Application

1. The application generates a sample of random numbers based on a normal distribution. The sample size can vary between 3 and 30 points in two-dimensional space and the user can make this change freely.

2. To generate the random numbers, the user can also choose from 4 different seeds: *seed = 1, 42, 77 and 121*.

3. Each time the random numbers are generated, the application suggests the best solution based on a simple linear regression model.

4. The application automatically plots the graph of points generated, the linear regression model, some statistics generated points and the residue (error) in this model.

5. In parallel, the application generates an arbitrary line. This is a line that can be modified by the user through the call control X.

6. Each time the user generates a new arbitrary straight, the application calculates the residue inherent in this line. Thus, the user can compare in real time the waste inherent in the linear regression model and the residue calculated for each arbitrary line. The objective of this task is to verify that the solution provided by the linear regression model it is an optimum solution, i.e., a straight line (between one family of endless lines) where the waste is minimal. No other line provides best result.

7. The application still possesses some auxiliary controls. (1) it allows you to turn the user decide whether or not to display the chart legend. (2) it lets the user decide whether to see the vertical line segments that indicate the distance between the sampling points and a straight solution of linear regression model or arbitrary straight.
