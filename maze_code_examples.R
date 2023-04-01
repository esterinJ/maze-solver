# Load the functions 
source("maze_solver.R")

#### Execution ####


# Read the maze (x,wall_scale, wall_color, symb_size, start_color, end_color , ...)
m <- readMap("./maze_1.map")

# Find the maze's solution
w <- findWay(m)

# Plotting the Maze
plotMap(m, wall_scale = 1)

# Over-plotting the path (x, path_color, path_size, ...)
plotPath(w, path_color = "violet", 2)
