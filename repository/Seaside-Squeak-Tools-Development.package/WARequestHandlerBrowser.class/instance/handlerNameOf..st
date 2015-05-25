handlers
handlerNameOf: aWAApplication 
	
	^ aWAApplication isRoot
		ifTrue: ['/' asText allBold]
		ifFalse: [aWAApplication name]