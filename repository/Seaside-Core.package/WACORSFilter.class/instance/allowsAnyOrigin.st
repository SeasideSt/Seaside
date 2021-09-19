testing
allowsAnyOrigin

	^ self allowedOrigins anySatisfy: [ :origin | origin = '*' ]

	