///JsonList(...)
{
var tuple, list, value;
list = ds_list_create();
tuple[1] = ds_type_list;
tuple[0] = list;
for (var i = 0; i < argument_count; i++) {
  value = argument[i];
  if (is_array(value)) {
    switch (value[1]) {
      case ds_type_map:
        ds_list_add(list, value);
        ds_list_mark_as_map(list, i);
      break;
      case ds_type_list:
        ds_list_add(list, value);
        ds_list_mark_as_list(list, i);
      break;
      default:
        show_error("Invalid value " + string(i) + " for JSON list constructor.", true);
      break;
    }
  } else {
    ds_list_add(list, value);
  }
}
return tuple;
}

