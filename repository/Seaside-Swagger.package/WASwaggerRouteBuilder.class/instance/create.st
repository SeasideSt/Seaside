private
create
	|route|
	route := super create.
	^ WASwaggerRouteWrapper new
		route: route;
		path: path;
		tags: tags;
		responses: responses;
		yourself