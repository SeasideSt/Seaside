WAMutex provides mutual exclusion properties.

Only one process at a time can execute code within its #critical: method. Other processes attempting to call #critical: will block until the first process leaves the critical section. The process that owns the mutex (the one currently in the critical section), however, may call #critical: repeatedly without fear of blocking.

The process currently inside the critical section can be terminated by calling #terminateOwner. This will result in the process being unwound and the critical section being freed.