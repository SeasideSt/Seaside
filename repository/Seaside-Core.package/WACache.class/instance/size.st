public
size
	"Retun the number of objects currently in the cache. This number includes objects that
	are expired but have not yet been removed in a cache reap."

	^ mutex critical: [ objectsByKey size ]
