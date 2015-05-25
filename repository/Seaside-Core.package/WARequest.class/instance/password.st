accessing
password
	"Answer the password from basic authentication."
	
	| authorization |
	^ (authorization := self authorization) isNil
		ifFalse: [ authorization copyAfter: $: ]