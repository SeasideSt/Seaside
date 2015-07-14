WADispatcher takes http requests and dispatches them to the correct handler (WAApplication, WAFileHandler, etc). 

WADispatcher class>>default is the top level dispatcher. When a Seaside application is registered as "foo" the application is added to the top level dispatcher. The application is added to the entryPoints of the dispatcher at the key "foo". If a Seaside application is registered as "bar/foo" then the application isadded to a  dispatcher's entryPoints at the key "foo". That dispatcher is in the top level dispatcher's  entryPoints at the key "bar". 
  
When a http request is received it is sent to WADispatcher class>>default to find the correct handler for the request. If a handler exists for the request is sent to that handler. Otherwise the request is sent to the not found response generator.

The VW port maintains multiple copies of the tree of dispatchers rooted at WADispatcher class>>default. One copy is for each different URL that can reach Seaside (http://..../seaside/go/counter - normal, http://..../counter - SeasideShortPath, http://..../seaside/stream/counter - streaming). 

Instance Variables:
	defaultName	<String>
	entryPoints	<(Dictionary of: WAEntryPoint)>	 the keys are strings, which are the names and URL path segments for the handler at that key
