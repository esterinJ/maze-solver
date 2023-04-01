#### Model ####

# Function to read the maze 
readMap <- function(path) {
  # Read the content of the file
  content <- readLines(path)
  
  # Replace "s" with 1 and "e" with 2 in the map matrix and spaces with 5
  content <- gsub("s", "1", content, fixed=TRUE)
  content <- gsub("e", "2", content, fixed=TRUE)
  content <- gsub(" ", "5", content, fixed=TRUE)
  content <- gsub("x", "9", content, fixed=TRUE)
  
  # Split the lines into a list of numeric vectors
  map_list <- lapply(content, function(x) as.numeric(strsplit(x, "")[[1]]))
  
  # Bind the numeric vectors together into a single matrix
  maze <- do.call(rbind, map_list)
  
  return(maze)
}


# Function to solve the maze using depth-first search
findWay <- function(m) {
  # Find the start and end positions of the maze
  start <- which(m == 1, arr.ind = TRUE)
  end <- which(m == 2, arr.ind = TRUE)
  
  # Define a function to check if a position is within the boundaries of the maze
  # and not a wall
  isValidMove <- function(x, y) {
    x >= 1 && x <= nrow(m) && y >= 1 && y <= ncol(m) && m[x, y] != 9
  }
  
  # Define a function to perform the depth-first search
  dfs <- function(x, y, visited, path) {
    # Mark the current position as visited
    visited[x, y] <- TRUE
    
    # Add the current position to the path
    path <- c(path, list(c(x, y)))
    
    # If the current position is the end of the maze, return the path
    if (x == end[1] && y == end[2]) return(path)
    
    # Try moving to the next position in each of the four directions
    if (isValidMove(x+1, y) && !visited[x+1, y]) {
      result <- dfs(x+1, y, visited, path)
      if (!is.null(result)) return(result)
    }
    if (isValidMove(x, y+1) && !visited[x, y+1]) {
      result <- dfs(x, y+1, visited, path)
      if (!is.null(result)) return(result)
    }
    if (isValidMove(x-1, y) && !visited[x-1, y]) {
      result <- dfs(x-1, y, visited, path)
      if (!is.null(result)) return(result)
    }
    if (isValidMove(x, y-1) && !visited[x, y-1]) {
      result <- dfs(x, y-1, visited, path)
      if (!is.null(result)) return(result)
    }
    
    # If no path was found, return null
    return(NULL)
  }
  
  # Initialize a visited matrix to keep track of which positions have been visited
  visited <- matrix(FALSE, nrow(m), ncol(m))
  
  # Initialize the path with the start position
  path <- list(start)
  
  # Perform the depth-first search
  dfs(start[1], start[2], visited, path)
}


# Write a function to plot the maze solution
plotMap <- function(m, wall_scale = 1, wall_color = "black", symb_size = 0.08, start_color = "blue", end_color = "green",  ...) {
  # Set the plot dimensions
  plot.width <- ncol(m)
  plot.height <- nrow(m)
  
  # Set the cell dimensions
  cell.width <- 1
  cell.height <- 1
  
  # Set the plot margins
  par(mar = c(1, 0, 0, 0))
  
  # Create a new plot
  plot(x = c(0, plot.width), y = rev(c(0, plot.height)), type = "n", xlab = "", ylab = "", axes = F, ylim = rev(c(0, plot.height)))  
  
  # Loop over the map and plot each cell that has a valid value
  for (i in 1:plot.height) {
    for (j in 1:plot.width) {
      if (m[i, j] == 9) {
        rect(j - 0.5 * wall_scale, i - 0.5 * wall_scale, j + 0.5 * wall_scale, i + 0.5 * wall_scale, col = wall_color)     
      } else if (m[i, j] == 1) {
        symbols(j, i, circles = 1, add = T, inches = symb_size, bg = start_color,  fg = start_color)
      } else if (m[i, j] == 2) {
        symbols(j, i, squares = 1,add = T, inches = symb_size, bg = end_color, fg = end_color)
      } else if (m[i, j] == 5) {
        points(j, i, pch=10, col="white") 
      }
    }
  }
}



# Write a function to plot the maze solution
plotPath <- function(w, path_color = "red", path_size = 2,...) {
  # Plot the map
  plotMap(m, ...)
  
  # Convert the path coordinates to x and y vectors
  x <- sapply(w, function(p) p[2])
  y <- sapply(w, function(p) p[1])
  
  # Plot the path on top of the map
  lines(x, y, col = path_color, lwd = path_size)
}