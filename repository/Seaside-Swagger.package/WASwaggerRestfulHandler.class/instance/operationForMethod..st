misc.
operationForMethod: method

	| operation params errorResponses |
	
	params := (method pragmas select: [ :pragma | pragma keyword = #Argument:ofType:passedBy:description: ]) collect: [ :pragma |
		Dictionary new
			at: 'name' put: pragma arguments first;
			at: 'allowMultiple' put: false;
			at: 'dataType' put: pragma arguments second;
			at: 'description' put: pragma arguments fourth;
			at: 'paramType' put: pragma arguments third;
			yourself.
	].

	errorResponses := (method pragmas select: [ :pragma | pragma keyword = #Error:reason: ]) collect: [ :pragma |
		Dictionary new
			at: 'code' put: pragma arguments first;
			at: 'reason' put: pragma arguments second;
			yourself.
	].
		
	operation := Dictionary new.
	operation at: 'httpMethod' put: (method pragmas first keyword asUppercase).
	operation at: 'nickname' put: (method selector asString copyReplaceAll: ':' with: '_').
	(GRPlatform current pragmaAt: #Notes: in: method) ifNotNil: [ :notePragma | operation at: 'notes' put: notePragma arguments first ].
	self flag: 'Swagger UI does not need/use the responseClass, but it probably is necessary for the Swagger code generator'.
	(GRPlatform current pragmaAt: #ResponseClass: in: method) ifNotNil: [ :responseClassPragma | operation at: 'responseClass' put: responseClassPragma arguments first ].
	(GRPlatform current pragmaAt: #Summary: in: method) ifNotNil: [ :summaryPragma | operation at: 'summary' put: summaryPragma arguments first ].
	operation at: 'parameters' put: params.
	operation at: 'errorResponses' put: errorResponses.
	^ operation
