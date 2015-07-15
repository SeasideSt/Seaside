converting-request
requestVersionFor: aNativeRequest

	^ WAHttpVersion fromString: (aNativeRequest params at: 'SERVER_PROTOCOL')