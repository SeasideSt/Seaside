Extension { #name : #JQueryInstance }

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> accordion [
	"Make the selected elements Accordion widgets."
	
	^ self create: JQAccordion
]

{ #category : #'*jquery-ui-transitions' }
JQueryInstance >> addClass: aString duration: aDurationOrString [
	"Adds the specified class to each of the set of matched elements with a optional transition between the states."
	
	self call: 'addClass' with: aString with: aDurationOrString
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> autocomplete [
	"Make the selected input elements autocomplete."
	
	^ self create: JQAutocomplete
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> button [
	"Make the selected input elements buttons."
	
	^ self create: JQButton 
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> buttonset [
	"Group buttons which should be always applied for radio buttons."

	^ self call: 'buttonset'
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> datepicker [
	"The method that you use to create a new date picker."
	
	^ self create: JQDatepicker
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> dialog [
	"Make the selected elements Dialog boxes."
	
	^ self create: JQDialog
]

{ #category : #'*jquery-ui-interactions' }
JQueryInstance >> draggable [
	"Creates new draggables on the nodeset supplied by the query."
	
	^ self create: JQDraggable
]

{ #category : #'*jquery-ui-interactions' }
JQueryInstance >> droppable [
	"Creates new droppables on the nodeset supplied by the query."
	
	^ self create: JQDroppable
]

{ #category : #'*jquery-ui' }
JQueryInstance >> effect [
	"This is the core dependency of the effects of jQuery UI."
	
	^ self create: JQEffect
]

{ #category : #'*jquery-ui-css' }
JQueryInstance >> innerHeight: anInteger [
	"Set the height for the elements in the set of matched elements, including padding but not border."
	
	self call: 'innerHeight' with: anInteger
]

{ #category : #'*jquery-ui-css' }
JQueryInstance >> innerWidth: anInteger [
	"Set the width for the elements in the set of matched elements, including padding but not border."
	
	self call: 'innerWidth' with: anInteger
]

{ #category : #'*jquery-ui-css' }
JQueryInstance >> outerHeight: anInteger [
	"Set the height for the elements in the set of matched elements, including padding and border."
	
	self call: 'outerHeight' with: anInteger
]

{ #category : #'*jquery-ui-css' }
JQueryInstance >> outerWidth: anInteger [
	"Set the width for the elements in the set of matched elements, including padding and border."
	
	self call: 'outerWidth' with: anInteger
]

{ #category : #'*jquery-ui-utilities' }
JQueryInstance >> positioned [
	"Make the selected elements positioned. Note: this method is called 'positioned' (contrary to the jQueryUI implementation where it is called 'position') to avoid a conflict in Smalltalk."
	
	^ self create: JQPosition
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> progressbar [
	"Make the selected elements progressbar."
	
	^ self create: JQProgressbar
]

{ #category : #'*jquery-ui-transitions' }
JQueryInstance >> removeClass: aString duration: aDurationOrString [
	"Removes the specified class from the set of matched elements with a optional transition."
	
	self call: 'removeClass' with: aString with: aDurationOrString
]

{ #category : #'*jquery-ui-interactions' }
JQueryInstance >> resizable [
	"Creates new resizables on the nodeset supplied by the query."
	
	^ self create: JQResizable
]

{ #category : #'*jquery-ui-interactions' }
JQueryInstance >> selectable [
	"Creates new selectable on the nodeset supplied by the query."
	
	^ self create: JQSelectable
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> slider [
	"Makes a slider from the nodeset supplied by the query."
	
	^ self create: JQSlider
]

{ #category : #'*jquery-ui-interactions' }
JQueryInstance >> sortable [
	"Creates new sortable on the nodeset supplied by the query."
	
	^ self create: JQSortable
]

{ #category : #'*jquery-ui-transitions' }
JQueryInstance >> switchClass: firstClassString to: secondClassString duration: aDurationOrString [
	"Switches from the class defined in the first argument to the class defined as second argument, using a optional transition."
	
	self call: 'switchClass' with: firstClassString with: secondClassString with: aDurationOrString
]

{ #category : #'*jquery-ui-widgets' }
JQueryInstance >> tabs [
	"The method that you use to create a new tabs interface."
	
	^ self create: JQTabs
]

{ #category : #'*jquery-ui-transitions' }
JQueryInstance >> toggleClass: aString duration: aDurationOrString [
	"Adds the specified class if it is not present, removes the specified class if it is present, using a optional transition."
	
	self call: 'toggleClass' with: aString with: aDurationOrString
]
