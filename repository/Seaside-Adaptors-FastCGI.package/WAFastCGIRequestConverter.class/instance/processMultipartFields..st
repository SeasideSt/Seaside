private
processMultipartFields: aFSResponderRole
	| fields |
	fields := WARequestFields new.	
	self multipartFormFieldsIn: aFSResponderRole do: [:part |  fields at: part key add: part value ].
	
	"ugly"
	aFSResponderRole params at: 'postFields' put: fields