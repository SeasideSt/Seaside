misc.
apiForMethod: method

	| api seasidePath swaggerPath |
	
	seasidePath := (GRPlatform current pragmaAt: #path: in: method) arguments first asZnUrl.
	swaggerPath := '/' , seasidePath asZnUrl path.

	api := Dictionary new.
	api at: 'description' put: 'From method ' , method selector asString.
	api at: 'path' put: swaggerPath.
	api at: 'operations' put: (Array with: (self operationForMethod: method)).
	^ api