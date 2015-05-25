A cache expiry policy determines when an item in the cache is considered expired. Expired items are periodically reaped an a schedule determined by the reaping strategy in place.

Subclasses should implement any of the notification methods that are interesting to them and should implement #isExpired:key: and return true or false as appropriate for any given object.