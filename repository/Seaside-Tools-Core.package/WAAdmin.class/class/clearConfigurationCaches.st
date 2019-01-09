development
clearConfigurationCaches
	WASystemConfiguration clearAllDescriptions.
	self defaultServerManager adaptors do: [ :adaptor |
		adaptor requestHandler withDescendantsDo: [ :handler |
			handler configuration clearSearchContexts ] ]