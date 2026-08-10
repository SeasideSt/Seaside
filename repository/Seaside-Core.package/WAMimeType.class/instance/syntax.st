accessing
syntax
	"Answers the structured syntax suffix identified by the final '+' in
	the sub(type) or, when absent, the sub(type) itself."

	| index |

	index := self subSeparatorIndex.

	^index = 0 ifTrue: [self sub] ifFalse: [self sub copyFrom: index + 1 to: self sub size]