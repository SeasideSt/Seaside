accessing-headers
authorization
	"Answer the basic authorization string from the request. This is the username and the password separated by a colon."
	
	| authorization |
	authorization := self headerAt: 'authorization'.
	^ authorization isNil ifFalse: [ self decodeAuthorization: authorization ]