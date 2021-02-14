Class {
	#name : #JQueryInstance,
	#superclass : #JQuery,
	#instVars : [
		'arguments'
	],
	#category : 'JQuery-Core-Objects'
}

{ #category : #'instance creation' }
JQueryInstance class >> context: aRenderContext constructor: anArray [
	^ (self context: aRenderContext) setArguments: anArray
]

{ #category : #navigation }
JQueryInstance >> add: anObject [
	"Add elements to the set of matched elements."
	
	self call: 'add' with: anObject
]

{ #category : #navigation }
JQueryInstance >> add: anObject context: aContext [
	"Add elements to the set of matched elements rooted against the specified context."
	
	self call: 'add' with: anObject with: aContext
]

{ #category : #chaining }
JQueryInstance >> addBack [
	"Add the previous set of elements on the stack to the current set."
	self call: 'addBack'
]

{ #category : #classes }
JQueryInstance >> addClass: aString [
	"Adds the specified class(es) to each of the set of matched elements."
	
	self call: 'addClass' with: aString
]

{ #category : #modifying }
JQueryInstance >> after: aRenderable [ 
	"Insert content, specified by the parameter, after each element in the set of matched elements."
	
	self call: 'after' with: (self render: aRenderable)
]

{ #category : #effects }
JQueryInstance >> animate [
	"Perform a custom animation of a set of CSS properties."
	
	^ self create: JQAnimate
]

{ #category : #modifying }
JQueryInstance >> append: aRenderable [ 
	"Insert content, specified by the parameter, to the end of each element in the set of matched elements."
	
	self call: 'append' with: (self render: aRenderable)
]

{ #category : #modifying }
JQueryInstance >> appendTo: anObject [ 
	"Insert every element in the set of matched elements to the end of the target."
	
	self call: 'appendTo' with: anObject
]

{ #category : #'accessors-smalltalk' }
JQueryInstance >> at: anInteger [
	"Access a single matched DOM element at a specified index in the matched set."
	
	self get: anInteger
]

{ #category : #'accessors-smalltalk' }
JQueryInstance >> atAll [
	"Access all matched DOM elements."
	
	self get
]

{ #category : #attributes }
JQueryInstance >> attributeAt: aKey [ 
	"Get the value of an attribute for the first element in the set of matched elements."

	self call: 'attr' with: aKey
]

{ #category : #attributes }
JQueryInstance >> attributeAt: aKey put: aValue [
	"Set an attribute for the set of matched elements."
	
	self call: 'attr' with: aKey with: aValue
]

{ #category : #attributes }
JQueryInstance >> attributes: aDictionary [ 
	"Set one or more attributes for the set of matched elements."
	
	self call: 'attr' with: aDictionary
]

{ #category : #modifying }
JQueryInstance >> before: aRenderable [ 
	"Insert content, specified by the parameter, before each element in the set of matched elements."
	
	self call: 'before' with: (self render: aRenderable)
]

{ #category : #events }
JQueryInstance >> bind: aString data: aDataObject  do: anObject [

	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'bind' with: aString with: aDataObject with: anObject asFunction
]

{ #category : #events }
JQueryInstance >> bind: aString do: anObject [ 

	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'bind' with: aString with: anObject asFunction
]

{ #category : #navigation }
JQueryInstance >> children [
	"Get the children of each element in the set of matched elements."
	
	self call: 'children'
]

{ #category : #navigation }
JQueryInstance >> children: aString [
	"Get the children of each element in the set of matched elements filtered by a selector."
	
	self call: 'children' with: aString
]

{ #category : #effects }
JQueryInstance >> clearQueue [
	"Remove from the queue all items that have not yet been run.Remove from the queue all items that have not yet been run."
	
	self call: 'clearQueue'
]

{ #category : #effects }
JQueryInstance >> clearQueue: aString [
	"Remove from the queue all items that have not yet been run.Remove from the queue all items that have not yet been run."
	
	self call: 'clearQueue' with: aString
]

{ #category : #copying }
JQueryInstance >> clone [
	"Create a copy of the set of matched elements."
	
	self call: 'clone'
]

{ #category : #copying }
JQueryInstance >> cloneAll [
	"Create a copy of the set of matched elements."
	
	self call: 'clone' with: true
]

{ #category : #navigation }
JQueryInstance >> closest [
	"Get the first element that matches the selector, beginning at the current element and progressing up through the DOM tree."
	
	self call: 'closest'
]

{ #category : #navigation }
JQueryInstance >> closest: aString [
	"Get the first element that matches the selector, beginning at the current element and progressing up through the DOM tree."
	
	self call: 'closest' with: aString
]

{ #category : #'accessors-smalltalk' }
JQueryInstance >> collect: anObject [
	"Translate a set of elements in the jQuery object into another set of values in an array (which may, or may not, be elements)."
	
	self map: (self iteratorFor: anObject return: true)
]

{ #category : #navigation }
JQueryInstance >> contents [
	"Get the children of each element in the set of matched elements, including text nodes."
	
	self call: 'contents'
]

{ #category : #css }
JQueryInstance >> css: aDictionary [
	"Set one or more CSS properties for the set of matched elements."
	
	self call: 'css' with: aDictionary
]

{ #category : #css }
JQueryInstance >> cssAt: aKey [
	"Get the value of a style property for the first element in the set of matched elements."
	
	self call: 'css' with: aKey
]

{ #category : #css }
JQueryInstance >> cssAt: aKey put: aValue [
	"Set one or more CSS properties for the set of matched elements."
	
	self call: 'css' with: aKey with: aValue
]

{ #category : #data }
JQueryInstance >> dataAt: anObject [
	"Store arbitrary data associated with the matched elements."
	
	self call: 'data' with: anObject
]

{ #category : #data }
JQueryInstance >> dataAt: aKey put: aValue [
	"Store arbitrary data associated with the matched elements."
	
	self call: 'data' with: aKey with: aValue
]

{ #category : #effects }
JQueryInstance >> delay: aDuration [ 
	"Set a timer to delay execution of subsequent items in the queue."
	
	self call: 'delay' with: aDuration
]

{ #category : #effects }
JQueryInstance >> delay: aDuration queue: aString [
	"Set a timer to delay execution of subsequent items in the queue."
	
	self call: 'delay' with: aDuration with: aString
]

{ #category : #events }
JQueryInstance >> delegate: aSelectorString on: anEventString data: aDataObject do: aHandlerObject [
	"Attach a handler to the event anEventString for all elements which match the selector aSelectorString, now or in the future, based upon a specific set of root elements."
	
	self call: 'delegate' withArguments: (Array with: aSelectorString with: anEventString with: aDataObject with: aHandlerObject asFunction)
]

{ #category : #events }
JQueryInstance >> delegate: aSelectorString on: anEventString do: aHandlerObject [
	"Attach a handler to the event anEventString for all elements which match the selector aSelectorString, now or in the future, based upon a specific set of root elements."
	
	self call: 'delegate' withArguments: (Array with: aSelectorString with: anEventString with: aHandlerObject asFunction)
]

{ #category : #data }
JQueryInstance >> dequeue [
	"Execute the next function on the queue for the matched elements."
	
	self call: 'dequeue'
]

{ #category : #data }
JQueryInstance >> dequeue: aString [
	"Execute the next function on the queue for the matched elements."
	
	self call: 'dequeue' with: aString
]

{ #category : #modifying }
JQueryInstance >> detach [
	"Remove the set of matched elements from the DOM."
	
	self call: 'detach'
]

{ #category : #modifying }
JQueryInstance >> detach: aString [ 
	"Remove the set of matched elements from the DOM."
	
	self call: 'detach' with: aString
]

{ #category : #'accessors-smalltalk' }
JQueryInstance >> do: anObject [
	"Iterate over a jQuery object, executing a function for each matched element."
	
	self each: (self iteratorFor: anObject return: false)
]

{ #category : #accessors }
JQueryInstance >> each: anObject [
	"Iterate over a jQuery object, executing a function for each matched element."
	
	self call: 'each' with: anObject asFunction
]

{ #category : #modifying }
JQueryInstance >> empty [
	"Remove all child nodes of the set of matched elements from the DOM."
	
	self call: 'empty'
]

{ #category : #chaining }
JQueryInstance >> end [
	"End the most recent filtering operation in the current chain and return the set of matched elements to its previous state."
	
	self call: 'end'
]

{ #category : #accessors }
JQueryInstance >> eq: anInteger [
	"Reduce the set of matched elements to the one at the specified index."
	
	self call: 'eq' with: anInteger
]

{ #category : #effects }
JQueryInstance >> fade: aDuration to: anNumber [
	"Adjust the opacity of the matched elements."
	
	self call: 'fadeTo' with: aDuration with: anNumber
]

{ #category : #effects }
JQueryInstance >> fade: aDuration to: anNumber callback: anObject [
	"Adjust the opacity of the matched elements."
	
	self call: 'fadeTo' with: aDuration with: anNumber with: anObject asFunction
]

{ #category : #effects }
JQueryInstance >> fadeIn: aDuration [
	"Display the matched elements by fading them to opaque."
	
	self call: 'fadeIn' with: aDuration
]

{ #category : #effects }
JQueryInstance >> fadeIn: aDuration callback: anObject [
	"Display the matched elements by fading them to opaque."
	
	self call: 'fadeIn' with: aDuration with: anObject asFunction
]

{ #category : #effects }
JQueryInstance >> fadeOut: aDuration [
	"Hide the matched elements by fading them to transparent."
	
	self call: 'fadeOut' with: aDuration
]

{ #category : #effects }
JQueryInstance >> fadeOut: aDuration callback: anObject [
	"Hide the matched elements by fading them to transparent."
	
	self call: 'fadeOut' with: aDuration with: anObject asFunction
]

{ #category : #effects }
JQueryInstance >> fadeToggle: aDuration [
	"Display or hide the matched elements by animating their opacity."
	
	self call: 'fadeToggle' with: aDuration
]

{ #category : #effects }
JQueryInstance >> fadeToggle: aDuration callback: anObject [
	"Display or hide the matched elements by animating their opacity."
	
	self call: 'fadeToggle' with: aDuration with: anObject asFunction
]

{ #category : #filtering }
JQueryInstance >> filter: aString [
	"Reduce the set of matched elements to the one at the specified index."
	
	self call: 'filter' with: aString
]

{ #category : #navigation }
JQueryInstance >> find: aString [
	"Get the descendants of each element in the current set of matched elements, filtered by a selector."
	
	self call: 'find' with: aString
]

{ #category : #filtering }
JQueryInstance >> first [
	"Reduce the set of matched elements to the first in the set."
	
	self call: 'first'
]

{ #category : #accessors }
JQueryInstance >> get [
	"Retrieve the DOM elements matched by the jQuery object."
	
	self call: 'get'
]

{ #category : #accessors }
JQueryInstance >> get: anInteger [
	"Retrieve the DOM elements matched by the jQuery object."
	
	self call: 'get' with: anInteger
]

{ #category : #filtering }
JQueryInstance >> has: aString [
	"Check to see if a DOM node, or selector set of DOM elements, is within another DOM node."
	
	self call: 'has' with: aString
]

{ #category : #classes }
JQueryInstance >> hasClass: aString [ 
	"Determine whether any of the matched elements are assigned the given class."
	
	self call: 'hasClass' with: aString
]

{ #category : #css }
JQueryInstance >> height [
	"Get the current computed height for the first element in the set of matched elements."
	
	self call: 'height'
]

{ #category : #css }
JQueryInstance >> height: anInteger [
	"Set the CSS height of every matched element."
	
	self call: 'height' with: anInteger
]

{ #category : #effects }
JQueryInstance >> hide [ 
	"Hide the matched elements."
	
	self call: 'hide'
]

{ #category : #effects }
JQueryInstance >> hide: aDuration [ 
	"Hide the matched elements."
	
	self call: 'hide' with: aDuration
]

{ #category : #effects }
JQueryInstance >> hide: aDuration callback: anObject [
	"Hide the matched elements."
	
	self call: 'hide' with: aDuration with: anObject asFunction
]

{ #category : #events }
JQueryInstance >> hover: anInObject out: anOutObject [
	"Bind two handlers to the matched elements, to be executed when the mouse pointer enters and leaves the elements."
	
	self call: 'hover' with: anInObject asFunction with: anOutObject asFunction
]

{ #category : #manipulating }
JQueryInstance >> html [
	"Get the HTML contents of the first element in the set of matched elements."
	
	self call: 'html'
]

{ #category : #manipulating }
JQueryInstance >> html: aRenderable [ 
	"Set the HTML contents of matched elements."
	
	self call: 'html' with: (self render: aRenderable)
]

{ #category : #private }
JQueryInstance >> id: aString [
	self setArguments: (Array with: '#' , aString)
]

{ #category : #accessors }
JQueryInstance >> index [
	"Answer an integer indicating the position of the first element within the jQuery object relative to its sibling elements."
	
	self call: 'index'
]

{ #category : #accessors }
JQueryInstance >> index: anObject [
	"Search for a given element from among the matched elements."
	
	self call: 'index' with: anObject
]

{ #category : #css }
JQueryInstance >> innerHeight [
	"Get the current computed height for the first element in the set of matched elements, including padding but not border."
	
	self call: 'innerHeight'
]

{ #category : #css }
JQueryInstance >> innerWidth [
	"Get the current computed width for the first element in the set of matched elements, including padding but not border."
	
	self call: 'innerWidth'
]

{ #category : #modifying }
JQueryInstance >> insertAfter: anObject [ 
	"Insert every element in the set of matched elements after the target."
	
	self call: 'insertAfter' with: anObject
]

{ #category : #modifying }
JQueryInstance >> insertBefore: anObject [ 
	"Insert every element in the set of matched elements before the target."
	
	self call: 'insertBefore' with: anObject
]

{ #category : #filtering }
JQueryInstance >> is: aString [
	"Check the current matched set of elements against a selector and return true if at least one of these elements matches the selector."
	
	self call: 'is' with: aString
]

{ #category : #private }
JQueryInstance >> iteratorFor: anObject return: aBoolean [
	| this |
	anObject isBlock
		ifFalse: [ ^ anObject asFunction return: true ].
	this := (JQueryClass context: self renderContext)
			rendererClass: self rendererClass;
			this.
	anObject argumentCount = 1
		ifTrue: [ anObject value: this ]
		ifFalse: [ anObject value: this value: (JSStream argument: 0) ].
	^ this asFunction return: aBoolean
]

{ #category : #printing }
JQueryInstance >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	JSStream encodeArguments: arguments on: aStream
]

{ #category : #filtering }
JQueryInstance >> last [
	"Reduce the set of matched elements to the final one in the set."
	
	self call: 'last'
]

{ #category : #private }
JQueryInstance >> length [
	"Return the number of DOM elements matched by the jQuery object."
	
	self access: 'length'
]

{ #category : #ajax }
JQueryInstance >> load [
	"Load data from the server and place the returned HTML into the matched element."
	
	^ self create: JQLoad
]

{ #category : #accessors }
JQueryInstance >> map: anObject [
	"Pass each element in the current matched set through a function, producing a new jQuery object containing the return values.."
	
	self call: 'map' with: anObject asFunction
]

{ #category : #navigation }
JQueryInstance >> next [
	"Get the immediately following sibling of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'next'
]

{ #category : #navigation }
JQueryInstance >> next: aString [
	"Get the immediately following sibling of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'next' with: aString
]

{ #category : #navigation }
JQueryInstance >> nextAll [
	"Get all following siblings of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'nextAll'
]

{ #category : #navigation }
JQueryInstance >> nextAll: aString [
	"Get all following siblings of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'nextAll' with: aString
]

{ #category : #navigation }
JQueryInstance >> nextUntil: aString [
	"Get all following siblings of each element up to but not including the element matched by the selector."
	
	self call: 'nextUntil' with: aString
]

{ #category : #filtering }
JQueryInstance >> not: aString [
	"Remove elements from the set of matched elements."
	
	self call: 'not' with: aString
]

{ #category : #events }
JQueryInstance >> off: aString [
	"Remove an event handler."
	
	self call: 'off' with: aString
]

{ #category : #events }
JQueryInstance >> off: aString selector: aSelector [
	"Remove an event handler."
	
	self call: 'off' with: aString with: aSelector
]

{ #category : #css }
JQueryInstance >> offset [
	"Get the current coordinates of the first element in the set of matched elements, relative to the document."
	
	self call: 'offset'
]

{ #category : #css }
JQueryInstance >> offsetLeft [
	"Get the current left offset of the first matched element relative to the viewport."
	
	self call: 'offset'; access: 'left'
]

{ #category : #css }
JQueryInstance >> offsetParent [
	"Get the closest ancestor element that is positioned."
	
	self call: 'offsetParent'
]

{ #category : #css }
JQueryInstance >> offsetTop [
	"Get the current top offset of the first matched element relative to the viewport."
	
	self call: 'offset'; access: 'top'
]

{ #category : #events }
JQueryInstance >> on: aString do: anObject [
	"Attach an event handler function for one or more events to the selected elements."
	
	self call: 'on' with: aString with: anObject asFunction
]

{ #category : #events }
JQueryInstance >> on: aString selector: aSelector do: anObject [
	"Attach an event handler function for one or more events to the selected elements."
	
	self call: 'on' with: aString with: aSelector with: anObject asFunction
]

{ #category : #'ajax-events' }
JQueryInstance >> onAjaxComplete: anObject [
	"Register a handler to be called when Ajax requests complete."
	
	self call: 'ajaxComplete' with: anObject asFunction
]

{ #category : #'ajax-events' }
JQueryInstance >> onAjaxError: anObject [
	"Register a handler to be called when Ajax requests complete with an error."
	
	self call: 'ajaxError' with: anObject asFunction
]

{ #category : #'ajax-events' }
JQueryInstance >> onAjaxSend: anObject [
	"Show a message before an Ajax request is sent."
	
	self call: 'ajaxSend' with: anObject asFunction
]

{ #category : #'ajax-events' }
JQueryInstance >> onAjaxStart: anObject [
	"Register a handler to be called when the first Ajax request begins."
	
	self call: 'ajaxStart' with: anObject asFunction
]

{ #category : #'ajax-events' }
JQueryInstance >> onAjaxStop: anObject [
	"Hide a loading message after all the Ajax requests have stopped."
	
	self call: 'ajaxStop' with: anObject asFunction
]

{ #category : #'ajax-events' }
JQueryInstance >> onAjaxSuccess: anObject [
	"Show a message when an Ajax request completes successfully."
	
	self call: 'ajaxSuccess' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onBlur: anObject [
	"Bind an event handler to the 'blur' JavaScript event, or trigger that event on an element."
	
	self call: 'blur' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onChange: anObject [
	"Bind an event handler to the 'change' JavaScript event, or trigger that event on an element."
	
	self call: 'change' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onClick: anObject [
	"Bind an event handler to the 'click' JavaScript event, or trigger that event on an element."
	
	self call: 'click' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onDoubleClick: anObject [
	"Bind an event handler to the 'dblclick' JavaScript event, or trigger that event on an element."
	
	self call: 'dblclick' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onError: anObject [
	"Bind an event handler to the 'error' JavaScript event."
	
	self on: 'error' do: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onFocus: anObject [
	"Bind an event handler to the 'focus' JavaScript event, or trigger that event on an element."
	
	self call: 'focus' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onFocusIn: anObject [
	"Bind an event handler to the 'focusin' JavaScript event."
	
	self call: 'focusin' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onFocusOut: anObject [
	"Bind an event handler to the 'focusout' JavaScript event."
	
	self call: 'focusout' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onInput: anObject [
	"Bind an event handler to the 'input' JavaScript event, or trigger that event on an element."
	
	self on: 'input' do: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onKeyDown: anObject [
	"Bind an event handler to the 'keydown' JavaScript event, or trigger that event on an element."
	
	self call: 'keydown' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onKeyPress: anObject [
	"Bind an event handler to the 'keypress' JavaScript event, or trigger that event on an element."
	
	self call: 'keypress' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onKeyUp: anObject [
	"Bind an event handler to the 'keyup' JavaScript event, or trigger that event on an element."
	
	self call: 'keyup' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onLoad: anObject [
	"Bind an event handler to the 'load' JavaScript event."
	
	self on: 'load' do: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onMouseDown: anObject [
	"Bind an event handler to the 'mousedown' JavaScript event, or trigger that event on an element."
	
	self call: 'mousedown' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onMouseEnter: anObject [
	"Bind an event handler to be fired when the mouse enters an element, or trigger that handler on an element."
	
	self call: 'mouseenter' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onMouseLeave: anObject [
	"Bind an event handler to be fired when the mouse leaves an element, or trigger that handler on an element."
	
	self call: 'mouseleave' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onMouseMove: anObject [
	"Bind an event handler to the 'mousemove' JavaScript event, or trigger that event on an element."
	
	self call: 'mousemove' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onMouseOut: anObject [
	"Bind an event handler to the 'mouseout' JavaScript event, or trigger that event on an element."
	
	self call: 'mouseout' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onMouseOver: anObject [
	"Bind an event handler to the 'mouseover' JavaScript event, or trigger that event on an element."
	
	self call: 'mouseover' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onMouseUp: anObject [
	"Bind an event handler to the 'mouseup' JavaScript event, or trigger that event on an element."
	
	self call: 'mouseup' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onResize: anObject [
	"Bind an event handler to the 'resize' JavaScript event, or trigger that event on an element."
	
	self call: 'resize' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onScroll: anObject [
	"Bind an event handler to the 'scroll' JavaScript event, or trigger that event on an element."
	
	self call: 'scroll' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onSelect: anObject [
	"Bind an event handler to the 'select' JavaScript event, or trigger that event on an element."
	
	self call: 'select' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onSubmit: anObject [
	"Bind an event handler to the 'submit' JavaScript event, or trigger that event on an element."
	
	self call: 'submit' with: anObject asFunction
]

{ #category : #'events-register' }
JQueryInstance >> onUnload: anObject [
	"Binds a function to the unload event of each matched element."
	
	self on: 'unload' do: anObject asFunction
]

{ #category : #events }
JQueryInstance >> one: aString do: anObject [ 
	"Attach a handler to an event for the elements. The handler is executed at most once."
	
	self call: 'one' with: aString with: anObject asFunction
]

{ #category : #css }
JQueryInstance >> outerHeight [
	"Get the current computed height for the first element in the set of matched elements, including padding and border."
	
	self call: 'outerHeight'
]

{ #category : #css }
JQueryInstance >> outerWidth [
	"Get the current computed width for the first element in the set of matched elements, including padding and border."
	
	self call: 'outerWidth'
]

{ #category : #navigation }
JQueryInstance >> parent [
	"Get a set of elements containing the unique parents of the matched set of elements."
	
	self call: 'parent'
]

{ #category : #navigation }
JQueryInstance >> parent: aString [
	"Get a set of elements containing the unique parents of the matched set of elements."
	
	self call: 'parent' with: aString
]

{ #category : #navigation }
JQueryInstance >> parents [
	"Get the ancestors of each element in the current set of matched elements, optionally filtered by a selector."
	
	self call: 'parents'
]

{ #category : #navigation }
JQueryInstance >> parents: aString [
	"Get the ancestors of each element in the current set of matched elements, optionally filtered by a selector."
	
	self call: 'parents' with: aString
]

{ #category : #navigation }
JQueryInstance >> parentsUntil: aString [
	"Get the ancestors of each element in the current set of matched elements, up to but not including the element matched by the selector."
	
	self call: 'parentsUntil' with: aString
]

{ #category : #css }
JQueryInstance >> position [
	"Get the current coordinates of the first element in the set of matched elements, relative to the offset parent."
	
	self call: 'position'
]

{ #category : #css }
JQueryInstance >> positionLeft [
	"Gets the left position of an element relative to its offset parent."
	
	self position; access: 'left'
]

{ #category : #css }
JQueryInstance >> positionTop [
	"Gets the top position of an element relative to its offset parent."
	
	self position; access: 'top'
]

{ #category : #modifying }
JQueryInstance >> prepend: aRenderable [ 
	"Insert content, specified by the parameter, to the beginning of each element in the set of matched elements."
	
	self call: 'prepend' with: (self render: aRenderable)
]

{ #category : #modifying }
JQueryInstance >> prependTo: anObject [ 
	"Insert every element in the set of matched elements to the beginning of the target."
	
	self call: 'prependTo' with: anObject
]

{ #category : #navigation }
JQueryInstance >> previous [
	"Get the immediately preceding sibling of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'prev'
]

{ #category : #navigation }
JQueryInstance >> previous: aString [
	"Get the immediately preceding sibling of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'prev' with: aString
]

{ #category : #navigation }
JQueryInstance >> previousAll [
	"Get all preceding siblings of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'prevAll'
]

{ #category : #navigation }
JQueryInstance >> previousAll: aString [
	"Get all preceding siblings of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'prevAll' with: aString
]

{ #category : #navigation }
JQueryInstance >> previousUntil: aString [
	"Get all preceding siblings of each element up to but not including the element matched by the selector."
	
	self call: 'prevUntil' with: aString
]

{ #category : #attributes }
JQueryInstance >> properties: aDictionary [ 
	"Set one or more properties for the set of matched elements."
	
	self call: 'prop' with: aDictionary
]

{ #category : #attributes }
JQueryInstance >> propertyAt: aKey [ 
	"Get the value of a property for the first element in the set of matched elements."

	self call: 'prop' with: aKey
]

{ #category : #attributes }
JQueryInstance >> propertyAt: aKey put: aValue [
	"Set a property for the set of matched elements."
	
	self call: 'prop' with: aKey with: aValue
]

{ #category : #data }
JQueryInstance >> queue [
	"Show the queue of functions to be executed on the matched elements."
	
	self call: 'queue'
]

{ #category : #data }
JQueryInstance >> queue: aString [
	"Manipulate the queue of functions to be executed on the matched elements."
	
	self call: 'queue' with: aString
]

{ #category : #data }
JQueryInstance >> queue: aString do: anObject [
	"Manipulate the queue of functions to be executed on the matched elements."
	
	self call: 'queue' with: aString with: anObject asFunction
]

{ #category : #modifying }
JQueryInstance >> remove [
	"Remove the set of matched elements from the DOM."
	
	self call: 'remove'
]

{ #category : #modifying }
JQueryInstance >> remove: aString [ 
	"Remove the set of matched elements from the DOM."
	
	self call: 'remove' with: aString
]

{ #category : #attributes }
JQueryInstance >> removeAttribute: aKey [ 
	"Remove an attribute from each element in the set of matched elements."

	self call: 'removeAttr' with: aKey
]

{ #category : #classes }
JQueryInstance >> removeClass: aString [ 
	"Remove one or all classes from each element in the set of matched elements."
	
	self call: 'removeClass' with: aString
]

{ #category : #data }
JQueryInstance >> removeDataAt: aKey [
	"Remove a previously-stored piece of data."
	
	self call: 'removeData' with: aKey
]

{ #category : #attributes }
JQueryInstance >> removeProperty: aKey [ 
	"Remove a property from each element in the set of matched elements."

	self call: 'removeProp' with: aKey
]

{ #category : #modifying }
JQueryInstance >> replaceAll: aString [ 
	"A selector expression indicating which element(s) to replace."
	
	self call: 'replaceAll' with: aString
]

{ #category : #modifying }
JQueryInstance >> replaceWith: aRenderable [ 
	"Replace each element in the set of matched elements with the provided new content."
	
	self call: 'replaceWith' with: (self render: aRenderable)
]

{ #category : #css }
JQueryInstance >> scrollLeft [
	"Get the current horizontal position of the scroll bar for the first element in the set of matched elements."
	
	self call: 'scrollLeft'
]

{ #category : #css }
JQueryInstance >> scrollLeft: anInteger [
	"Set the current horizontal position of the scroll bar for the first element in the set of matched elements."
	
	self call: 'scrollLeft' with: anInteger
]

{ #category : #css }
JQueryInstance >> scrollTop [
	"Get the current vertical position of the scroll bar for the first element in the set of matched elements."
	
	self call: 'scrollTop'
]

{ #category : #css }
JQueryInstance >> scrollTop: anInteger [
	"Set the current vertical position of the scroll bar for the first element in the set of matched elements."
	
	self call: 'scrollTop' with: anInteger
]

{ #category : #ajax }
JQueryInstance >> serialize [
	"Encode a set of form elements as a string for submission."
	
	self call: 'serialize'
]

{ #category : #ajax }
JQueryInstance >> serializeArray [
	"Encode a set of form elements as an array of names and values."
	
	self call: 'serializeArray'
]

{ #category : #initialization }
JQueryInstance >> setArguments: anArray [
	arguments := anArray
]

{ #category : #effects }
JQueryInstance >> show [
	"Display the matched elements."
	
	self call: 'show'
]

{ #category : #effects }
JQueryInstance >> show: aDuration [ 
	"Display the matched elements."
	
	self call: 'show' with: aDuration
]

{ #category : #effects }
JQueryInstance >> show: aDuration callback: anObject [
	"Display the matched elements."
	
	self call: 'show' with: aDuration with: anObject asFunction
]

{ #category : #navigation }
JQueryInstance >> siblings [
	"Get the siblings of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'siblings'
]

{ #category : #navigation }
JQueryInstance >> siblings: aString [
	"Get the siblings of each element in the set of matched elements, optionally filtered by a selector."
	
	self call: 'siblings' with: aString
]

{ #category : #filtering }
JQueryInstance >> sliceFrom: aStartInteger [
	"Reduce the set of matched elements to a subset specified by a range of indices."
	
	self call: 'slice' with: aStartInteger
]

{ #category : #filtering }
JQueryInstance >> sliceFrom: aStartInteger to: aStopInteger [
	"Reduce the set of matched elements to a subset specified by a range of indices."
	
	self call: 'slice' with: aStartInteger with: aStopInteger
]

{ #category : #effects }
JQueryInstance >> slideDown: aDuration [
	"Display the matched elements with a sliding motion."
	
	self call: 'slideDown' with: aDuration
]

{ #category : #effects }
JQueryInstance >> slideDown: aDuration callback: anObject [
	"Display the matched elements with a sliding motion."
	
	self call: 'slideDown' with: aDuration with: anObject asFunction
]

{ #category : #effects }
JQueryInstance >> slideToggle: aDuration [
	"Display or hide the matched elements with a sliding motion."
	
	self call: 'slideToggle' with: aDuration
]

{ #category : #effects }
JQueryInstance >> slideToggle: aDuration callback: anObject [
	"Display or hide the matched elements with a sliding motion."
	
	self call: 'slideToggle' with: aDuration with: anObject asFunction
]

{ #category : #effects }
JQueryInstance >> slideUp: aDuration [
	"Hide the matched elements with a sliding motion."
	
	self call: 'slideUp' with: aDuration
]

{ #category : #effects }
JQueryInstance >> slideUp: aDuration callback: anObject [
	"Hide the matched elements with a sliding motion."
	
	self call: 'slideUp' with: aDuration with: anObject asFunction
]

{ #category : #effects }
JQueryInstance >> stop [
	"Stop the currently-running animation on the matched elements."
	
	self call: 'stop'
]

{ #category : #manipulating }
JQueryInstance >> text [
	"Get the combined text contents of each element in the set of matched elements, including their descendants."
	
	self call: 'text'
]

{ #category : #manipulating }
JQueryInstance >> text: aString [ 
	"Set the text contents of each element in the set of matched elements."
	
	self call: 'text' with: aString
]

{ #category : #accessors }
JQueryInstance >> toArray [
	"Retrieve all the DOM elements contained in the jQuery set, as an array.Retrieve all the DOM elements contained in the jQuery set, as an array."
	
	self call: 'toArray'
]

{ #category : #effects }
JQueryInstance >> toggle [
	"Bind two or more handlers to the matched elements, to be executed on alternate clicks."
	
	self call: 'toggle'
]

{ #category : #effects }
JQueryInstance >> toggle: anObject [
	self call: 'toggle' with: anObject
]

{ #category : #effects }
JQueryInstance >> toggle: aDuration callback: anObject [
	"Bind two or more handlers to the matched elements, to be executed on alternate clicks."
	
	self call: 'toggle' with: aDuration with: anObject asFunction
]

{ #category : #classes }
JQueryInstance >> toggleClass: aStringOrFunction [
	"Add or remove a class from each element in the set of matched elements, depending on either the class's presence or the value of the switch argument."
	
	self call: 'toggleClass' with: aStringOrFunction
]

{ #category : #classes }
JQueryInstance >> toggleClass: aStringOrFunction state: aBoolean [
	"Adds the specified class if the switch is true, removes the specified class if the switch is false."
	
	self call: 'toggleClass' with: aStringOrFunction with: aBoolean
]

{ #category : #events }
JQueryInstance >> trigger: aString [
	"Execute all handlers and behaviors attached to the matched elements for the given event type."
	
	self call: 'trigger' with: aString
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerBlur [
	"Triggers the blur event of each matched element."
	
	self call: 'blur'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerChange [
	"Triggers the change event of each matched element."
	
	self call: 'change'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerClick [
	"Triggers the click event of each matched element."
	
	self call: 'click'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerDoubleClick [
	"Triggers the dblclick event of each matched element."
	
	self call: 'dblclick'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerError [
	"Triggers the error event of each matched element."
	
	self call: 'error'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerFocus [
	"Triggers the focus event of each matched element."
	
	self call: 'focus'
]

{ #category : #events }
JQueryInstance >> triggerHandler: aString [
	"Execute all handlers attached to an element for an event."
	
	self call: 'triggerHandler' with: aString
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerKeyDown [
	"Triggers the keydown event of each matched element."
	
	self call: 'keydown'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerKeyPress [
	"Triggers the keypress event of each matched element."
	
	self call: 'keypress'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerKeyUp [
	"Triggers the keyup event of each matched element."
	
	self call: 'keyup'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerSelect [
	"Trigger the select event of each matched element."
	
	self call: 'select'
]

{ #category : #'events-trigger' }
JQueryInstance >> triggerSubmit [
	"Trigger the submit event of each matched element."
	
	self call: 'submit'
]

{ #category : #events }
JQueryInstance >> unbind: aString [
	"Remove a previously-attached event handler from the elements."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'unbind' with: aString
]

{ #category : #events }
JQueryInstance >> undelegate [
	"Remove a handler from the event for all elements which match the current selector, now or in the future, based upon a specific set of root elements."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'undelegate'
]

{ #category : #events }
JQueryInstance >> undelegate: aSelectorString on: anEventString [
	"Remove a handler from the event for all elements which match the current selector, now or in the future, based upon a specific set of root elements."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'undelegate' with: aSelectorString with: anEventString
]

{ #category : #modifying }
JQueryInstance >> unwrap [
	"Remove the parents of the set of matched elements from the DOM, leaving the matched elements in their place."
	
	self call: 'unwrap'
]

{ #category : #manipulating }
JQueryInstance >> value [
	"Get the current value of the first element in the set of matched elements."
	
	self call: 'val'
]

{ #category : #manipulating }
JQueryInstance >> value: anObject [ 
	"Set the  value of all matched elements."
	
	self call: 'val' with: anObject
]

{ #category : #css }
JQueryInstance >> width [
	"Get the current computed width for the first element in the set of matched elements."
	
	self call: 'width'
]

{ #category : #css }
JQueryInstance >> width: anInteger [
	"Get the width for all matched elements."
	
	self call: 'width' with: anInteger
]

{ #category : #modifying }
JQueryInstance >> wrap: aRenderable [ 
	"Wrap an HTML structure around each element in the set of matched elements."
	
	self call: 'wrap' with: (self render: aRenderable)
]

{ #category : #modifying }
JQueryInstance >> wrapAll: aRenderable [ 
	"Wrap an HTML structure around all elements in the set of matched elements."
	
	self call: 'wrapAll' with: (self render: aRenderable)
]

{ #category : #modifying }
JQueryInstance >> wrapInner: aRenderable [ 
	"Wrap an HTML structure around the content of each element in the set of matched elements."
	
	self call: 'wrapInner' with: (self render: aRenderable)
]
