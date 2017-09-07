///Lattice(xsize, ysize, ...)
// Column-major interpretation of 2D array contents
{
if (argument_count < 2) {
  show_error("Expected at least 2 arguments, got " + string(argument_count) + ".", true);
}
if (argument_count != argument[0]*argument[1]+2) {
  show_error("Expected " + string(argument[0]) + " x " + string(argument[1]) + " = " + string(argument[0]*argument[1]+2) + " arguments, got " + string(argument_count) + ".", true);
}
var lattice, current;
current = argument_count;
for (var j = argument[1]-1; j >= 0; j--) {
  for (var i = argument[0]-1; i >= 0; i--) {
    lattice[i, j] = argument[--current];
  }
}
return lattice;
}

