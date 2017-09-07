///IapList(...)
{
var iaplist = ds_list_create();
for (var i = 0; i < argument_count; i++) {
  ds_list_add(iaplist, argument[i]);
  ds_list_mark_as_map(iaplist, i);
}
return iaplist;
}
