converting
decodedWith: aCodec
	"answers a copy of the receiver decoded with the given codec
	http://www.ietf.org/rfc/rfc3987.txt"
	| url |
	url := self copy.
	
	"scheme, host, port cannot include escaped characters (%FF) and so should not
	be able to include characters that need decoding"
	
	"userinfo (username + password) can be percent encoded"
	self user isNil ifFalse: [
		url user: (aCodec url decode: self user) ].
	self password isNil ifFalse: [
		url password: (aCodec url decode: self password) ].
	
	self path isEmpty ifFalse: [
		url path: (self path collect: [ :each | aCodec url decode: each ]) ].
	url queryFields: nil.
	self queryFields keysAndValuesDo: [ :key :value |
		url
			addField: (aCodec url decode: key)
			value: (value isNil ifFalse: [ aCodec url decode: value ]) ].
	self fragment isNil ifFalse: [
		url fragment: (aCodec url decode: self fragment) ].
	
	^ url