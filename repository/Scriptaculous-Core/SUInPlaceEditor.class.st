Class {
	#name : #SUInPlaceEditor,
	#superclass : #PTUpdater,
	#category : 'Scriptaculous-Core-Controls'
}

{ #category : #options }
SUInPlaceEditor >> autoRows: anInteger [
	self optionAt: 'autoRows' put: anInteger
]

{ #category : #deprecated }
SUInPlaceEditor >> cancelButton: aBoolean [ 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#cancelButton:'
		details: 'Use cancelControl:.'.
	self cancelControl: (aBoolean 
			ifTrue: [ 'button' ]
			ifFalse: [ false ])
]

{ #category : #options }
SUInPlaceEditor >> cancelControl: aString [
	"link|button|false"

	self optionAt: 'cancelControl' put: aString
]

{ #category : #deprecated }
SUInPlaceEditor >> cancelLink: aBoolean [ 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#cancelLink:'
		details: 'Use #cancelControl:.'.
	self cancelControl: (aBoolean 
			ifTrue: [ 'link' ]
			ifFalse: [ false ])
]

{ #category : #options }
SUInPlaceEditor >> cancelText: aString [
	"The text of the link that cancels editing."
	
	self optionAt: 'cancelText' put: aString
]

{ #category : #options }
SUInPlaceEditor >> clickToEditText: aString [
	"The text shown during mouseover the editable text."
	
	self optionAt: 'clickToEditText' put: aString
]

{ #category : #private }
SUInPlaceEditor >> defaultPrototype [
	^ 'Ajax.InPlaceEditor'
]

{ #category : #options }
SUInPlaceEditor >> externalControl: aString [
	"Id of an element that acts as an external control used to enter edit mode. The external control will be hidden when entering edit mode and shown again when leaving edit mode."
	
	self optionAt: 'externalControl' put: aString
]

{ #category : #options }
SUInPlaceEditor >> externalControlOnly: aBoolean [
	self optionAt: 'externalControlOnly' put: aBoolean
]

{ #category : #options }
SUInPlaceEditor >> fieldPostCreation: aString [
	"activate|focus|false"
	
	self optionAt: 'fieldPostCreation' put: aString
]

{ #category : #options }
SUInPlaceEditor >> formClassName: aString [
	self optionAt: 'formClassName' put: aString
]

{ #category : #options }
SUInPlaceEditor >> formId: aString [
	"Id of the element to edit."
	
	self optionAt: 'formId' put: aString
]

{ #category : #options }
SUInPlaceEditor >> highlightColor: aColor [
	"The highlight color."

	self optionAt: 'highlightColor' put: aColor
]

{ #category : #options }
SUInPlaceEditor >> highlightEndColor: aColor [
	"The color which the highlight fades to."

	self optionAt: 'highlightEndColor' put: aColor
]

{ #category : #options }
SUInPlaceEditor >> hoverClassName: aString [
	self optionAt: 'hoverClassName' put: aString
]

{ #category : #options }
SUInPlaceEditor >> htmlResponse: aBoolean [
	self optionAt: 'htmlResponse' put: aBoolean
]

{ #category : #initialization }
SUInPlaceEditor >> initialize [
	super initialize.
	self options removeKey: 'evalScripts'
]

{ #category : #options }
SUInPlaceEditor >> loadingClassName: aString [
	self optionAt: 'loadingClassName' put: aString
]

{ #category : #options }
SUInPlaceEditor >> loadingText: aString [
	self optionAt: 'loadingText' put: aString
]

{ #category : #deprecated }
SUInPlaceEditor >> okButton: aBoolean [ 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#okButton:'
		details: 'Use okControl:.'.
	self okControl: (aBoolean 
			ifTrue: [ 'button' ]
			ifFalse: [ false ])
]

{ #category : #options }
SUInPlaceEditor >> okControl: aString [
	"link|button|false"
	
	self optionAt: 'okControl' put: aString
]

{ #category : #deprecated }
SUInPlaceEditor >> okLink: aBoolean [ 
	self 
		greaseDeprecatedApi: 'SUInPlaceEditor>>#okLink:'
		details: 'Use okControl:.'.
	self okControl: (aBoolean 
			ifTrue: [ 'link' ]
			ifFalse: [ false ])
]

{ #category : #options }
SUInPlaceEditor >> okText: aString [
	"The text of the submit button that submits the changed value to the server."

	self optionAt: 'okText' put: aString
]

{ #category : #events }
SUInPlaceEditor >> onEnterEditMode: anObject [
	self optionAt: 'onEnterEditMode' put: anObject asFunction
]

{ #category : #events }
SUInPlaceEditor >> onEnterHover: anObject [
	self optionAt: 'onEnterHover' put: anObject asFunction
]

{ #category : #events }
SUInPlaceEditor >> onFormCustomization: anObject [
	self optionAt: 'onFormCustomization' put: anObject asFunction
]

{ #category : #events }
SUInPlaceEditor >> onLeaveEditMode: anObject [
	self optionAt: 'onLeaveEditMode' put: anObject asFunction
]

{ #category : #events }
SUInPlaceEditor >> onLeaveHover: anObject [
	self optionAt: 'onLeaveHover' put: anObject asFunction
]

{ #category : #options }
SUInPlaceEditor >> paramName: aString [
	self optionAt: 'paramName' put: aString
]

{ #category : #options }
SUInPlaceEditor >> rows: anInteger [
	"The row height of the input field, anything greater than 1 uses a multiline textarea for input."

	self optionAt: 'rows' put: anInteger
]

{ #category : #options }
SUInPlaceEditor >> savingClassName: aString [
	self optionAt: 'savingClassName' put: aString
]

{ #category : #options }
SUInPlaceEditor >> savingText: aString [
	"The text shown while the text is sent to the server."

	self optionAt: 'savingText' put: aString
]

{ #category : #options }
SUInPlaceEditor >> size: anInteger [
	self optionAt: 'size' put: anInteger
]

{ #category : #options }
SUInPlaceEditor >> stripLoadedTextTags: aBoolean [
	self optionAt: 'stripLoadedTextTags' put: aBoolean
]

{ #category : #options }
SUInPlaceEditor >> submitOnBlur: aBoolean [
	self optionAt: 'submitOnBlur' put: aBoolean
]

{ #category : #options }
SUInPlaceEditor >> textAfterControls: aString [
	self optionAt: 'textAfterControls' put: aString
]

{ #category : #options }
SUInPlaceEditor >> textBeforeControls: aString [
	self optionAt: 'textBeforeControls' put: aString
]

{ #category : #options }
SUInPlaceEditor >> textBetweenControls: aString [
	self optionAt: 'textBetweenControls' put: aString
]

{ #category : #triggers }
SUInPlaceEditor >> triggerInPlaceEditor: aBlock [
	self callback: aBlock value: (JSStream argument: 1).
	self optionAt: 'callback' put: (JSFunction new
		add: (self options removeKey: 'parameters');
		return: true;
		yourself)
]
