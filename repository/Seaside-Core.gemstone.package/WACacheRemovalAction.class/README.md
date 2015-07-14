A cache reap action determines what, if anything, should happen when an object is reaped from the cache.

Subclasses should implement #reaped:key:. When this method is called, the object will already have been removed from the cache itself but the subclass should perform any any additional actions that need to be taken.