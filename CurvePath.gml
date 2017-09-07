///CurvePath(...)
{
if (argument_count mod 2 != 0) {
  show_error("Expected an even number of arguments, got " + string(argument_count) + ".", true);
}
var path = path_add(),
    default_speed = 100,
    override_speed = undefined,
    closed = false,
    precision = 4,
    override_absolute = false,
    k, v, times;
path_set_kind(closed, 1);
for (var i = 0; i < argument_count; i += 2) {
  k = argument[i];
  v = argument[i+1];
  // Various options
  if (is_string(k)) {
    switch (k) {
      case "absolute_point":
        override_absolute = v;
      break;
      case "speed":
        default_speed = v;
      break;
      case "speed_point":
        override_speed = v;
      break;
      case "closed":
        closed = v;
      break;
      case "precision":
        precision = v;
      break;
      default:
        show_error("Invalid option name " + k + " for path constructor.", true);
      break;
    }
  }
  // Standard coordinate point
  else if (is_real(k)) {
    if (override_absolute) {
      times = 3;
    } else {
      times = 1;
    }
    repeat (times) {
      if (is_undefined(override_speed)) {
        path_add_point(path, k, v, default_speed);
      } else {
        path_add_point(path, k, v, override_speed);
      }
    }
    override_speed = undefined;
    override_absolute = false;
  }
  // Invalid value
  else {
    show_error("Invalid input in argument pair " + string(i >> 1) + " for path constructor.", true);
  }
}
path_set_closed(path, closed);
return path;
}
