private
recursiveCollapse: anObject on: aScript
	expanded remove: anObject.
	(childrenBlock value: anObject) do: [ :each |
		aScript prototype element
			id: (self uid: each on: aScript);
			remove.
		(expanded includes: each)
			ifTrue: [ self recursiveCollapse: each on: aScript ] ]