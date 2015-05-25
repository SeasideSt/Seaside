querying
enumerator
	"Answer an enumerator on the receiver."

	^ (PTEnumerable context: self renderContext receiver: self)
		rendererClass: self rendererClass;
		yourself