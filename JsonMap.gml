///JsonMap(...)
{
if (argument_count mod 2 != 0) {
  show_error("Expected an even number of arguments, got " + string(argument_count) + ".", true);
}
var tuple, map, key, value;
map = ds_map_create();
tuple[1] = ds_type_map;
tuple[0] = map;
for (var i = 0; i < argument_count; i += 2) {
  key = argument[i];
  value = argument[i+1];
  if (is_array(value)) {
    switch (value[1]) {
      case ds_type_map:
        ds_map_add_map(map, key, value[0]);
      break;
      case ds_type_list:
        ds_map_add_list(map, key, value[0]);
      break;
      default:
        show_error("Invalid value pair " + string(i >> 1) + " for JSON map constructor.", true);
      break;
    }
  } else {
    ds_map_add(map, key, value);
  }
}
return tuple;
}

