# Simple Linear Regression with Random Numbers

### Resume
This is a Project to create a simple App to help understand the inherent residual in the Linear Regression Models.

### Where can you find this application?
This App is posted in *shinyapps.io* Website: https://jefa.shinyapps.io/RegressionModel/

### Where can you read a little more about this application?
I published a short Presentation about it in RPUBS. This is a R-Studio Presentation about my Application. The link to RPub is:.

### Details about the Application

1. The application generates a sample of random numbers based on a normal distribution. The sample size can vary between 3 and 30 points in two-dimensional space and the user can make this change freely.

2. To generate the random numbers, the user can also choose from 4 different seeds: **seed = 1, 42, 77** and **121**.

3. Each time that the random numbers are generated, the application suggests the best solution based on a simple **Linear Regression Model**.

4. The application automatically plots the graphics of points generated, the **Linear Regression Model** solution, some statistics from the generated points and the residual (error) in the solution.

5. In parallel, the application generates an **Arbitrary Line**. This is a straight line that can be modified by the user through the call of the control **Arbitrary Straight Line Generator**.

6. Each time that the user generates a new arbitrary straight, the application calculates the residual inherent in this arbitrary line. Thus, the user can compare (in real time) the residual inherent in the Linear Regression Model and the residual calculated for each new arbitrary line. So the fundamental objective of this application is to verify that the solution provided by the Linear Regression Model is an optimum solution, i.e., a straight line (between one family of endless lines) where the residual is minimized (it is a minimum). No other line provides best result than it.

7. The application allows the user to enter **x-values** to predict **y-values**; 

8. The application still possesses some auxiliary controls. **(1)** it allows the user to decide whether or not to display the chart legend. **(2)** it lets the user decide whether he wants (or not) to see the visual representation of the residuals. That means: the vertical line segments that indicate the distance between the sampling points and a straight solution of linear regression model or the arbitrary straight.
