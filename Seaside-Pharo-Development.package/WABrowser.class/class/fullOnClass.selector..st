instance creation
fullOnClass: aClass selector: aSelector
	^ self new model: (self browserClass new setClass: aClass selector: aSelector)