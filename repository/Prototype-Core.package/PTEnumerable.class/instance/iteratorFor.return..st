private
iteratorFor: anObject return: aBoolean
	^ anObject isBlock
		ifFalse: [ anObject asFunction ]
		ifTrue: [ 
			(JSFunction context: self renderContext iterator: anObject)
				rendererClass: self rendererClass;
				return: aBoolean ]