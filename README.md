# GMSugar

Constructor utility scripts for GameMaker Studio

## Introduction

GMSugar provides an alternative syntactic sugar to replace GML's repetitive pattern of initializing data structures and other dynamically allocated types. With constructors instead of line-by-line setting calls, you can quickly build your data in a visually intuitive new way.

## Requirements

- GameMaker Studio 1.4 or above

## Installation

Simply drag the ```.gml``` file for the data structure or dynamic resource type that you are working with into your open project.

## Contributing to GMSugar

- Clone both ```gmsugar``` and ```gmsugar-workbench```.
- Open the workbench in GameMaker Studio and make your additions/changes to the ```GMSugar``` script group. If possible, also add corresponding tests to the ```GMSugarTest``` script group.
- Use F5 to run the test suite. A successful run should exit on its own without any errors or popups.
- Export your additions in the ```GMSugar``` group to ```gmsugar```, one type at a time.
- Open a pull request on both ```gmsugar``` and ```gmsugar-workbench```.

## Examples

### With GMSugar

Maps:

```
map = Map(
  "Alice", 583,
  "Bob", 907,
  "Caitlyn", 371
);
```

Buffers:

```
msg = Buffer(
  buffer_u8, 2,
  buffer_f32, x,
  buffer_f32, y,
  buffer_string, player_name
);
```

2D Arrays:

```
//Row-major interpretation
array = Array2(2, 3,
  "foo", "bar", "baz",
  583, 907, 371
);
```

```
// Column-major interpretation
array = Lattice(2, 3,
  "foo", 583,
  "bar", 907,
  "baz", 371
);
```

### Without GMSugar

Maps:

```
map = ds_map_create();
ds_map_add(map, "Alice", 583);
ds_map_add(map, "Bob", 907);
ds_map_add(map, "Caitlyn", 371);
```


Buffers:

```
msg = buffer_create(buffer_grow, 1024, 1);
buffer_write(msg, buffer_u8, 2);
buffer_write(msg, buffer_f32, x);
buffer_write(msg, buffer_f32, y);
buffer_write(msg, buffer_string, player_name);
```

2D Arrays:

```
array[0, 0] = "foo";
array[0, 1] = "bar";
array[0, 2] = "baz";
array[1, 0] = 583;
array[1, 1] = 907;
array[1, 2] = 371;
```
