accessing
allowedOrigin

	^ allowedOrigin ifNil: [ allowedOrigin := OrderedCollection new ]