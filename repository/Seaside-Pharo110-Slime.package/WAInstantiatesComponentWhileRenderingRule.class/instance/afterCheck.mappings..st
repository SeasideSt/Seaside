hooks
afterCheck: aNode mappings: dict

	| class |
	aNode methodNode method isRenderingMethod ifFalse: [ ^ false ].
	class := Smalltalk classNamed: aNode receiver name.
	class ifNil: [ ^ false ].
	^ class isBehavior and: [
		  (WASlime class: class includesBehaviorNamed: #WAPresenter) and: [
			  (WASlime isWithinCallback: aNode) not ] ]