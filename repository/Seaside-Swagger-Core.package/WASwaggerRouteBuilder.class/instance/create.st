private
create
	^ WASwaggerRouteWrapper new
		route: super create;
		path: path;
		tags: tags;
		responses: responses;
		yourself