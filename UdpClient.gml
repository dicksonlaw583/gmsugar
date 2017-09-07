///UdpClient([port])
{
var port = undefined;
switch (argument_count) {
  case 1:
    port = argument[0];
  break;
  case 0:
  break;
  default:
    show_error("Expected 0 or 1 arguments, got " + string(argument_count) + ".", true);
  break;
}
if (is_undefined(port)) {
  return network_create_socket(network_socket_udp);
}
return network_create_socket_ext(network_socket_udp, port);
}
