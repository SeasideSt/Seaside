private
isUrlEncoded: aFSResponderRole
	"answers whether the body of the given request is url encoded"
	
	^(aFSResponderRole params 
		at: 'CONTENT_TYPE' 
		ifAbsent: ['']) beginsWith: 'application/x-www-form-urlencoded'