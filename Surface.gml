///Surface(width, height, [html5name])
{
switch (argument_count) {
  case 2:
    return surface_create(argument[0], argument[1]);
  case 3:
    return surface_create_ext(argument[2], argument[0], argument[1]);
  default:
    show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
}
}
