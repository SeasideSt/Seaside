accessing
subName
	"Answers the component preceding the final '+' in the sub(type).
	Answers nil when the sub(type) does not contain a '+'."

	| index |

	index := self subSeparatorIndex.

	^index = 0 ifTrue: [nil] ifFalse: [self sub copyFrom: 1 to: index - 1]