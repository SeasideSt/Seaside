Extension { #name : #JQueryInstance }

{ #category : #'*JQuery-UI-widgets' }
JQueryInstance >> accordion [
	"Make the selected elements Accordion widgets."
	
	^ self create: JQAccordion
]

{ #category : #'*JQuery-UI-transitions' }
JQueryInstance >> addClass: aString duration: aDurationOrString [
	"Adds the specified class to each of the set of matched elements with a optional transition between the states."
	
	self call: 'addClass' with: aString with: aDurationOrString
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> autocomplete [
	"Make the selected input elements autocomplete."
	
	^ self create: JQAutocomplete
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> button [
	"Make the selected input elements buttons."
	
	^ self create: JQButton 
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> buttonset [
	"Group buttons which should be always applied for radio buttons."

	^ self call: 'buttonset'
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> datepicker [
	"The method that you use to create a new date picker."
	
	^ self create: JQDatepicker
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> dialog [
	"Make the selected elements Dialog boxes."
	
	^ self create: JQDialog
]

{ #category : #'*JQuery-UI-interactions' }
JQueryInstance >> draggable [
	"Creates new draggables on the nodeset supplied by the query."
	
	^ self create: JQDraggable
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> droppable [
	"Creates new droppables on the nodeset supplied by the query."
	
	^ self create: JQDroppable
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> effect [
	"This is the core dependency of the effects of jQuery UI."
	
	^ self create: JQEffect
]

{ #category : #'*JQuery-UI-css' }
JQueryInstance >> innerHeight: anInteger [
	"Set the height for the elements in the set of matched elements, including padding but not border."
	
	self call: 'innerHeight' with: anInteger
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> innerWidth: anInteger [
	"Set the width for the elements in the set of matched elements, including padding but not border."
	
	self call: 'innerWidth' with: anInteger
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> outerHeight: anInteger [
	"Set the height for the elements in the set of matched elements, including padding and border."
	
	self call: 'outerHeight' with: anInteger
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> outerWidth: anInteger [
	"Set the width for the elements in the set of matched elements, including padding and border."
	
	self call: 'outerWidth' with: anInteger
]

{ #category : #'*JQuery-UI-utilities' }
JQueryInstance >> positioned [
	"Make the selected elements positioned. Note: this method is called 'positioned' (contrary to the jQueryUI implementation where it is called 'position') to avoid a conflict in Smalltalk."
	
	^ self create: JQPosition
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> progressbar [
	"Make the selected elements progressbar."
	
	^ self create: JQProgressbar
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> removeClass: aString duration: aDurationOrString [
	"Removes the specified class from the set of matched elements with a optional transition."
	
	self call: 'removeClass' with: aString with: aDurationOrString
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> resizable [
	"Creates new resizables on the nodeset supplied by the query."
	
	^ self create: JQResizable
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> selectable [
	"Creates new selectable on the nodeset supplied by the query."
	
	^ self create: JQSelectable
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> slider [
	"Makes a slider from the nodeset supplied by the query."
	
	^ self create: JQSlider
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> sortable [
	"Creates new sortable on the nodeset supplied by the query."
	
	^ self create: JQSortable
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> switchClass: firstClassString to: secondClassString duration: aDurationOrString [
	"Switches from the class defined in the first argument to the class defined as second argument, using a optional transition."
	
	self call: 'switchClass' with: firstClassString with: secondClassString with: aDurationOrString
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> tabs [
	"The method that you use to create a new tabs interface."
	
	^ self create: JQTabs
]

{ #category : #'*JQuery-UI' }
JQueryInstance >> toggleClass: aString duration: aDurationOrString [
	"Adds the specified class if it is not present, removes the specified class if it is present, using a optional transition."
	
	self call: 'toggleClass' with: aString with: aDurationOrString
]
