<!-- Introduction -->
# du-logger
A Lua library designed to monitor and log running parameters more easily. In particular to follow the calculation times of your scripts. This library has been done to be used in specific projects, but can be used or modified in other projects.

<!--List of methods and explanation -->
# Documentation
## Logger class
#### CreateLog(*string* name, *string* type)
Create and register a Log object.
| Type      | Use |
| --------- | -----:|
| number  | Used to monitor a precise number value. |
| time    | Used to monitor computation time |
| mean    | Used to monitor a mean value along the script running |

#### getLogs()
Returns an array of logs entry as string. See a example on the [How to use](#how-to-use) part.

## Log class
#### Log(*string* name, *string* type)
Create a Log object *(not registered in the logger)*.

#### Update(*number* v)
Update the last value stored.

#### getString()
Returns a string containing the monitored value or mean of the array of values.

#### getValue()
Returns the monitored value or mean of the array of values.

#### addValue(v)
Add the value to the values array. *Does nothing of the 'number' log type*.

#### getMean()
Returns the mean of the array of values. *Does nothing of the 'number' log type*.



<!-- How to use -->
# How to use
To use this library in Dual Universe, you can simply copy the lua code and paste it into a Library slot (the two classes `log.lua` and `logger.lua` have been written here in two different files just for readability). It can be used to monitor the computation time of a part of your script like this example below:
```lua
Logs = Logger()
local _logUpdate = Logs.CreateLog("Update", "time")
local _logFixed = Logs.CreateLog("Fixed", "time")

```
