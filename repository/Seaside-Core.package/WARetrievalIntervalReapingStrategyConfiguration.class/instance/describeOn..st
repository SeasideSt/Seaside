description
describeOn: config
	(config integer: #cacheReapInterval)
		comment: 'The number of cache retrievals or puts that are allowed before expired objects are reaped from the cache.';
		default: 10