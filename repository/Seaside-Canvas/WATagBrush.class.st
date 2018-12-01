"
This is the superclass for all XML element classes. Its main additions are
- element name (#tag)
- attributes (instance of WAHtmlAttributes)
- common events (onXXX), this is a hack and would better be solved with traits
"
Class {
	#name : #WATagBrush,
	#superclass : #WABrush,
	#instVars : [
		'attributes'
	],
	#category : 'Seaside-Canvas-Base'
}

{ #category : #'code generation' }
WATagBrush class >> tag [
	"WASelectTag tag"
	"WAGenericTag tag"

	^ (self selectors includes: #tag)
		ifTrue: [ self new tag ]
		ifFalse: [ nil ]
]

{ #category : #'attributes-keyboard' }
WATagBrush >> accessKey: aString [
	"Set a keyboard shortcut to access an element. An access key is a single character from the document character set.

	Pressing an access key assigned to an element gives focus to the element. The action that occurs when an element receives focus depends on the element. For example, when a user activates a link defined by the A element, the user agent generally follows the link. When a user activates a radio button, the user agent changes the value of the radio button. When the user activates a text field, it allows input, etc.

The following elements support the accesskey attribute: A, AREA, BUTTON, INPUT, LABEL, and LEGEND, and TEXTAREA.

	The invocation of access keys depends on the underlying system. For instance, on machines running MS Windows, one generally has to press the 'alt' key in addition to the access key. On Apple systems, one generally has to press the 'cmd' key in addition to the access key."

	self attributes at: 'accesskey' put: aString
]

{ #category : #private }
WATagBrush >> after [
	"This template method is called directly after rendering the content of the receiver."
]

{ #category : #'accessing-attributes' }
WATagBrush >> attributeAt: aKey [
	^ self attributes at: aKey
]

{ #category : #'accessing-attributes' }
WATagBrush >> attributeAt: aKey ifAbsent: aBlock [
	^ self attributes at: aKey ifAbsent: aBlock
]

{ #category : #'accessing-attributes' }
WATagBrush >> attributeAt: aKey ifAbsentPut: aBlock [
	^ self attributes at: aKey ifAbsentPut: aBlock
]

{ #category : #'accessing-attributes' }
WATagBrush >> attributeAt: aKey ifPresent: aBlock [
	^ self attributes at: aKey ifPresent: aBlock
]

{ #category : #'accessing-attributes' }
WATagBrush >> attributeAt: aKey put: aValue [
	^ self attributes at: aKey put: aValue
]

{ #category : #accessing }
WATagBrush >> attributes [
	^ attributes ifNil: [ attributes := WAHtmlAttributes new ]
]

{ #category : #accessing }
WATagBrush >> attributes: anHtmlAttributes [
	attributes := anHtmlAttributes
]

{ #category : #attributes }
WATagBrush >> autofocus [
	"supported on:
	- Opera 9"
	self attributeAt: 'autofocus' put: true
]

{ #category : #private }
WATagBrush >> before [
	"This template method is called directly before rendering the content of the receiver."
]

{ #category : #'attributes-core' }
WATagBrush >> class: aString [
	"This attribute assigns one or more class names to an element; the element may be said to belong to these classes. A class name may be shared by several element instances. Multiple classes might be added to one brush."

	self attributes addClass: aString
]

{ #category : #convenience }
WATagBrush >> class: aString if: aBoolean [
	"Adds the class aString to the receiving element if aBoolean is true. 
	
	Example:
	
	html div
		class: 'error' if: self hasError;
		with: self errorMessage"

	aBoolean
		ifTrue: [ self class: aString ]
]

{ #category : #private }
WATagBrush >> closeTag [
	"Close the receiving tag onto the document."

	self document closeTag: self tag
]

{ #category : #'attributes-language' }
WATagBrush >> direction: aString [
	"Set the text direction ltr (left-to-right) or right-to-left (rtl).

	Not supported on:
	APPLET, BASE, BASEFONT, BR, FRAME, FRAMESET, IFRAME, PARAM, SCRIPT"

	self attributes at: 'dir' put: aString
]

{ #category : #attributes }
WATagBrush >> disabled [
	"When set for a form control, this boolean attribute disables the control for user input.
When set, the disabled attribute has the following effects on an element:
	-	Disabled controls do not receive focus.
	-	Disabled controls are skipped in tabbing navigation.
	-	Disabled controls cannot be successful (= will not be submitted).
		
	The following elements support the disabled attribute: BUTTON, INPUT, OPTGROUP, OPTION, SELECT, and TEXTAREA. This one other example of functionality implemented way too high in the class hierarchy because we don't have traits."
	self disabled: true
]

{ #category : #attributes }
WATagBrush >> disabled: aBoolean [
	self attributes at: 'disabled' put: aBoolean
]

{ #category : #accessing }
WATagBrush >> document [
	^ canvas document
]

{ #category : #public }
WATagBrush >> ensureId [
	"Answer the id of the receiving attribute. In case the receiver doesn't have an id yet, generate a new one."

	^ self attributes at: 'id' ifAbsentPut: [ canvas nextId ]
]

{ #category : #accessing }
WATagBrush >> id [
	^ self attributes at: 'id'
]

{ #category : #'attributes-core' }
WATagBrush >> id: aString [
	"The id attribute assigns a identifier to an element. The id of an element must be unique within a document."

	self attributes at: 'id' put: aString
]

{ #category : #attributes }
WATagBrush >> irrelevant [
	"All elements may have the irrelevant content attribute set. The irrelevant  attribute is a boolean attribute. When specified on an element, it indicates that the element is not yet, or is no longer, relevant. User agents should not render elements that have the irrelevant  attribute specified."
	self attributeAt: 'irrelevant' put: true
]

{ #category : #testing }
WATagBrush >> isClosed [
	"Answer true if this tag should be closed immediately, such as <br />."

	^ false
]

{ #category : #attributes }
WATagBrush >> isDisabled [
	"answers whether the receiver is disabled"

	^ self attributes at: 'disabled' ifAbsent: [ false ]
]

{ #category : #'attributes-language' }
WATagBrush >> language: aString [
	"Set the language code."

	self attributes
		at: 'lang' put: aString;
		at: 'xml:lang' put: aString
]

{ #category : #'attributes-events' }
WATagBrush >> onAbort: anObject [
	"The abort event occurs when page loading is stopped before an image has been allowed to completely load."

	self document scriptGenerator
		event: 'abort'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onBlur: anObject [
	"The onblurs event occurs when the element that is in focus, loses that focus."

	self document scriptGenerator
		event: 'blur'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onChange: anObject [
	"The onchange event occurs when a select input element has a selection made or when a text input element has a change in the text."

	self document scriptGenerator
		event: 'change'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onClick: anObject [
	"The onclick event occurs when the pointing device button is clicked over an element."

	self document scriptGenerator
		event: 'click'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onDoubleClick: anObject [
	"The ondblclick event occurs when the pointing device button is double clicked over an element."

	self document scriptGenerator
		event: 'dblclick'
		do: anObject
		on: self
]

{ #category : #convenience }
WATagBrush >> onError: anObject [
	"The error event occurs when an image does not load properly or when an error occurs during script execution."

	self document scriptGenerator
		event: 'error'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onFocus: anObject [
	"The onfocus event occurs when an element receives focus either by the pointing device or by tabbing navigation."

	self document scriptGenerator
		event: 'focus'
		do: anObject
		on: self
]

{ #category : #convenience }
WATagBrush >> onInput: anObject [
	"Any element that accepts an onchange attribute to handle change events shall also accept an oninput  attribute to handle input events, except the output element (for which it would make no sense)."

	self document scriptGenerator
		event: 'input'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onKeyDown: anObject [
	"The onkeydown event occurs when a key is pressed down over an element."

	self document scriptGenerator
		event: 'keydown'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onKeyPress: anObject [
	"The onkeypress event occurs when a key is pressed and released over an element."

	self document scriptGenerator
		event: 'keypress'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onKeyUp: anObject [
	"The onkeyup event occurs when a key is released over an element."

	self document scriptGenerator
		event: 'keyup'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onLoad: anObject [
	"The onload event occurs when the user agent finishes loading a window."

	self document scriptGenerator
		event: 'load'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onMouseDown: anObject [
	"The onmousedown event occurs when the pointing device button is pressed over an element."

	self document scriptGenerator
		event: 'mousedown'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onMouseMove: anObject [
	"The onmousemove event occurs when the pointing device is moved while it is over an element."

	self document scriptGenerator
		event: 'mousemove'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onMouseOut: anObject [
	"The onmouseout event occurs when the pointing device is moved away from an element."

	self document scriptGenerator
		event: 'mouseout'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onMouseOver: anObject [
	"The onmouseover event occurs when the pointing device is moved onto an element."

	self document scriptGenerator
		event: 'mouseover'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onMouseUp: anObject [
	"The onmouseup event occurs when the pointing device button is released over an element."

	self document scriptGenerator
		event: 'mouseup'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onReset: anObject [
	"The onreset event occurs when a form is reset."

	self document scriptGenerator
		event: 'reset'
		do: anObject
		on: self
]

{ #category : #convenience }
WATagBrush >> onResize: anObject [
	"The resize event occurs when a document view is resized. "

	self document scriptGenerator
		event: 'resize'
		do: anObject
		on: self
]

{ #category : #convenience }
WATagBrush >> onScroll: anObject [
	"The scroll event occurs when a document view is scrolled. "

	self document scriptGenerator
		event: 'scroll'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onSelect: anObject [
	"The onselect event occurs when a user selects some text in a text field."

	self document scriptGenerator
		event: 'select'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onSubmit: anObject [
	"The onsubmit event occurs when a form is submitted."

	self document scriptGenerator
		event: 'submit'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WATagBrush >> onUnload: anObject [
	"The onunload event occurs when the user agent removes a document from a window."

	self document scriptGenerator
		event: 'unload'
		do: anObject
		on: self
]

{ #category : #private }
WATagBrush >> openTag [
	"Open the receiving and all associated attributes onto the document."

	self document openTag: self tag attributes: attributes closed: self isClosed
]

{ #category : #attributes }
WATagBrush >> required [
	"supported on:
	- Opera 9"
	self attributeAt: 'required' put: true
]

{ #category : #private }
WATagBrush >> storeCallback: aCallback [
	^ canvas callbacks store: aCallback
]

{ #category : #'attributes-core' }
WATagBrush >> style: aString [
	"This attribute offers optional CSS style information. The attribute is deprecated and should be avoided in favor of an external stylesheet. Multiple styles might be added to one brush."

	self attributes addStyle: aString
]

{ #category : #'attributes-keyboard' }
WATagBrush >> tabIndex: aString [
	"This attribute specifies the position of the current element in the tabbing order for the current document. This value must be a number between 0 and 32767.

	The tabbing order defines the order in which elements will receive focus when navigated by the user via the keyboard. The tabbing order may include elements nested within other elements.

	The following elements support the tabindex attribute: A, AREA, BUTTON, INPUT, OBJECT, SELECT, and TEXTAREA."

	self attributes at: 'tabindex' put: aString
]

{ #category : #accessing }
WATagBrush >> tag [
	self subclassResponsibility
]

{ #category : #'attributes-core' }
WATagBrush >> title: aString [
	"This attribute offers advisory information about the element for which it is set. Visual browsers frequently display the title as a 'tool tip'."

	self attributes at: 'title' put: aString
]

{ #category : #public }
WATagBrush >> with: anObject [
	"Render anObject into the receiver. Make sure that you call #with: last in the cascade, as this method will serialize the tag onto the output document."

	self openTag.
	super with: [
		self before.
		canvas render: anObject.
		self after ].
	self isClosed
		ifFalse: [ self closeTag ]
]

{ #category : #convenience }
WATagBrush >> withLineBreaks: aString [
	"Renders text preserving line breaks."

	self with: [ canvas withLineBreaks: aString ]
]
