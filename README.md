# maze-solver
The function reads and processes a maze text file, finds a path using depth-first search, and plots the solution.

## Dependencies
This program requires the R programming language to be installed on your computer. No additional packages or libraries are required.

## Installation and usage
1. Download the "maze_solver.R" file to your computer.
2.Set the working directory to the location of the file.
3. In R console, run the command source("maze_solver.R") to load the code.
4. To solve a maze, use the findWay() function with a maze matrix as an input. The maze matrix should contain 1's for the starting position, 2's for the ending position, 9's for walls, and 5's for empty spaces. The readMap() function can be used to read a maze from a text file and convert it into a matrix.
5. After the maze has been solved, use the plotMap() function to visualize the solution.

## Functions
`readMap()`
This function reads a maze from a text file and converts it into a matrix. The text file should contain 1's for the starting position, 2's for the ending position, 9's for walls, and 5's for empty spaces. The function returns a matrix of numeric values representing the maze.

`findWay()`
This function takes a maze matrix as an input and returns the solution path using depth-first search algorithm.

`plotMap()`
This function takes a maze matrix and optional parameters as input, and plots the maze solution. The function supports customization of wall scale, wall color, symbol size, start color, and end color.

`plotPath()`
It takes a file path as input and optional parameters for customization of wall scale, wall color, symbol size, start color, and end color. The function returns a plot of the maze solution with the path highlighted.

It also includes a Maze_template folder that contains maze_0.map (small maze) and maze_1.map (big maze) as examples for the maze_solver.

Additionally, there is a maze_code_examples folder that contains examples of code execution for the Maze_template files.

Feel free to use and modify the code to fit your specific use case.

## Examples
How the maze would be plotted: 

![maze_plot](https://user-images.githubusercontent.com/99491936/229309011-5c7e8479-bba4-417e-9910-77c98eb0cf8b.png)

How the solution will look like: 

![maze_solution](https://user-images.githubusercontent.com/99491936/229309101-e2081df4-b0fc-4f1b-a3b9-fac1ee09aea2.png)







