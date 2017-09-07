///TcpServer([port, [maxclients, [raw]]])
{
var raw = false,
    max_clients = 100,
    port = $7000 | (game_id & $0FFF);
switch (argument_count) {
  case 3:
    raw = argument[2];
  case 2:
    max_clients = argument[1];
  case 1:
    port = argument[0];
  break;
  case 0:
    show_debug_message("TCP server listening to port " + string(port));
  break;
  default:
    show_error("Expected 3 arguments or fewer, got " + string(argument_count) + ".", true);
  break;
}
if (raw) {
  return network_create_server_raw(network_socket_tcp, port, max_clients);
}
return network_create_server(network_socket_tcp, port, max_clients);
}
