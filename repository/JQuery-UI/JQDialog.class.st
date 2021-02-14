"
Make the selected elements Dialog boxes.
"
Class {
	#name : #JQDialog,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Widgets'
}

{ #category : #convenience }
JQDialog >> addButton: aString do: anObject [ 
	"Adds a new button with the label aString and the action anObject."
	(self options 
		at: 'buttons'
		ifAbsentPut: [ GRSmallDictionary2 new ]) 
		at: aString
		put: anObject asFunction
]

{ #category : #'options-generated' }
JQDialog >> appendTo: aString [
	"Which element the dialog (and overlay, if modal) should be appended to."

	self optionAt: 'appendTo' put: aString
]

{ #category : #'options-generated' }
JQDialog >> autoOpen: aBoolean [
	"When 'autoOpen' is 'true' the dialog will open automatically when 'dialog' is called. If 'false' it will stay hidden until '.dialog('open')' is called on it."

	self optionAt: 'autoOpen' put: aBoolean
]

{ #category : #'options-generated' }
JQDialog >> buttons: aDictionary [
	"Specifies which buttons should be displayed on the dialog. The property key is the text of the button. The value is the callback function for when the button is clicked. The context of the callback is the dialog element; if you need access to the button, it is available as the target of the event object."

	self optionAt: 'buttons' put: aDictionary
]

{ #category : #actions }
JQDialog >> close [
	"Closes the specified dialog boxes."
	
	self action: 'close'
]

{ #category : #'options-generated' }
JQDialog >> closeOnEscape: aBoolean [
	"Specifies whether the dialog should close when it has focus and the user presses the esacpe (ESC) key."

	self optionAt: 'closeOnEscape' put: aBoolean
]

{ #category : #'options-generated' }
JQDialog >> closeText: aString [
	"Specifies the text for the close button. Note that the close text is visibly hidden when using a standard theme."

	self optionAt: 'closeText' put: aString
]

{ #category : #'options-generated' }
JQDialog >> dialogClass: aString [
	"The specified class name(s) will be added to the dialog, for additional theming."

	self optionAt: 'dialogClass' put: aString
]

{ #category : #'options-generated' }
JQDialog >> draggable: aBoolean [
	"If set to true, the dialog will be draggable will be draggable by the titlebar."

	self optionAt: 'draggable' put: aBoolean
]

{ #category : #'options-generated' }
JQDialog >> height: aNumber [
	"The height of the dialog, in pixels. Specifying 'auto' is also supported to make the dialog adjust based on its content."

	self optionAt: 'height' put: aNumber
]

{ #category : #'options-generated' }
JQDialog >> hide: aStringOrObject [
	"The effect to be used when the dialog is closed."

	self optionAt: 'hide' put: aStringOrObject
]

{ #category : #callbacks }
JQDialog >> html: aBlock [
	"Conveniance method that takes a block that is used to render the contents of the window when being opened."

	self autoOpen: false.
	self onOpen: (self owner copy load
		html: aBlock)
]

{ #category : #actions }
JQDialog >> isOpen [
	"Returns true if the dialog is currently open."
	
	self action: 'isOpen'
]

{ #category : #'options-generated' }
JQDialog >> maxHeight: aNumber [
	"The maximum height to which the dialog can be resized, in pixels."

	self optionAt: 'maxHeight' put: aNumber
]

{ #category : #'options-generated' }
JQDialog >> maxWidth: aNumber [
	"The maximum width to which the dialog can be resized, in pixels."

	self optionAt: 'maxWidth' put: aNumber
]

{ #category : #accessing }
JQDialog >> method [
	^ 'dialog'
]

{ #category : #'options-generated' }
JQDialog >> minHeight: aNumber [
	"The minimum height to which the dialog can be resized, in pixels."

	self optionAt: 'minHeight' put: aNumber
]

{ #category : #'options-generated' }
JQDialog >> minWidth: aNumber [
	"The minimum width to which the dialog can be resized, in pixels."

	self optionAt: 'minWidth' put: aNumber
]

{ #category : #'options-generated' }
JQDialog >> modal: aBoolean [
	"If set to true, the dialog will have modal behavior; other items on the page will be disabled (i.e. cannot be interacted with). Modal dialogs create an overlay below the dialog but above other page elements."

	self optionAt: 'modal' put: aBoolean
]

{ #category : #actions }
JQDialog >> moveToTop [
	"Moves the speicifed dialog on top of the dialogs stack."
	
	self action: 'moveToTop'
]

{ #category : #'events-generated' }
JQDialog >> onBeforeClose: anObject [
	"This event is triggered when a dialog attempts to close. If the beforeClose event handler (callback function) returns false, the close will be prevented."

	self optionAt: 'beforeClose' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onClose: anObject [
	"This event is triggered when the dialog is closed."

	self optionAt: 'close' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onDrag: anObject [
	"This event is triggered when the dialog is dragged."

	self optionAt: 'drag' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onDragStart: anObject [
	"This event is triggered at the beginning of the dialog being dragged."

	self optionAt: 'dragStart' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onDragStop: anObject [
	"This event is triggered after the dialog has been dragged."

	self optionAt: 'dragStop' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onFocus: anObject [
	"This event is triggered when the dialog gains focus."

	self optionAt: 'focus' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onOpen: anObject [
	"This event is triggered when dialog is opened."

	self optionAt: 'open' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onResize: anObject [
	"This event is triggered when the dialog is resized. [http://www.jsfiddle.net/Jp7TM/18/ demo]"

	self optionAt: 'resize' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onResizeStart: anObject [
	"This event is triggered at the beginning of the dialog being resized."

	self optionAt: 'resizeStart' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDialog >> onResizeStop: anObject [
	"This event is triggered after the dialog has been resized."

	self optionAt: 'resizeStop' put: anObject asFunction
]

{ #category : #actions }
JQDialog >> open [
	"Opens the specified dialog boxes."
	
	self action: 'open'
]

{ #category : #'options-generated' }
JQDialog >> position: aStringOrArray [
	"Specifies where the dialog should be displayed. See details at http://api.jqueryui.com/dialog/#option-position"

	self optionAt: 'position' put: aStringOrArray
]

{ #category : #'options-generated' }
JQDialog >> resizable: aBoolean [
	"If set to true, the dialog will be resizeable."

	self optionAt: 'resizable' put: aBoolean
]

{ #category : #'options-generated' }
JQDialog >> show: aStringOrObject [
	"The effect to be used when the dialog is opened."

	self optionAt: 'show' put: aStringOrObject
]

{ #category : #'options-generated' }
JQDialog >> title: aString [
	"Specifies the title of the dialog. Any valid HTML may be set as the title. The title can also be specified by the title attribute on the dialog source element."

	self optionAt: 'title' put: aString
]

{ #category : #'options-generated' }
JQDialog >> width: aNumber [
	"The width of the dialog, in pixels."

	self optionAt: 'width' put: aNumber
]
