Oversees the calling of a particular function periodically.

PeriodicalExecuter shields you from multiple parallel executions of a callback function, should it take longer than the given interval to execute.

This is especially useful if you use one to interact with the user at given intervals (e.g. use a prompt or confirm call): this will avoid multiple message boxes all waiting to be actioned.