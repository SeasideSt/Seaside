*seaside-gemstone300-core
restoreFromSnapshot: anObject
	"restore from a shallow copy"
	| class x |
	class := self class.
	(UnorderedCollection instSize + 1) to: class instSize do:
		[:i | self instVarAt: i put: (anObject instVarAt: i) ].
	class isVariable
		ifTrue: [
			self removeAll: self.
			anObject do: [:each | self add: each ].
		].