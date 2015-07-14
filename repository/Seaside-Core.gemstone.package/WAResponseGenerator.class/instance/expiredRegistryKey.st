generation
expiredRegistryKey
	"The session key has expired, redirect the request to the home directory preserving the path as good as possible."

	| url |
	self request isXmlHttpRequest
		ifTrue: [ ^ self forbidden ].
	url := self requestContext registry url.
	url addAllToPath: self requestContext consumer upToEnd.
	self request fields keysAndValuesDo: [ :key :value |
		(url isSeasideField: key) 
			ifFalse: [ url addField: key value: value ] ].
	self redirectTo: url