description
describeOn: config
	(config integer: #cacheTimeout)
		comment: 'The maximum lifetime of a cached object in seconds';
		default: 600