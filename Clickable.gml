///Clickable(x, y, sprite, url_or_callback, [...])
{
if (argument_count < 4) {
  show_error("Expected at least 4 arguments, got " + string(argument_count) + ".", true);
}
if ((argument_count-4) mod 2 != 0) {
  show_error("Unmatched option parameters.", true);
}
var target = "_self",
    sprite_frame = 0,
    has_css = false,
    css_map = -1,
    params = "",
    param_name = "",
    param_arg = "";
for (var i = 4; i < argument_count; i += 2) {
  param_name = argument[i];
  param_arg = argument[i+1];
  switch (param_name) {
    case "frame": sprite_frame = param_arg; break;
    case "target": target = param_arg; break;
    default:
      if (string_copy(param_name, 1, 4) == "css-") {
        if (!has_css) {
          has_css = true;
          css_map = ds_map_create();
        }
        css_map[? string_delete(param_name, 1, 4)] = param_arg;
      } else {
        if (i > 4) {
          params += ", ";
        }
        params += param_name + "=" + string(param_arg);
      }
    break;
  }
}
var clickable = clickable_add(argument[0], argument[1], sprite_get_tpe(argument[2], 0), argument[3], target, params);
if (has_css) {
  clickable_set_style(clickable, css_map);
  ds_map_destroy(css_map);
}
return clickable;
}
