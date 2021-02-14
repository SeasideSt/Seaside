"
This is the core dependency of the effects of jQuery UI. This file is needed by all other effects and can also be used as stand-alone. Please note that ui.core.js is not a dependency for the effects to work.
"
Class {
	#name : #JQEffect,
	#superclass : #JQPlugin,
	#instVars : [
		'method',
		'effect',
		'speed',
		'complete'
	],
	#category : 'JQuery-UI-Objects'
}

{ #category : #private }
JQEffect >> arguments [
	| result |
	result := OrderedCollection with: effect.
	(options isEmpty and: [ speed isNil and: [ complete isNil ] ])
		ifFalse: [ result addLast: options ].
	(speed isNil and: [ complete isNil ])
		ifFalse: [ result addLast: speed ].
	(complete isNil)
		ifFalse: [ result addLast: complete ].
	^ result
]

{ #category : #'effects-toggle' }
JQEffect >> blind [
	"Blinds the element away or shows it by blinding it in."
	
	self effect: 'blind'
]

{ #category : #effects }
JQEffect >> bounce [
	"Bounces the element vertically or horizontally n-times."
	
	self effect: 'bounce'
]

{ #category : #options }
JQEffect >> className: aString [
	"Transfer - Class name the transfer element will receive."

	self optionAt: 'className' put: aString
]

{ #category : #'effects-toggle' }
JQEffect >> clip [
	"Clips the element on or off, vertically or horizontally."
	
	self effect: 'clip'
]

{ #category : #options }
JQEffect >> color: aColor [
	"Highlight - The highlight color."

	self optionAt: 'color' put: aColor
]

{ #category : #options }
JQEffect >> direction: aString [
	"Blind - vertical or horizontal."
	"Clip - vertical or horizontal."
	"Drop - left, right, up, down."
	"Slide - left, right, up, down."
	"Scale - both, vertical, horizontal."
	"Bounce - left, right, up, down."
	"Shake - left, right, up, down."

	self optionAt: 'direction' put: aString
]

{ #category : #options }
JQEffect >> distance: anInteger [
	"Bounce - The bounce distance."
	"Shake - The bounce distance."

	self optionAt: 'distance' put: anInteger
]

{ #category : #'effects-toggle' }
JQEffect >> drop [
	"Drops the element away or shows it by dropping it in."
	
	self effect: 'drop'
]

{ #category : #options }
JQEffect >> easing: aString [
	self optionAt: 'easing' put: aString
]

{ #category : #methods }
JQEffect >> effect [
	"Uses a specific effect on an element."
	
	self method: 'effect'
]

{ #category : #accessing }
JQEffect >> effect: aString [
	"The effect to be used."
	
	effect := aString
]

{ #category : #'effects-toggle' }
JQEffect >> explode [
	"Explodes the element into multiple pieces."
	
	self effect: 'explode'
]

{ #category : #'effects-toggle' }
JQEffect >> fade [
	"Fade the element in and out."
	
	self effect: 'fade'
]

{ #category : #'accessing-speed' }
JQEffect >> fast [
	self speed: 'fast'
]

{ #category : #'effects-toggle' }
JQEffect >> fold [
	"Folds the element like a piece of paper."
	
	self effect: 'fold'
]

{ #category : #options }
JQEffect >> from [
	^ self options 
		at: 'from'
		ifAbsentPut: [ GRSmallDictionary2 new ]
]

{ #category : #options }
JQEffect >> from: aDictionary [
	"Transfer - The element from width/height to."
	
	self optionAt: 'from' put: aDictionary
]

{ #category : #convenience }
JQEffect >> fromHeight: anInteger [
	self from at: 'height' put: anInteger
]

{ #category : #convenience }
JQEffect >> fromWidth: anInteger [
	self from at: 'width' put: anInteger
]

{ #category : #methods }
JQEffect >> hide [
	"Uses a specific effect on an element to hide the element if the first argument is an effect string."
	
	self method: 'hide'
]

{ #category : #effects }
JQEffect >> highlight [
	"Highlights the background with a defined color."
	
	self effect: 'highlight'
]

{ #category : #initialization }
JQEffect >> initialize [
	super initialize.
	self effect; highlight; options
]

{ #category : #private }
JQEffect >> method [
	^ method
]

{ #category : #accessing }
JQEffect >> method: aString [
	"The method to be used."

	method := aString
]

{ #category : #'accessing-speed' }
JQEffect >> normal [
	self speed: 'normal'
]

{ #category : #events }
JQEffect >> onComplete: anObject [
	"A function to be executed whenever the animation completes, executes once for each element animated against."
	
	complete := anObject asFunction
]

{ #category : #options }
JQEffect >> origin: anArray [
	"Scale - the vanishing point."
	"Size - the vanishing point."

	self optionAt: 'origin' put: anArray
]

{ #category : #options }
JQEffect >> percent: anInteger [
	"Puff - The percentage to scale to."
	"Scale - The percentage to scale to."

	self optionAt: 'percent' put: anInteger
]

{ #category : #options }
JQEffect >> pieces: aNumber [
	"Explode - Explodes or implodes the element into/from many pieces."

	self optionAt: 'pieces' put: aNumber
]

{ #category : #'effects-toggle' }
JQEffect >> puff [
	"Scale and fade out animations create the puff effect."
	
	self effect: 'puff'
]

{ #category : #effects }
JQEffect >> pulsate [
	"Pulsates the opacity of the element multiple times."
	
	self effect: 'pulsate'
]

{ #category : #'effects-toggle' }
JQEffect >> scale [
	"Shrink or grow an element by a percentage factor."
	
	self effect: 'scale'
]

{ #category : #options }
JQEffect >> scale: aString [
	"Scale - Which areas of the element will be resized: 'both', 'box', 'content'."
	"Size - Which areas of the element will be resized: 'both', 'box', 'content'."

	self optionAt: 'scale' put: aString
]

{ #category : #effects }
JQEffect >> shake [
	"Shakes the element vertically or horizontally n-times."
	
	self effect: 'shake'
]

{ #category : #methods }
JQEffect >> show [
	"Uses a specific effect on an element to show the element if the first argument is a effect string."
	
	self method: 'show'
]

{ #category : #effects }
JQEffect >> size [
	"Resize an element to a specified width and height."
	
	self effect: 'size'
]

{ #category : #options }
JQEffect >> size: anInteger [
	"Fold - Size to fold."

	self optionAt: 'size' put: anInteger
]

{ #category : #'effects-toggle' }
JQEffect >> slide [
	"Slides the element out of the viewport."
	
	self effect: 'slide'
]

{ #category : #'accessing-speed' }
JQEffect >> slow [
	self speed: 'slow'
]

{ #category : #accessing }
JQEffect >> speed: aDuration [
	"A string representing one of the three predefined speeds (slow, normal, or fast) or the number of milliseconds to run the animation."
	
	speed := aDuration
]

{ #category : #options }
JQEffect >> times: anInteger [
	"Pulsate - Number of times to pulsate."
	"Bounce - Number of times to bounce."
	"Shake - Number of times to shake."

	self optionAt: 'times' put: anInteger
]

{ #category : #options }
JQEffect >> to [
	^ self options 
		at: 'to'
		ifAbsentPut: [ GRSmallDictionary2 new ]
]

{ #category : #options }
JQEffect >> to: aDictionaryOrString [
	"Transfer - The element to transfer to."

	self optionAt: 'to' put: aDictionaryOrString
]

{ #category : #convenience }
JQEffect >> toHeight: anInteger [
	self to at: 'height' put: anInteger
]

{ #category : #convenience }
JQEffect >> toWidth: anInteger [
	self to at: 'width' put: anInteger
]

{ #category : #methods }
JQEffect >> toggle [
	"Uses a specific effect on an element to toggle the element if the first argument is an effect string."
	
	self method: 'toggle'
]

{ #category : #effects }
JQEffect >> transfer [
	"Transfers the outline of an element to another."
	
	self effect: 'transfer'
]
