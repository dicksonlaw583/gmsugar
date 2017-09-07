///Queue(...)
// Insert in order
{
var queue = ds_queue_create();
for (var i = 0; i < argument_count; i++) {
  ds_queue_enqueue(queue, argument[i]);
}
return queue;
}

