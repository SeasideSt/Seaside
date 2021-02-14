Class {
	#name : #SUAutocompleter,
	#superclass : #PTUpdater,
	#instVars : [
		'element'
	],
	#category : 'Scriptaculous-Core-Controls'
}

{ #category : #actions }
SUAutocompleter >> activate [
	"Activate the autocompletion list."

	self call: 'activate'
]

{ #category : #options }
SUAutocompleter >> autoSelect: aBoolean [
	self optionAt: 'autoSelect' put: aBoolean
]

{ #category : #private }
SUAutocompleter >> defaultArguments [
	^ (Array with: self element) , super defaultArguments
]

{ #category : #private }
SUAutocompleter >> defaultPrototype [
	^ 'Ajax.Autocompleter'
]

{ #category : #accessing }
SUAutocompleter >> element [
	^ element
]

{ #category : #accessing }
SUAutocompleter >> element: aString [
	element := aString
]

{ #category : #options }
SUAutocompleter >> frequency: aNumber [
	"Default is 0.4 seconds"
	self optionAt: 'frequency' put: aNumber
]

{ #category : #actions }
SUAutocompleter >> hide [
	"Deactivate the autocompletion list."

	self call: 'hide'
]

{ #category : #options }
SUAutocompleter >> indicator: aString [
	"When sending the Ajax request Autocompleter shows this element with Element.show. When the request has been completed it will be hidden with Element.hide."

	self optionAt: 'indicator' put: aString
]

{ #category : #options }
SUAutocompleter >> minChars: aNumber [
	"The minimum number of characters required to start the autocompletion. Default is 1"

	self optionAt: 'minChars' put: aNumber
]

{ #category : #actions }
SUAutocompleter >> next [
	"Mark the next entry in the list."

	self call: 'markNext'
]

{ #category : #events }
SUAutocompleter >> onHide: anObject [
	self optionAt: 'onHide' put: anObject asFunction
]

{ #category : #events }
SUAutocompleter >> onSelected: anObject [
	"Hook for a custom function called after the element has been updated. This function is called after the built-in function that adds the list item text to the input field. The function receives two parameters, the autocompletion input field and the selected item."

	self optionAt: 'afterUpdateElement' put: anObject asFunction
]

{ #category : #events }
SUAutocompleter >> onShow: anObject [
	self optionAt: 'onShow' put: anObject asFunction
]

{ #category : #events }
SUAutocompleter >> onUpdate: anObject [
	"Hook for a custom function called after the element has been updated. This function is called instead of the built-in function that adds the list item text to the input field. The function receives one parameter only, the selected item."

	self optionAt: 'updateElement' put: anObject asFunction
]

{ #category : #options }
SUAutocompleter >> paramName: aString [
	self optionAt: 'paramName' put: aString
]

{ #category : #actions }
SUAutocompleter >> previous [
	"Mark the previous entry in the list."

	self call: 'markPrevious'
]

{ #category : #initialization }
SUAutocompleter >> registerCallbackIn: aCallbackStore [
	self paramName: (aCallbackStore store: (JSAjaxCallback on: [ :v | self processWith: v ]))
]

{ #category : #options }
SUAutocompleter >> selectClass: aString [
	"The CSS class name of the elements within the list-items that should be used when copying the text to the text-input."

	self optionAt: 'select' put: aString
]

{ #category : #actions }
SUAutocompleter >> selectedIndex [
	"Answer the selected index in the list."

	self access: 'index'
]

{ #category : #options }
SUAutocompleter >> tokens: anArray [
	"The token required to separate multiple autocompletion entries in one text-input."

	self optionAt: 'tokens' put: anArray
]
