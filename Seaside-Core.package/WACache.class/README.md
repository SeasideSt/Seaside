A WACache represents a collection of arbitrary objects referenced by a key (an instance of String).

Methods are provided to add and retrieve and remove objects from the cache. The behaviour of the cache is configurable through four different plugins:

+ expiry policy: determines when objects are considered expired
+ cache miss strategy: determines what do to if a requested object is not found in the cache
+ cache reap action: determines what to do when an expired object is eventually reaped from the cache
+ cache reaping strategy: determines when expired objects should be reaped from the cache

Access to the two dictionaries which store the objects and keys is protected by a mutex. Calls to the plugins are currently not protected by the mutex, but possibly should be to simplify implementation of the plugins.