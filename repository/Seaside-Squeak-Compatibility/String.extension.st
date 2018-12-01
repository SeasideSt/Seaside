Extension { #name : #String }

{ #category : #'*Seaside-Squeak-Compatibility' }
String >> padLeftTo: length with: char [
	^ self padded: #left to: length with: char
]

{ #category : #'*Seaside-Squeak-Compatibility' }
String >> padRightTo: length with: char [
	^ self padded: #right to: length with: char
]

{ #category : #'*Seaside-Squeak-Compatibility' }
String >> substrings: separators [
	^ self subStrings: separators
]
