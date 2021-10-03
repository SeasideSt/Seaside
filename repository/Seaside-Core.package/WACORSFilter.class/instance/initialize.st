private
initialize 
	
	super initialize.
	allowedOrigins := OrderedCollection new.
	allowedHeaders := OrderedCollection new.
	allowedMethods := OrderedCollection new.
	exposedHeaders := OrderedCollection new.
	allowsCredentials := false