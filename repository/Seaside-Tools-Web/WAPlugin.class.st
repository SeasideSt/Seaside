"
I am an abstract root class for all plugins. Plugins are an easy way to add or remove additional tools without changing the codebase. To add a new plugin make sure you choose the right superclass so that the tool can detect your code.

The appearance of all plugins, such as icons, has to be configured using CSS.
"
Class {
	#name : #WAPlugin,
	#superclass : #WAPainter,
	#instVars : [
		'requestor'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #comparing }
WAPlugin >> <= aPlugin [
	^ self priority <= aPlugin priority
]

{ #category : #accessing }
WAPlugin >> clickScript [
	"Answer a Javascript snippet that is added to the rendered link as a click-action."

	^ nil
]

{ #category : #accessing }
WAPlugin >> cssClass [
	"Answer a CSS class that will be applied to an automatically rendered link."

	^ 'wa-' , (self class name allButFirst: 2) asLowercase
]

{ #category : #actions }
WAPlugin >> execute [
	"Execute the receiving plugin."
]

{ #category : #initialization }
WAPlugin >> initializeRequestor: aRequestorObject [
	self initialize.
	requestor := aRequestorObject
]

{ #category : #testing }
WAPlugin >> isActive [
	"Answer whether the plugin is usable with the current target."

	^ true
]

{ #category : #accessing }
WAPlugin >> label [
	"Answer the menu label of the plugin."

	^ self printString
]

{ #category : #actions }
WAPlugin >> open: aComponent [
	self open: aComponent onAnswer: [ :value | ]
]

{ #category : #actions }
WAPlugin >> open: aComponent onAnswer: aBlock [
	"Replace the current page with aComponent."

	self session presenter
		show: (aComponent
			addDecoration: (WAWindowDecoration new
				cssClass: self cssClass;
				title: self title;
				yourself);
			yourself)
		onAnswer: aBlock
]

{ #category : #accessing }
WAPlugin >> priority [
	"Answer a number used to sort the receiver. A lower number means it appears earlier on."

	^ 0
]

{ #category : #rendering }
WAPlugin >> renderContentOn: html [
	"A default render method to display the interface of the receiving plugin. Might be overriden with specific behavior in subclasses."

	html anchor
		title: self tooltip;
		class: self cssClass;
		onClick: self clickScript;
		callback: [ self execute ];
		with: self label
]

{ #category : #rendering }
WAPlugin >> rendererClass [
	^ WAHtmlCanvas
]

{ #category : #accessing }
WAPlugin >> requestor [
	"Answer the requestor component the plugin is working on."

	^ requestor
]

{ #category : #accessing }
WAPlugin >> title [
	"Answer the title used when opening a window."

	^ self label
]

{ #category : #accessing }
WAPlugin >> tooltip [
	"Answer a tooltip string that is displayed on the plugin link or button."

	^ nil
]
