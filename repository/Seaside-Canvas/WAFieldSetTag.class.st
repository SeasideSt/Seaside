"
The FIELDSET element allows authors to group thematically related controls and labels. Grouping controls makes it easier for users to understand their purpose while simultaneously facilitating tabbing navigation for visual user agents and speech navigation for speech-oriented user agents. The proper use of this element makes documents more accessible.

The LEGEND element allows authors to assign a caption to a FIELDSET. The legend improves accessibility when the FIELDSET is rendered non-visually.
"
Class {
	#name : #WAFieldSetTag,
	#superclass : #WATagBrush,
	#instVars : [
		'legend'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WAFieldSetTag >> before [
	super before.
	legend isNil
		ifFalse: [ canvas legend: legend ]
]

{ #category : #accessing }
WAFieldSetTag >> legend: aString [
	legend := aString
]

{ #category : #accessing }
WAFieldSetTag >> tag [
	^ 'fieldset'
]
