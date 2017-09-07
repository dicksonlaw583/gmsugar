///FixedBuffer(...)
{
// Load from file if specified
if (is_string(argument[0]) && string_length(argument[0]) > 1) {
  var length = -1,
      offset = 0,
      lb = undefined,
      filesize = -1;
  // Capture arguments
  switch (argument_count) {
    // FixedBuffer("filename", length, offset)
    case 3:
      offset = argument[2];
    // FixedBuffer("filename", length)
    case 2:
      length = argument[1]
    // FixedBuffer("filename")
    case 1:
    break;
    // Invalid number of arguments for file syntax
    default:
      show_error("Expected 1 to 3 arguments for file-loading syntax, got " + string(argument_count) + ".", true);
    break;
  }
  // Start reading
  if (!file_exists(argument[0])) {
    show_error("File does not exist: " + argument[0], true);
  }
  var f = file_bin_open(argument[0], 0),
      fsize = file_bin_size(f);
  if (offset < 0) {
    offset += fsize;
    if (offset < 0) {
      show_error("Cannot seek " + string(offset) + " bytes left from end of file, only has " + string(fsize) + " bytes.", true);
    }
  }
  if (length < 0) {
    length = fsize-offset;
  }
  lb = buffer_create(length, buffer_fixed, 1);
  file_bin_seek(f, offset);
  repeat (length) {
    buffer_write(lb, buffer_u8, file_bin_read_byte(f));
  }
  file_bin_close(f);
  buffer_seek(lb, buffer_seek_start, 0);
  return lb;
}
// Otherwise, do regular byte-by-byte
// FixedBuffer(byte0, byte1, ...)
var fixed_buffer = buffer_create(argument_count, buffer_fixed, 1);
for (var i = 0; i < argument_count; i++) {
  var byte = argument[i];
  if (is_real(byte)) {
    buffer_write(fixed_buffer, buffer_u8, byte & $FF);
  } else if (is_string(byte)) {
    buffer_write(fixed_buffer, buffer_u8, ord(byte) & $FF);
  } else if (is_undefined(byte)) {
    buffer_write(fixed_buffer, buffer_u8, 0);
  } else {
    show_error("Invalid value given for byte " + string(i) + ".", true);
  }
}
buffer_seek(fixed_buffer, buffer_seek_start, 0);
return fixed_buffer;
}
