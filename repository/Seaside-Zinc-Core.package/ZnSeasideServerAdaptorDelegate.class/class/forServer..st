instance creation
forServer: znServer
	| adaptor |
	adaptor := ZnZincServerAdaptor new.
	adaptor unregister.
	adaptor server: znServer.
	^ self with: adaptor