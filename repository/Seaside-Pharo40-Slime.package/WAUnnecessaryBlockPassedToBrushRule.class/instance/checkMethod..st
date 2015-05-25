running
checkMethod: aContext
	aContext isRenderingMethod 
		ifTrue: [ super checkMethod: aContext ]