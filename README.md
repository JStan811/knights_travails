# knights_travails

This is the Knights Travails project as part of the [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails).

Thoughts:
This project was pretty complex. I ended up creating a data structure I hadn't created before (I'm not even sure what type of structure it is. Some kind of graph I imagine). The structure has a root node with an array of children nodes, each with their own array of children. The idea is you instantiate the structure with a root cell (ie a starting board position), then the structure is built by calculating the shortest paths to all of the other positions on the board (I used a standard chess board of 8x8, giving 64 total positions). A "path" in this context is a series of valid moves a Knight piece can take. With this structure, by starting at the root cell, you can traverse to any other cell in the structure and the path the search takes will always be a shortest possible path a knight could take to get from the starting position to the target position.

I likely could have made this faster by performing both the structure build and the search in the same step since the goal of the project is only to build a program that finds the shortest possible path from one cell to another. However, my program allows you to change the target path as many times as you like within the same run without having to rebuild the structure (as long as you don't change the starting cell). The code could also benefit from some refactoring. Some of the methods are longer than I'd like and the naming could be improved for clarity. In the end, I'm happy with how this came out.

Jake
