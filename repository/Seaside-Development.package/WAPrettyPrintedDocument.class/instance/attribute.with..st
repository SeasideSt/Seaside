private
attribute: aKey with: aValue 
	aValue == false ifTrue: [ ^ self ].
	html space.
	html span
		class: 'wa-attribute-key';
		with: aKey.
	self nextPut: $=.
	html span
		class: 'wa-attribute-value';
		with: [
			self nextPut: $".
			(self knownRefs includes: aKey) 
				ifTrue: [
					html anchor
						url: aValue greaseString;
						with: [ self print: aValue ] ]
				ifFalse: [
					(self knownEvents includes: aKey) 
						ifTrue: [
							html anchor
								onClick: aValue;
								with: [ self print: aValue ] ]
						ifFalse: [
							aValue == true 
								ifTrue: [ self nextPutAll: aKey ]
								ifFalse: [ self print: aValue ] ] ].
			self nextPut: $" ]