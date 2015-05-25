processing
redirectWithTrailingSlash: aRequestContext 
	aRequestContext responseGenerator
		redirectTo: (aRequestContext request url copy
			takeServerParametersFromRequest: aRequestContext request;
			slash: true;
			yourself);
		respond