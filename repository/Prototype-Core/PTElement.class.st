"
The Element object sports a flurry of powerful DOM methods which you can access either as methods of Element (but that's rather old-fashioned now) or directly as methods of an extended element (thanks to Element.extend for that added bit of syntactic sugar).
"
Class {
	#name : #PTElement,
	#superclass : #PTObject,
	#instVars : [
		'id'
	],
	#category : 'Prototype-Core-Elements'
}

{ #category : #geometric }
PTElement >> absolutize [
	"Turns element into an absolutely-positioned element without changing its position in the page layout."
	
	self call: 'absolutize'
]

{ #category : #'styling-classes' }
PTElement >> addClassName: aString [ 
	"Adds a CSS class to element."
	
	self call: 'addClassName' with: aString
]

{ #category : #enumerating }
PTElement >> adjacent [
	"Finds all siblings of the current element."

	^ self call: 'adjacent'; enumerator
]

{ #category : #enumerating }
PTElement >> adjacent: aString [
	"Finds all siblings of the current element that match the given selector(s)."

	^ self call: 'adjacent' with: aString; enumerator
]

{ #category : #enumerating }
PTElement >> ancestors [
	"Collects all of element's ancestors and returns them as an array of extended elements."

	^ self call: 'ancestors'; enumerator
]

{ #category : #elements }
PTElement >> body [
	self id: (JSStream on: 'document.body')
]

{ #category : #enumerating }
PTElement >> childElements [
	"Collects all of the element's immediate descendants (i.e. children) and returns them as an array of extended elements."

	^ self call: 'childElements'; enumerator
]

{ #category : #displaying }
PTElement >> cleanWhitespace [
	"Removes all of element's text nodes which contain only whitespace."

	self call: 'cleanWhitespace'
]

{ #category : #geometric }
PTElement >> clonePosition: anElement [ 
	"Clones the position and/or dimensions of source onto element as defined by the optional argument options."

	self call: 'clonePosition' with: anElement
]

{ #category : #geometric }
PTElement >> cumulativeOffset [
	"Returns the offsets of element from the top left corner of the document."

	self call: 'cumulativeOffset'
]

{ #category : #geometric }
PTElement >> cumulativeScrollOffset [
	"Calculates the cumulative scroll offset of an element in nested scrolling containers."

	self call: 'cumulativeScrollOffset'
]

{ #category : #querying }
PTElement >> descendantOf: anElement [ 
	"Checks if element is a descendant of ancestor."
	
	self call: 'descendantOf' with: anElement
]

{ #category : #enumerating }
PTElement >> descendants [
	"Collects all of element's descendants and returns them as an array of extended elements."

	^ self call: 'descendants'; enumerator
]

{ #category : #geometric }
PTElement >> dimensions [
	"Finds the computed width and height of element and returns them as key/value pairs of an object."

	self call: 'getDimensions'
]

{ #category : #elements }
PTElement >> document [
	self id: (JSStream on: 'document')
]

{ #category : #navigation }
PTElement >> down [
	self down: nil at: nil
]

{ #category : #navigation }
PTElement >> down: aString [
	self down: aString at: nil
]

{ #category : #navigation }
PTElement >> down: aString at: anInteger [ 
	"Returns element's first descendant (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all descendants are considered. If no descendant matches these criteria, undefined is returned."
	
	self call: 'down' withArguments: (self rule: aString at: anInteger)
]

{ #category : #deprecated }
PTElement >> elementsByClassName: aString [ 
	"Fetches all of element's descendants which have a CSS class of className and returns them as an array of extended elements."
	self 
		greaseDeprecatedApi: 'PTElement>>#elementsByClassName:'
		details: 'As of Prototype 1.6, #elementsByClassName: has been deprecated in favor of the more concise #select:.'.
	^ self
		call: 'getElementsByClassName'
			with: aString;
		enumerator
]

{ #category : #deprecated }
PTElement >> elementsBySelector: aString [ 
	"Takes an arbitrary number of CSS selectors (strings) and returns a document-order array of extended children of element that match any of them."
	self 
		greaseDeprecatedApi: 'PTElement>>#elementsBySelector:'
		details: 'As of Prototype 1.6, #elementsBySelector: has been deprecated in favor of the more concise #select:.'.
	^ self
		call: 'getElementsBySelector'
			with: aString;
		enumerator
]

{ #category : #querying }
PTElement >> empty [
	"Tests whether element is empty (i.e. contains only whitespace)."

	self call: 'empty'
]

{ #category : #events }
PTElement >> fire: aString [ 
	"Fires a custom event with the current element as its target."
	
	self call: 'fire' with: aString
]

{ #category : #events }
PTElement >> fire: aString with: anObject [ 
	"Fires a custom event with the current element as its target."
	
	self call: 'fire' with: aString with: anObject
]

{ #category : #querying }
PTElement >> firstDescendant [
	"Returns the first child that is an element. This is opposed to firstChild DOM property which will return any node (whitespace in most usual cases)."

	self call: 'firstDescendant'
]

{ #category : #'styling-classes' }
PTElement >> hasClassName: aString [ 
	"Checks whether element has the given CSS className."
	
	self call: 'hasClassName' with: aString
]

{ #category : #elements }
PTElement >> head [
	self id: (JSStream on: 'document.head')
]

{ #category : #geometric }
PTElement >> height [
	"Finds and returns the computed height of element."

	self call: 'getHeight'
]

{ #category : #displaying }
PTElement >> hide [
	"Hides and returns element."

	self call: 'hide'
]

{ #category : #accessing }
PTElement >> id [
	^ id ifNil: [ JSStream on: 'this' ]
]

{ #category : #accessing }
PTElement >> id: aString [
	id := aString
]

{ #category : #querying }
PTElement >> identify [
	"Returns element's id attribute if it exists, or sets and returns a unique, auto-generated id."

	self call: 'identify'
]

{ #category : #deprecated }
PTElement >> immediateDescendants [
	"Collects all of the element's immediate descendants (i.e. children) and returns them as an array of extended elements."
	self 
		greaseDeprecatedApi: 'PTElement>>#immediateDescendants'
		details: 'As of Prototype 1.6, #immediateDescendants has been deprecated in favor of the more concise #childElements.'.
	^ self
		call: 'immediateDescendants';
		enumerator
]

{ #category : #modifying }
PTElement >> insert: anObject [ 
	"Inserts content before, after, at the top of, or at the bottom of element, as specified by the position property of the argument. If the argument is the content itself, insert will append it to element."
	
	self call: 'insert' with: (self render: anObject)
]

{ #category : #modifying }
PTElement >> insert: anObject position: aString [ 
	"Inserts anObject before, after, at the top of, or at the bottom of element."
	
	self call: 'insert' with: (Dictionary new 
		at: aString put: (self render: anObject); 
		yourself)
]

{ #category : #modifying }
PTElement >> insertAfter: anObject [
	self insert: anObject position: 'after'
]

{ #category : #modifying }
PTElement >> insertBefore: anObject [
	self insert: anObject position: 'before'
]

{ #category : #modifying }
PTElement >> insertBottom: anObject [
	self insert: anObject position: 'bottom'
]

{ #category : #modifying }
PTElement >> insertTop: anObject [
	self insert: anObject position: 'top'
]

{ #category : #printing }
PTElement >> javascriptContentOn: aStream [
	aStream nextPut: $$.
	JSStream encodeArguments: (Array with: self id) on: aStream
]

{ #category : #geometric }
PTElement >> makeClipping [
	"Simulates the poorly supported CSS clip property by setting element's overflow value to 'hidden'. Returns element."

	self call: 'makeClipping'
]

{ #category : #geometric }
PTElement >> makePositioned [
	"Allows for the easy creation of CSS containing block by setting element's CSS position to 'relative' if its initial position is either 'static' or undefined. Returns element."

	self call: 'makePositioned'
]

{ #category : #querying }
PTElement >> match: aString [ 
	"Checks if element matches the given CSS selector."
	
	self call: 'match' with: aString
]

{ #category : #navigation }
PTElement >> next [
	self next: nil at: nil
]

{ #category : #navigation }
PTElement >> next: aString [
	self next: aString at: nil
]

{ #category : #navigation }
PTElement >> next: aString at: anInteger [ 
	"Returns element's following sibling (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all following siblings are considered. If no following sibling matches these criteria, undefined is returned."
	
	self call: 'next' withArguments: (self rule: aString at: anInteger)
]

{ #category : #enumerating }
PTElement >> nextSiblings [
	"Collects all of element's next siblings and returns them as an array of extended elements."

	^ self call: 'nextSiblings'; enumerator
]

{ #category : #geometric }
PTElement >> offsetParent [
	"Returns element's closest positioned ancestor. If none is found, the body element is returned."

	self call: 'getOffsetParent'
]

{ #category : #events }
PTElement >> on: aString do: aHandlerObject [ 
	"Register the handler aBlock for the event aString on the receiving DOM element. Please refer to SUEvent>>#observe:on:do: for further information."
	
	self call: 'observe' with: aString with: (aHandlerObject asFunction: #('event'))
]

{ #category : #displaying }
PTElement >> opacity: aFloat [
	"Sets the visual opacity of an element while working around inconsistencies in various browsers. The opacity argument should be a floating point number, where the value of 0 is fully transparent and 1 is fully opaque."
	
	self call: 'setOpacity' with: aFloat
]

{ #category : #geometric }
PTElement >> positionedOffset [
	"Returns element's offset relative to its closest positioned ancestor (the element that would be returned by #offsetParent)."

	self call: 'positionedOffset'
]

{ #category : #navigation }
PTElement >> previous [
	self previous: nil at: nil
]

{ #category : #navigation }
PTElement >> previous: aString [
	self previous: aString at: nil
]

{ #category : #navigation }
PTElement >> previous: aString at: anInteger [ 
	"Returns element's previous sibling (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all previous siblings are considered. If no previous sibling matches these criteria, undefined is returned."
	
	self call: 'previous' withArguments: (self rule: aString at: anInteger)
]

{ #category : #enumerating }
PTElement >> previousSiblings [
	"Collects all of element's previous siblings and returns them as an array of extended elements."

	^ self call: 'previousSiblings'; enumerator
]

{ #category : #attributes }
PTElement >> readAttribute: aString [ 
	"Answer the value of element's attribute or null if attribute has not been specified."
	
	self call: 'readAttribute' with: aString
]

{ #category : #enumerating }
PTElement >> recursivelyCollect: aString [ 
	"Recursively collects elements whose relationship is specified by aString. aString has to be a property of element that points to a single DOM node. Returns an array of extended elements."
	
	^ self call: 'recursivelyCollect' with: aString; enumerator
]

{ #category : #geometric }
PTElement >> relativize [
	"Turns element into an relatively-positioned element without changing its position in the page layout."
	
	self call: 'relativize'
]

{ #category : #modifying }
PTElement >> remove [
	"Completely removes element from the document and returns it."

	self call: 'remove'
]

{ #category : #attributes }
PTElement >> removeAttribute: aString [
	"Remove attribute aString."
	
	self writeAttribute: aString value: nil
]

{ #category : #'styling-classes' }
PTElement >> removeClassName: aString [ 
	"Removes element's CSS className and returns element."
	
	self call: 'removeClassName' with: aString
]

{ #category : #modifying }
PTElement >> replace: anObject [ 
	"Replaces element by the content of the html argument and returns the removed element."
	
	self call: 'replace' with: (self render: anObject)
]

{ #category : #private }
PTElement >> rule: aString at: anInteger [
	^ Array streamContents: [ :stream |
		(aString isNil or: [ aString isEmpty ])
			ifFalse: [ stream nextPut: aString ].
		(anInteger isNil or: [ anInteger isZero ])
			ifFalse: [ stream nextPut: anInteger ] ]
]

{ #category : #displaying }
PTElement >> scroll [
	"Scrolls the window so that element appears at the top of the viewport."

	self call: 'scrollTo'
]

{ #category : #enumerating }
PTElement >> select: aString [ 
	"Takes a CSS selector and returns an enumerable of extended descendants of element that match aString."
	
	^ self call: 'select' with: aString; enumerator
]

{ #category : #displaying }
PTElement >> show [
	"Displays and returns element."

	self call: 'show'
]

{ #category : #enumerating }
PTElement >> siblings [
	"Collects all of element's siblings and returns them as an array of extended elements."

	^ self call: 'siblings'; enumerator
]

{ #category : #'styling-styles' }
PTElement >> style: aDictionary [ 
	"Modifies element's CSS style properties. Styles are passed as a hash of property-value pairs in which the properties are specified in their camelized form."
	
	self call: 'setStyle' with: aDictionary
]

{ #category : #'styling-styles' }
PTElement >> styleAt: aString [ 
	"Returns the given CSS property value of element. property can be specified in either of its CSS or camelized form."
	
	self call: 'getStyle' with: aString
]

{ #category : #'styling-styles' }
PTElement >> styleAt: aPropertyString put: anObject [
	"Modifies element's CSS style properties. Styles are passed as a hash of property-value pairs in which the properties are specified in their camelized form."

	self style: (Dictionary new
		at: aPropertyString put: anObject;
		yourself)
]

{ #category : #displaying }
PTElement >> toggle [
	"Toggles the visibility of element."

	self call: 'toggle'
]

{ #category : #'styling-classes' }
PTElement >> toggleClassName: aString [ 
	"Toggles element's CSS className and returns element."
	
	self call: 'toggleClassName' with: aString
]

{ #category : #geometric }
PTElement >> undoClipping [
	"Sets element's CSS overflow property back to the value it had before Element.makeClipping() was applied. Returns element."

	self call: 'undoClipping'
]

{ #category : #geometric }
PTElement >> undoPositioned [
	"Sets element back to the state it was before Element.makePositioned was applied to it. Returns element."

	self call: 'undoPositioned'
]

{ #category : #navigation }
PTElement >> up [
	self up: nil at: nil
]

{ #category : #navigation }
PTElement >> up: aString [
	self up: aString at: nil
]

{ #category : #navigation }
PTElement >> up: aString at: anInteger [ 
	"Returns element's first ancestor (or the index anInteger-th one, if anInteger is specified) that matches the css rule aString. If no aString is provided, all ancestors are considered. If no ancestor matches these criteria, undefined is returned."

	self call: 'up' withArguments: (self rule: aString at: anInteger)
]

{ #category : #modifying }
PTElement >> update: anObject [ 
	"Replaces the content of element with the provided newContent argument and returns element."
	
	self call: 'update' with: (self render: anObject)
]

{ #category : #geometric }
PTElement >> viewportOffset [
	"Returns the X/Y coordinates of element relative to the viewport."

	self call: 'viewportOffset'
]

{ #category : #displaying }
PTElement >> visible [
	"Returns a Boolean indicating whether or not element is visible (i.e. whether its inline style property is set to display: none;)"

	self call: 'visible'
]

{ #category : #geometric }
PTElement >> width [
	"Finds and returns the computed width of element."

	self call: 'getWidth'
]

{ #category : #modifying }
PTElement >> wrap: aString [
	"Wraps an element inside another, then returns the wrapper."

	self wrap: aString attributes: Dictionary new
]

{ #category : #modifying }
PTElement >> wrap: aString attributes: aDictionary [ 
	"Wraps an element inside another, then returns the wrapper."
	
	self call: 'wrap' with: aString with: aDictionary
]

{ #category : #attributes }
PTElement >> writeAttribute: aString value: anObject [ 
	"Add or replace attribute aString with anObject."
	
	self call: 'writeAttribute' with: aString with: anObject
]
