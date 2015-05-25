accessing
user
	"Answer the username from basic authentication."
	
	| authorization |
	^ (authorization := self authorization) isNil
		ifFalse: [ authorization copyUpTo: $: ]