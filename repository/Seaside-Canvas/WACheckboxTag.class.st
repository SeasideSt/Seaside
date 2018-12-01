"
The checkbox element is used with an associated property of typ boolean. It renders a HTML <input> element of type checkbox.

If this input element is disabled then the callback will still be evaluated but with an argument that is false. See method comment of #callback: for more information.


"
Class {
	#name : #WACheckboxTag,
	#superclass : #WAFormInputTag,
	#instVars : [
		'value',
		'callback'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WACheckboxTag >> after [
	super after.
	callback isNil ifTrue: [ ^ self ].
	canvas hiddenInput 
		callback: [
			callback value: value.
			value := false ]
]

{ #category : #callbacks }
WACheckboxTag >> callback: aBlock [
	"Compared to other form elements this input element is disabled then the callback will still be evaluted but with an argument that is false. So either don't assign a callback to disabled checkboxes or make the callback code aware that he might be invoked in a disabled state.
	
	However if you enable a disabled checkbox with JavaScript then the callback is invoked with the correct argument.
	
	http://code.google.com/p/seaside/issues/detail?id=18"

	value := false.
	callback := aBlock fixCallbackTemps.
	super callback: [ value := true ]
]

{ #category : #attributes }
WACheckboxTag >> onTrue: trueBlock onFalse: falseBlock [
	trueBlock fixCallbackTemps. falseBlock fixCallbackTemps.
	self callback: [ :v | v ifTrue: [ trueBlock value ] ifFalse: [ falseBlock value ] ]
]

{ #category : #accessing }
WACheckboxTag >> type [
	^ 'checkbox'
]

{ #category : #attributes }
WACheckboxTag >> value: aBoolean [ 
	self attributes 
		at: 'checked'
		put: aBoolean
]
