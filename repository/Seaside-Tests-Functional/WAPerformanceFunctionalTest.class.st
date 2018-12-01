Class {
	#name : #WAPerformanceFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'duration',
		'referenceDict',
		'builder'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAPerformanceFunctionalTest class >> colors [
	"(120 to: 0 by: -1) collect: [ :hue |
		(Color h: hue s: 67 v: 100) asHTMLColor ]"
	^ #('#00FF00' '#04FF00' '#08FF00' '#0CFF00' '#11FF00' '#15FF00' '#19FF00' '#1DFF00' '#22FF00' '#26FF00' '#2AFF00' '#2FFF00' '#33FF00' '#37FF00' '#3BFF00' '#40FF00' '#44FF00' '#48FF00' '#4CFF00' '#51FF00' '#55FF00' '#59FF00' '#5DFF00' '#62FF00' '#66FF00' '#6AFF00' '#6EFF00' '#73FF00' '#77FF00' '#7BFF00' '#80FF00' '#84FF00' '#88FF00' '#8CFF00' '#91FF00' '#95FF00' '#99FF00' '#9DFF00' '#A2FF00' '#A6FF00' '#AAFF00' '#AEFF00' '#B3FF00' '#B7FF00' '#BBFF00' '#BFFF00' '#C4FF00' '#C8FF00' '#CCFF00' '#D0FF00' '#D5FF00' '#D9FF00' '#DDFF00' '#E2FF00' '#E6FF00' '#EAFF00' '#EEFF00' '#F3FF00' '#F7FF00' '#FBFF00' '#FFFF00' '#FFFB00' '#FFF700' '#FFF300' '#FFEE00' '#FFEA00' '#FFE600' '#FFE200' '#FFDD00' '#FFD900' '#FFD500' '#FFD000' '#FFCC00' '#FFC800' '#FFC400' '#FFBF00' '#FFBB00' '#FFB700' '#FFB300' '#FFAE00' '#FFAA00' '#FFA600' '#FFA200' '#FF9D00' '#FF9900' '#FF9500' '#FF9100' '#FF8C00' '#FF8800' '#FF8400' '#FF8000' '#FF7B00' '#FF7700' '#FF7300' '#FF6E00' '#FF6A00' '#FF6600' '#FF6200' '#FF5D00' '#FF5900' '#FF5500' '#FF5100' '#FF4C00' '#FF4800' '#FF4400' '#FF4000' '#FF3B00' '#FF3700' '#FF3300' '#FF2F00' '#FF2A00' '#FF2600' '#FF2200' '#FF1D00' '#FF1900' '#FF1500' '#FF1100' '#FF0C00' '#FF0800' '#FF0400' '#FF0000')
]

{ #category : #accessing }
WAPerformanceFunctionalTest class >> referenceDict [
	| dict |
	dict := Dictionary new.
	dict at: #anchor put: 'Anchor Test' -> 1800.
	dict at: #script put: 'Script Test' -> 5300.
	dict at: #table put: 'Table Test' -> 5280.
	dict at: #lineBreak put: 'Line Break Test' -> 4550.
	dict at: #callback put: 'Callback Test' -> 2130.
	dict at: #form put: 'Form Test' -> 270.
	dict at: #id put: 'Generate ID''s Test' -> 4300.
	dict at: #seasideText put: 'Seaside Text Rendering Test' -> 6500.
	dict at: #nativeText put: 'Native Text Rendering Test' -> 26000.
	dict at: #seasideBR put: 'Seaside (br) Rendering Test' -> 23000.
	dict at: #nativeBR put: 'Native (br) Rendering Test' -> 78000.
	^ dict
]

{ #category : #accessing }
WAPerformanceFunctionalTest class >> scale [
	^ 0.8
]

{ #category : #private }
WAPerformanceFunctionalTest >> colorFor: spi [
	| colors max |
	colors := self class colors.
	max := 800.
	spi >= max ifTrue: [ ^ colors first ].
	spi = 0 ifTrue: [ ^ colors last ].
	^ colors at: (colors size - (spi / max * colors size) greaseInteger)
]

{ #category : #initialization }
WAPerformanceFunctionalTest >> initialize [
	super initialize.
	builder := WAHtmlCanvas builder
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderAnchorsOn: canvas [
	self renderInline: [ :html | 
		html unorderedList: [
			html listItem: [
					html anchor
						name: 'name';
						callback: [ ];
						with: 'Anchor' ] ] ]
		factor: 1
		key: #anchor
		on: canvas

]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderBreakOn: canvas [
	self
		renderInline: [ :html | html break ]
		factor: 1 / 50
		key: #seasideBR
		on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderCallbackOn: canvas [
	self
		renderInline: [ :html | 
			html button
				callback: [  ];
				with: '' ]
		key: #callback
		on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderContentOn: html [ 
	duration := 0.
	referenceDict ifNil: [ referenceDict := self class referenceDict ].
	self renderExplanationOn: html.
	self renderAnchorsOn: html.
	self renderScriptOn: html.
	self renderTableOn: html.
	self renderLineBreaksOn: html.
	self renderCallbackOn: html.
	self renderFormOn: html.
	self renderIdTestOn: html.
	self renderTextOn: html.
	self renderHtmlTextOn: html.
	self renderBreakOn: html.
	self renderNativeBreakOn: html.
	html div
		class: 'result';
		with: 'Seaside Performance Index: ' , duration greaseString
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'Test rendering speed (Reference: Intel Core I5-2500K @ 3.3GHz Seaside 3.0; Cog VM,  Pharo 1.3, ~ 9400 SPI)'
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderFormOn: canvas [ 
	self 
		renderInline: [ :html | 
			html form: [
				html button value: 'OK'.
				html fileUpload.
				html select
					list: #('a' 'b' );
					labels: [ :v | v greaseString ].
				html radioButton.
				html textInput
					size: 20;
					value: ''.
				html textArea
					rows: 3;
					columns: 17;
					value: ''.
				html checkbox value: true.
				html passwordInput value: 'pw' ] ]
		key: #form
		on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderHtmlTextOn: canvas [
	self
		renderInline: [ :html | html html: 'abcdefghijklmnopqrstuvwxyz&amp;0123456789' ]
		factor: 1 / 50
		key: #nativeText
		on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderIdTestOn: canvas [
	self
		renderInline: [ :html | 
			| id1 |
			id1 := html nextId.
			html span
				id: id1;
				with: id1.
			html break ]
		key: #id
		on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderInline: aBlock factor: factor key: key on: html [ 
	| startTime endTime count backColor anAssociation title referenceValue spi context document renderer stream runTime scale |
	scale := self class scale.
	count := 0.
	runTime := 200.
	anAssociation := referenceDict 
		at: key
		ifAbsent: [ 'Undefined' -> 100000 ].
	title := anAssociation key.
	referenceValue := anAssociation value.
	stream := WriteStream on: String new.
	document := builder documentClass 
		on: stream
		codec: builder codec.
	context := WARenderContext new.
	context document: document.
	context
		actionUrl: builder actionUrl;
		resourceUrl: builder resourceUrl.
	renderer := builder rendererClass context: context.
	builder 
		openDocument: document
		context: context.
	html div
		class: 'bench';
		with: [
			html heading: title.
			startTime := Time millisecondClockValue.
			endTime := startTime + runTime.
			[ Time millisecondClockValue < endTime ] whileTrue: [
				count := count + 1.
				renderer
					render: aBlock;
					flush ] ].
	builder closeDocument: document.
	spi := (count / referenceValue * (10000 / runTime)) rounded.
	backColor := self colorFor: spi.
	duration := duration + spi.
	html div
		class: 'spi';
		with: [
			html big: spi greaseString , ' SPI'.
			html span
				class: 'iteration';
				with: '(' , count greaseString , ' iterations)'.
			html break.
			html div
				class: 'rect';
				style: 'background:' , backColor , ';width:' , (spi * scale) greaseString , 'px' ].
	html div style: 'clear:both'
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderInline: aBlock key: key on: html [
	self renderInline: aBlock factor: 1 key: key on: html
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderLineBreaksOn: canvas [
	self
		renderInline: [ :html |
			html withLineBreaks: 'a
			b
			c' ]
		key: #lineBreak
		on: canvas
		
	
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderNativeBreakOn: canvas [
	self
		renderInline: [ :html | html html: '<br/>' ]
		factor: 1 / 50
		key: #nativeBR
		on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderScriptOn: canvas [
	self renderInline: [ :html | html script: 'self.close()' ] key: #script on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderTableOn: canvas [
	self
		renderInline: [ :html | html table: [ html tableRow: [ html tableData: 'data' ] ] ] 
		key: #table
		on: canvas
]

{ #category : #rendering }
WAPerformanceFunctionalTest >> renderTextOn: canvas [
	self
		renderInline: [ :html | html text: 'abcdefghijklmnopqrstuvwxyz&0123456789' ]
		factor: 1 / 50
		key: #seasideText
		on: canvas
]

{ #category : #hooks }
WAPerformanceFunctionalTest >> style [
	^ 'h1 {margin:0;padding:0;font-size:1.5em}
	div.bench {padding-left:4px;position:relative;line-height:36px;width:320px;border: 1px solid #ccc;overflow:hidden;float:left;margin-bottom:2px}
	div.result {margin:6px;color:#008aff;font-size:200%;font-weight:bold}
	span.iteration {margin-left:6px}
	div.rect {position:relative;border: 1px solid #ccc;;height:12px}
	.spi{float:left;padding-left:4px;padding-top:2px}
	'
]
