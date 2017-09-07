///JsonData(source)
{
var jsonstr, jsondata;
// JsonData("filename"): Load JSON data from file
if (is_string(argument0)) {
  var f = file_text_open_read(argument0),
      jsonstr = "";
  while (!file_text_eof(f)) {
    jsonstr += file_text_read_string(f);
    file_text_readln(f);
  }
  file_text_close(f);
  return json_decode(jsonstr);
}
// JsonData(constructor): Return the data part of the given constructor helper
else if (is_array(argument0)) {
  return argument0[@ 0];
}
// Unrecognized
else {
  show_error("Invalid source type.", true);
}
}

