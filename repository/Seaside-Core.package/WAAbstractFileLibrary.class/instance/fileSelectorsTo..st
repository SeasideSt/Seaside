private
fileSelectorsTo: aSuperClass
	| selectors current |
	selectors := Set new.
	current := self class.
	[ aSuperClass name = current name ] whileFalse: [
		current selectors do: [ :each |
			(self isFileSelector: each) ifTrue: [
				selectors add: each ] ].
		current := current superclass ].
	^ selectors