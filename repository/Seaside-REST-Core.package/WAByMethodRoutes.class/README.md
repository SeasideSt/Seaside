A WAByMethodRoutes is a collection of routes first organized by HTTP method and then by number of URL path elements. It allows users to look up possible routes for a given HTTP request.

See also WARouteResult and WARouteContainer.

Instance Variables
	routes:		<Dictionary<String, SortedCollection<WARouteContainer>>

routes
	- the routes keyed by HTTP method, sorted by number of path elements
