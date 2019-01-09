accessing
serversOfClass: aClassName
	^servers select: [:each | each serverClass name = aClassName]