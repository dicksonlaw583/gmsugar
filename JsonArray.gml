///JsonArray(array)
{
var tuple, list, sublist, isize, jsize, value;
list = ds_list_create();
tuple[1] = ds_type_list;
tuple[0] = list;
// 1D array: Convert straight
if (array_height_2d(argument0) == 1 || array_length_2d(argument0, 1) == 0) {
  isize = array_length_1d(argument0);
  for (var i = 0; i < isize; i++) {
    value = argument0[i];
    if (is_array(value)) {
      ds_list_add(list, JsonArray(value));
      ds_list_mark_as_list(list, i);
    } else {
      ds_list_add(list, value);
    }
  }
}
// 2D array: Implement as nested lists
else {
  isize = array_height_2d(argument0);
  for (var i = 0; i < isize; i++) {
    jsize = array_length_2d(argument0, i);
    sublist = ds_list_create();
    for (var j = 0; j < jsize; j++) {
      value = argument0[i, j];
      if (is_array(value)) {
        ds_list_add(sublist, JsonArray(value));
        ds_list_mark_as_list(sublist, j);
      } else {
        ds_list_add(sublist, value);
      }
    }
    ds_list_add(list, sublist);
    ds_list_mark_as_list(list, i);
  }
}
// Done
return tuple;
}

