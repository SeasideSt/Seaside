"
I am a ToolBuilder-based tool to manage the Seaside configuration.

"
Class {
	#name : #WAControlTool,
	#superclass : #Model,
	#classVars : [
		'Icons'
	],
	#category : 'Seaside-Squeak-Tools-Development'
}

{ #category : #'class initialization' }
WAControlTool class >> initialize [

	Icons := IdentityDictionary new.

]

{ #category : #'instance creation' }
WAControlTool class >> open [

	^ self openDefault

]

{ #category : #'instance creation' }
WAControlTool class >> openDefault [

	^ self newDefault open

]

{ #category : #icons }
WAControlTool class >> seasideAdaptorRunningIcon [
	^ Icons
			at: #'seasideAdaptorRunningIcon'
			ifAbsentPut:[ Form fromBinaryStream:self seasideAdaptorRunningIconContents readStream ].
	
]

{ #category : #icons }
WAControlTool class >> seasideAdaptorRunningIconContents [
	^ #[2 32 0 12 0 12 0 0 0 0 128 225 128 144 17 0 11 255 255 90 0 255 251 85 0 41 0 15 255 255 100 0 255 255 95 0 255 248 81 0 37 0 35 255 255 116 0 255 255 124 0 255 253 104 0 0 0 0 0 255 255 65 0 255 235 26 0 255 221 0 0 255 218 0 0 13 0 99 255 245 101 0 255 255 133 0 255 255 125 0 255 255 155 0 255 254 112 0 255 255 107 0 255 242 50 0 255 224 7 0 255 211 0 0 0 0 0 0 255 253 115 0 255 254 115 0 255 255 127 0 255 255 160 0 255 255 132 0 255 255 151 0 255 255 134 0 255 255 94 0 255 247 84 0 255 217 6 0 0 0 0 0 255 255 109 0 255 255 114 0 255 255 132 0 10 255 255 142 0 71 255 255 119 0 255 255 95 0 255 255 113 0 255 255 150 0 255 235 45 0 255 205 0 0 0 0 0 0 255 254 103 0 255 254 105 0 255 255 121 0 255 255 144 0 255 255 146 0 255 255 123 0 255 255 97 0 255 255 110 0 255 255 136 0 255 228 22 0 17 0 39 255 245 91 0 255 254 93 0 255 255 152 0 255 255 114 0 255 255 147 0 255 255 137 0 255 245 69 0 255 239 48 0 255 215 0 0 17 0 39 255 254 80 0 255 255 133 0 255 255 105 0 255 255 116 0 255 246 75 0 255 241 67 0 255 230 23 0 255 222 3 0 255 197 0 0 13 0 39 255 252 71 0 255 255 90 0 255 254 89 0 255 244 51 0 0 0 0 0 255 220 0 0 255 221 1 0 255 222 1 0 255 205 0 0 13 0 15 255 252 60 0 255 248 52 0 255 235 33 0 37 0 15 255 231 24 0 255 220 12 0 255 193 4 0 25 0]
]

{ #category : #icons }
WAControlTool class >> seasideAdaptorStoppedIcon [
	^ Icons
			at: #'seasideAdaptorStoppedIcon'
			ifAbsentPut:[ Form fromBinaryStream: self seasideAdaptorStoppedIconContents readStream].
	
]

{ #category : #icons }
WAControlTool class >> seasideAdaptorStoppedIconContents [
	^ #[2 32 0 12 0 12 0 0 0 0 128 225 124 144 17 0 11 255 103 103 103 255 99 99 99 41 0 15 255 109 109 109 255 106 106 106 255 96 96 96 37 0 35 255 120 120 120 255 125 125 125 255 112 112 112 0 0 0 0 255 86 86 86 255 57 57 57 255 38 38 38 255 37 37 37 13 0 43 255 108 108 108 255 131 131 131 255 126 126 126 255 146 146 146 255 117 117 117 255 114 114 114 255 74 74 74 255 43 43 43 255 36 36 36 0 0 0 0 10 255 119 119 119 51 255 127 127 127 255 149 149 149 255 130 130 130 255 143 143 143 255 132 132 132 255 105 105 105 255 97 97 97 255 41 41 41 0 0 0 0 255 115 115 115 255 119 119 119 255 130 130 130 10 255 137 137 137 71 255 122 122 122 255 106 106 106 255 118 118 118 255 142 142 142 255 70 70 70 255 35 35 35 0 0 0 0 255 111 111 111 255 112 112 112 255 123 123 123 255 138 138 138 255 140 140 140 255 124 124 124 255 107 107 107 255 116 116 116 255 133 133 133 255 53 53 53 17 0 39 255 102 102 102 255 105 105 105 255 144 144 144 255 119 119 119 255 140 140 140 255 134 134 134 255 87 87 87 255 72 72 72 255 37 37 37 17 0 39 255 96 96 96 255 131 131 131 255 113 113 113 255 120 120 120 255 91 91 91 255 85 85 85 255 54 54 54 255 40 40 40 255 33 33 33 13 0 27 255 90 90 90 255 103 103 103 255 102 102 102 255 75 75 75 0 0 0 0 255 37 37 37 10 255 38 38 38 7 255 35 35 35 13 0 15 255 82 82 82 255 76 76 76 255 62 62 62 37 0 15 255 55 55 55 255 45 45 45 255 35 35 35 25 0]
]

{ #category : #configuration }
WAControlTool class >> title [

	^ 'Seaside Tool'
]

{ #category : #configuration }
WAControlTool class >> windowColorSpecification [

	| bright pastel |
	bright :=  Color r: 0.212 g: 0.637 b: 1.0.
	pastel := (Color r: 0.189 g: 0.7 b: 1.0) adjustSaturation: -0.5 brightness: 0.
	^ WindowColorSpec
		classSymbol: self name
		wording: self title
		brightColor: bright
		pastelColor: pastel
		helpMessage: 'The Seaside control panel that helps organizing adaptors'
]

{ #category : #building }
WAControlTool >> buildButtonsWith: builder [

	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec
		layout: #horizontal;
		children: OrderedCollection new.
	self buttonSpecs do:[:spec|
		| buttonSpec |
		buttonSpec := builder pluggableActionButtonSpec new
			model: self;
			label: spec first;
			action: spec second;
			enabled: spec third;
			yourself.
		spec size > 3 ifTrue:[buttonSpec help: spec fourth].
		panelSpec children addLast: buttonSpec.
	].
	^panelSpec
]

{ #category : #building }
WAControlTool >> buildPanelWith: builder specs: specs [
	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	specs do:[ :assoc | | action widgetSpec rect |
		rect := assoc key.
		action := assoc value.
		widgetSpec := action value.
		widgetSpec ifNotNil:[
			widgetSpec frame: rect.
			panelSpec children add: widgetSpec]].
	^panelSpec
]

{ #category : #building }
WAControlTool >> buildWindowWith: builder [

	^ builder pluggableWindowSpec new
		model: self;
		label: #label;
		children: OrderedCollection new;
		yourself

]

{ #category : #building }
WAControlTool >> buildWindowWith: builder specs: specs [
	| windowSpec |
	windowSpec := self buildWindowWith: builder.
	specs do:[ :assoc | | action widgetSpec rect |
		rect := assoc key.
		action := assoc value.
		widgetSpec := action value.
		widgetSpec ifNotNil:[
			widgetSpec frame: rect.
			windowSpec children add: widgetSpec]].
	^windowSpec
]

{ #category : #building }
WAControlTool >> buttonSpecs [
	"Answer a tuple for the buttons, in the format:
	button label 	selector to send				enabled selector/boolean	help message"
	^ (Pragma allNamed: #button:enabled:help: in: self class)
		collect: [:pragma | 
			{ pragma arguments first . pragma selector }, pragma arguments allButFirst]

]

{ #category : #accessing }
WAControlTool >> label [
	^ self class title
]

{ #category : #'user interface' }
WAControlTool >> open [

	^ ToolBuilder default open: self
]
