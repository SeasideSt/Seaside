A cache miss strategy determines what should be done when an attempt is made to retrieve an object with a key that is not found in the cache.

Subclasses should implement #missed: and should either return nil or if the object can be found outside the cache somewhere, the object.