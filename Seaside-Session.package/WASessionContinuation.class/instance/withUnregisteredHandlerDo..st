private
withUnregisteredHandlerDo: aBlock 
	^ aBlock 
		on: WAUnregisteredHandlerError
		do: [ :err | self requestContext redirectTo: self application url ]