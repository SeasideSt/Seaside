Class {
	#name : #WAGemStoneInspector,
	#superclass : #WAInspector,
	#category : 'Seaside-GemStone-Development-Core'
}

{ #category : #'class initialization' }
WAGemStoneInspector class >> initialize [
	self select
]

{ #category : #actions }
WAGemStoneInspector >> displayFullPrintStringFor: anObject [

	self call: (WAStringInspector new
		string: anObject printString;
		yourself)
]

{ #category : #actions }
WAGemStoneInspector >> doIt [
	| result |
	result := super doIt.
	selected ifNil: [ ^ result ].
	^ selected isNumber
		ifTrue: [ self object at: selected put: result ]
		ifFalse: [ self object instVarNamed: selected put: result ]
]

{ #category : #actions }
WAGemStoneInspector >> evaluate [
	"GemStone does not have a thisContext variable..."

	^input evaluateInContext: self object symbolList: GsSession currentSession symbolList
]

{ #category : #private }
WAGemStoneInspector >> fieldsFor: anObject [
	^ anObject inspectorFields
]

{ #category : #rendering }
WAGemStoneInspector >> renderRow: anObject named: aString group: aRadioGroup on: html [
	| radioButton |
	html tableRow: [
		html tableHeading: [
			radioButton := aRadioGroup radioButton
				ensureId;
				value: aString;
				yourself.
			html label for: radioButton id; with: [
				(self isPrimitiveType: anObject)
					ifTrue: [ html text: aString ]
					ifFalse: [
						html anchor
							callback: [ self chooseObject: anObject named: aString ];
							with: aString ] ] ].
		html tableData: [ | str |
			str := anObject printStringLimitedTo: 100.
			str size > 90
				ifTrue: [
					html anchor
						callback: [ self displayFullPrintStringFor: anObject ];
						with: str]
				ifFalse: [
					html text: str]] ]
]
