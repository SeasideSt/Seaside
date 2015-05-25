options
optionAt: aKey put: aValue
	^ (self isSupportedOption: aKey) 
		ifTrue: [ super optionAt: aKey put: aValue ]
		ifFalse: [ self error: 'The option ' , aKey printString , ' is not supported in ' , self class name , '. Either use #ajaxSetup to configure default values, or the more powerful version with #ajax.' ]