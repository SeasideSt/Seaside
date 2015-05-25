api
changedClassName
	self hasChangedClass ifFalse: [ ^ nil ].
	^ self changedClass theNonMetaClass fullName