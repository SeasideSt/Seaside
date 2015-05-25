accessing
helpTextFor: group
	^ self helpTexts at: group ifAbsent: [ nil ]