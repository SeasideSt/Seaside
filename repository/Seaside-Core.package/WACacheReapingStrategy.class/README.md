A cache reaping strategy determines when expired items should be removed from a cache.

Subclasses should implement any of the event notification methods they require and should call "self reap" whenever they determine that expired items should be removed from the cache.