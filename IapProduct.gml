///IapProduct(id, title, description, price)
{
var product = ds_map_create();
product[? "id"] = argument0;
product[? "title"] = argument1;
product[? "description"] = argument2;
product[? "price"] = argument3;
if (os_type == os_uwp) {
  product[? "type"] = "Durable";
}
return product;
}
