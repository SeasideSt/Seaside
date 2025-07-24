helpers
respondNotFound
	
	self requestContext responseGenerator
		notFound;
		respond