misc.
swaggerResourcesForAPIKey: apiKey

	| apis resources description handlers |
	
	handlers := self handlersForAPIKey: apiKey.
	
	apis := OrderedCollection new.
	resources := Dictionary new.
	(handlers asSortedCollection) do: [ :handler |
		apis add: (Dictionary new 
			at: 'path' put: '/',handler,'.{format}';
			at: 'description' put: 'Operations for ' , handler;
			yourself).
	].
	resources at: 'apis' put: apis.
	resources at: 'basePath' put: self baseURL printString.
	resources at: 'swaggerVersion' put: self swaggerVersion.
	resources at: 'apiVersion' put: self apiVersion.
	self respondJson: resources.
