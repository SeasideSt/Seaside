"
This element allows the use to select one (in single selection mode) or multiple (in single selection mode) elements. Default is single selection. Multiple selection can be triggered with #beMultiple.

Single selection is in general a drop-down list, so make sure the list of options is not too big.
Multiple selection has in general crappy browser support and a list of checkboxes is in general the better option.

If in single selection mode and you want enable ""no selection"" see #beOptional.

If you absolutely need to you can render the options yourself with 'html option' inside #with:

Make sure to check the superclass for more methods.

See WAInputTest >> #renderSingleSelectionOn: and WAInputTest >> #renderMultiSelectionOn: for examples.
"
Class {
	#name : #WASelectTag,
	#superclass : #WACollectionTag,
	#instVars : [
		'enabledBlock',
		'isOptional',
		'optionalLabel',
		'titleBlock',
		'values'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WASelectTag >> beOptional [
	"This adds a nil item to #list: which has the semantic of no selection. #optionalLabel: is the label for nil. This only really makes sense in single selection mode."

	isOptional := true
]

{ #category : #private }
WASelectTag >> before [
	self isOptional ifTrue: [ self renderOptional ].
	super before
]

{ #category : #callbacks }
WASelectTag >> callback: aBlock [
	values := Dictionary new.
	self name: (self storeCallback: (self callbackClass on: aBlock values: values))
]

{ #category : #accessing }
WASelectTag >> callbackClass [
	^ WAValuesCallback
]

{ #category : #callbacks }
WASelectTag >> dispatchCallback [
	^ self name: (self storeCallback: WADispatchCallback new)
]

{ #category : #callbacks }
WASelectTag >> enabled: aOneArgumentBlock [
	"Enable only those elements for selection for whom aBlock return true."

	enabledBlock := aOneArgumentBlock fixCallbackTemps
]

{ #category : #accessing }
WASelectTag >> hasCallback [
	^ values notNil
]

{ #category : #initialization }
WASelectTag >> initialize [
	super initialize.
	isOptional := false
	
]

{ #category : #testing }
WASelectTag >> isEnabled: anObject [
	"Test if anObject is enabled."

 	^ enabledBlock isNil or: [ enabledBlock value: anObject ]
]

{ #category : #testing }
WASelectTag >> isOptional [
	^ isOptional
]

{ #category : #attributes }
WASelectTag >> listId: aString [
	"aString is the id of a datalist"
	self attributeAt: 'list' put: aString
]

{ #category : #attributes }
WASelectTag >> name: aString [
	"This attribute assigns the control name."

	self attributes at: 'name' put: aString
]

{ #category : #private }
WASelectTag >> nextKey [
	^ values size + 1

]

{ #category : #attributes }
WASelectTag >> optionalLabel: aString [
	"The label for the nil element. See #beOptional."

	optionalLabel := aString
]

{ #category : #private }
WASelectTag >> renderListItem: anObject labelled: aString [
	| option |
	option := canvas option.
	self hasCallback
		ifTrue: [ option value: (self valueFor: anObject) ].
	titleBlock isNil
		ifFalse: [ option title: (self titleFor: anObject) ].
	option
		selected: (self isSelected: anObject);
		disabled: (self isEnabled: anObject) not;
		with: aString
]

{ #category : #private }
WASelectTag >> renderOptional [
	self renderListItem: nil labelled: optionalLabel
]

{ #category : #attributes }
WASelectTag >> size: aNumber [
	"If a SELECT element is presented as a scrolled list box, this attribute specifies the number of rows in the list that should be visible at the same time. Visual user agents are not required to present a SELECT element as a list box; they may use any other mechanism, such as a drop-down menu."

	self attributes at: 'size' put: aNumber
]

{ #category : #accessing }
WASelectTag >> tag [
	^ 'select'
]

{ #category : #private }
WASelectTag >> titleFor: anObject [
	^ titleBlock isNil
		ifTrue: [ anObject ]
		ifFalse: [ titleBlock value: anObject ]
]

{ #category : #callbacks }
WASelectTag >> titles: aOneArgumentBlock [
	"The given block will be used to generated title attributes for any of the options."

	titleBlock := aOneArgumentBlock fixCallbackTemps
]

{ #category : #private }
WASelectTag >> valueFor: anObject [
	^ self valuesAt: self nextKey put: anObject
]

{ #category : #accessing }
WASelectTag >> valuesAt: key put: anObject [
	values at: key put: anObject.
	^ values size
]
