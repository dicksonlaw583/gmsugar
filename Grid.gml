///Grid(width, height, ...)
// Column-major order (i.e. x-y coordinates)
{
if (argument_count < 2) {
  show_error("Expected at least 2 arguments, got " + string(argument_count) + ".", true);
}
if (argument_count != argument[0]*argument[1]+2) {
  show_error("Expected " + string(argument[0]) + " x " + string(argument[1]) + " = " + string(argument[0]*argument[1]+2) + " arguments, got " + string(argument_count) + ".", true);
}
var grid = ds_grid_create(argument[0], argument[1]),
    current = 2;
for (var j = 0; j < argument[1]; j++) {
  for (var i = 0; i < argument[0]; i++) {
    ds_grid_set(grid, i, j, argument[current++]);
  }
}
return grid;
}

