private
takeServerParametersFromRequest: aRequest
	"Retrieves scheme, hostname and basepath from the request unless already set."

	scheme isNil
		ifTrue: [ self scheme: aRequest url scheme ].
	host isNil 
		ifTrue: [ aRequest headers at: 'host' ifPresent: [ :value | self parseAuthority: value ] ].
	path isNil
		ifTrue: [ aRequest headers at: 'base' ifPresent: [ :value | self parsePath: value ] ]