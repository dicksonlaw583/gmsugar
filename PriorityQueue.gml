///PriorityQueue(...)
// Insert in same order, value-priority pairings
{
if (argument_count mod 2 != 0) {
  show_error("Expected an even number of arguments, got " + string(argument_count) + ".", true);
}
var pq = ds_priority_create();
for (var i = 0; i < argument_count; i += 2) {
  ds_priority_add(pq, argument[i], argument[i+1]);
}
return pq;
}

