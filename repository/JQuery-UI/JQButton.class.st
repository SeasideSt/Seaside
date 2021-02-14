"
Button enhances standard form elements like button, input of type submit or reset or anchors to themable buttons with appropiate mouseover and active styles.

In addition to basic push buttons, radio buttons and checkboxes (inputs of type radio and checkbox) can be converted to buttons: Their associated label is styled to appear as the button, while the underlying input is updated on click.

Buttons can be grouped using the buttonSet method, which should be always applied for radio buttons.
"
Class {
	#name : #JQButton,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Widgets'
}

{ #category : #options }
JQButton >> disabled: aBoolean [
	"Disables (true) or enables (false) the button. Can be set when initialising (first creating) the button."

	self optionAt: 'disabled' put: aBoolean
]

{ #category : #accessing }
JQButton >> icons [
	^ self options at: 'icons' ifAbsentPut: [ GRSmallDictionary2 new ]
]

{ #category : #'options-generated' }
JQButton >> icons: anOptions [
	"Icons to display, with or without text (see text option). The primary icon is displayed by default on the left of the label text, the secondary by default is on the right. Value for the primary and secondary properties must be a classname (String), eg. 'ui-icon-gear'. For using only one icon: icons: {primary:'ui-icon-locked'}. For using two icons: icons: {primary:'ui-icon-gear',secondary:'ui-icon-triangle-1-s'}"

	self optionAt: 'icons' put: anOptions
]

{ #category : #'options-generated' }
JQButton >> label: aString [
	"Text to show on the button. When not specified (null), the element's html content is used, or its value attribute when it's an input element of type submit or reset; or the html content of the associated label element if its an input of type radio or checkbox"

	self optionAt: 'label' put: aString
]

{ #category : #accessing }
JQButton >> method [
	^ 'button'
]

{ #category : #options }
JQButton >> primaryIcon: aString [
	self icons at: 'primary' put: aString
]

{ #category : #options }
JQButton >> secondaryIcon: aString [
	self icons at: 'secondary' put: aString
]

{ #category : #'options-generated' }
JQButton >> text: aBoolean [
	"Whether to show any text - when set to false (display no text), icons (see icons option) must be enabled, otherwise it'll be ignored."

	self optionAt: 'text' put: aBoolean
]
