Class {
	#name : #WAStringInspector,
	#superclass : #WAComponent,
	#instVars : [
		'string'
	],
	#category : 'Seaside-GemStone-Tools-Production-ObjectLog'
}

{ #category : #rendering }
WAStringInspector >> renderContentOn: html [

	html preformatted: self string
]

{ #category : #accessing }
WAStringInspector >> string [

	^string
]

{ #category : #accessing }
WAStringInspector >> string: aString [

	string := aString
]
