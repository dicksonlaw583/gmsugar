///Timeline(...)
{
if (argument_count mod 2 != 0) {
  show_error("Expected an even number of arguments, got " + string(argument_count) + ".", true);
}
var timeline = timeline_add();
for (var i = 0; i < argument_count; i += 2) {
  timeline_moment_add_script(timeline, argument[i], argument[i+1]);
}
return timeline;
}
