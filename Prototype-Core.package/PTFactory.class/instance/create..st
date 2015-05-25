private
create: aClass
	^ self register:
		((aClass context: context)
			rendererClass: self rendererClass;
			yourself)