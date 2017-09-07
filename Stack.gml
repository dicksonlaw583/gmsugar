///Stack(...)
// Top element placed first (i.e. insert in reverse order)
{
var stack = ds_stack_create();
for (var i = argument_count-1; i >= 0; i--) {
  ds_stack_push(stack, argument[i]);
}
return stack;
}

