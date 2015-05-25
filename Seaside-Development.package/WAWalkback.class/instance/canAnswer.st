private
canAnswer
	^ self decorations anySatisfy: [ :each |
		each isKindOf: WAAnswerHandler ]