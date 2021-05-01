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



<!-- How to use -->
# How to use
To use this library in Dual Universe, you can simply copy the lua code and paste it into a Library slot (the two classes `log.lua` and `logger.lua` have been written here in two different files just for readability). It can be used to monitor the computation time of a part of your script like this example below:
```lua

```
