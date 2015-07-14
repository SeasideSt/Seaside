actions
processTask
	| value |
	self performSafely: [ value := taskBlock value ].

	GRPlatform current doTransaction: [ 
		taskValue := value.
		hasValue := true.
		self class inProcess remove: self ]