<!-- Introduction -->
# du-logger
A Lua library designed to monitor and log running parameters more easily. In particular to follow the calculation times of your scripts.

<!--List of methods and explanation -->
# Documentation
#### serialize(*table* t, *bool* es)
Serialize a table **t** and return a string.
Use the **es** parameter to remove escape characters, useful for transmissions (increase the character count).
*Tables and arrays are supported, not mixed table.*

#### deserialize(*string* s)
Deserialize a serialized table as string **s** and return the table.


<!--Warnings concerning use -->
# Benchmark
Following graphs are the results of the benchmark, encoding and decoding a simple test table in [`bench.lua`](bench/bench.lua) multiple times.
Dkjson is a popular JSON encoding/decoding library in Lua, which is embedded by default in Dual Universe.
Pure Lua Json, is a compact pure-Lua alternative library for JSON encoding/decoding, can be found at [json.lua 0.1.2](https://github.com/rxi/json.lua), created by Rxi.

This benchmark has been done in Dual Universe, on a clean programming board.
*The missing data for the dkjson and pure lua json is due to the fact it trigger the CPU OVERLOAD error in the game.*

<img src="https://github.com/EliasVilld/du-serializer/blob/main/bench/encode.PNG" width="600">
<img src="https://github.com/EliasVilld/du-serializer/blob/main/bench/decode.PNG" width="600">
<img src="https://github.com/EliasVilld/du-serializer/blob/main/bench/data_size.PNG" width="600">


<!-- How to use -->
# How to use
To use this library in Dual Universe, you can simply copy the lua code and paste it in a Library slot. It can be used to compute transmissions for the [`du-socket`](https://github.com/EliasVilld/du-socket) library. See below an example :
```lua
local player = {
  id = 999,
  name = "Username",
  pos = { 1, 2, 3},
  org = "Org name",
  relation = 0
}

local s = serialize(player) -->  {relation=0,org="Org name",pos={1,2,3},id=999,name="Username"}
local t = deserialize(s)
print(t.name) --> Username

local s = serialize(player,true) -->  {id=999,org=&dq;Org name&dq;,name=&dq;Username&dq;,relation=0,pos={1,2,3}}
local t = deserialize(s)
print(t.name) --> Username
```
Keep in mind that, for Lua arrays have no order. 

<!-- Explain how to use -->
# Credits
Thanks to Arialia for her collaboration from the game organization Silentium
