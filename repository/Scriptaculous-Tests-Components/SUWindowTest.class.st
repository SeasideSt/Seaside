Class {
	#name : #SUWindowTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'windows'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUWindowTest >> children [
	^ windows
]

{ #category : #accessing }
SUWindowTest >> coreClass [
	^ SUWindow
]

{ #category : #initialization }
SUWindowTest >> initialize [
	super initialize.
	windows := OrderedCollection 
					with: ((SUWindow on: [ :w | SUCounterTest on: 10 ]) id: 'window_1'; zIndex: 1000; title: 'Window 1'; yourself)
					with: ((SUWindow on: [ :w | SUFormTest new ]) id: 'window_2';
								zIndex: 1001;
								origin: (300@100);
								extent: 500@240;
								title: 'Window 2';
								yourself)
					with: ((SUWindow on: [ :w | SUTooltipTest new ]) id: 'window_3';
								updateBlock: [ :w :model | model textWithKey: (w tooltipKey) ];
								zIndex: 1003;
								extent: 150@45;
								title: 'Tooltip';
								closeButtonEnabled: false;
								minimizeButtonEnabled: false;
								yourself).
	windows add: ((SUWindow on: [ :w | SUDialogTest new
											answer: [ :script | 
												script alert: 'Window will be closed'. 
												script add: (JSStream on: '$("overlay").hide()').
												w closeOn: script ];
											yourself ]) 
										id: 'dialog_window';
										closeButtonEnabled: false;
										minimizeButtonEnabled: false;
										zIndex: 9999;
										title: 'Window 4'; yourself)

]

{ #category : #rendering }
SUWindowTest >> renderContentOn: html [ 
	| aWindow |
	html div id: 'overlay'.
	html big: 'Window Test:'.
	html space.
	html anchor
		onClick: (html prototype evaluator callback: [ : script | windows first openOn: script ]) ;
		with: 'Open window 1'.
	html space: 2.
	html anchor
		onClick: (html prototype evaluator callback: [ : script | (windows at: 2) openOn: script ]) ;
		with: 'Open window 2'.
	html space: 2.
	html anchor
		onClick: (html prototype evaluator
					callback: [ : script | 
						script add: (JSStream on: 'Element.fullscreen("overlay")'). 
						(windows at: 4) openOn: script.
						script add: (JSStream on: 'Element.center("dialog_window")') ]) ;
		with: 'Open dialog window'.
	html space: 2.
	aWindow := windows at: 3.
	html anchor
		class: 'tt' ;
		attributeAt: 'rel'
			put: 'ok' ;
		with: 'Show tooltip 1'.
	html space: 2.
	html anchor
		class: 'tt' ;
		attributeAt: 'rel'
			put: 'hello' ;
		with: 'Show tooltip 2'.
	html space: 2.
	html anchor
		class: 'tt' ;
		attributeAt: 'rel'
			put: 'illegal' ;
		with: 'Show tooltip 3'.
	windows do: [ :w | html render: w ].
	self 
		tooltipScriptOn: html
		window: aWindow
]

{ #category : #hooks }
SUWindowTest >> script [
	^ 'Object.extend(Position, {
	windowBounds: function() {
		var x = window.innerWidth
			|| document.documentElement.clientWidth
			|| document.body.clientWidth
			|| 0;
		var y = window.innerHeight
			|| document.documentElement.clientHeight
			|| document.body.clientHeight
			|| 0;
		return [x, y];
	}
});
Object.extend(Element, {
	fullscreen: function(element) {
		element = $(element);
		element.show();
		element.style.position = "absolute";
		element.style.left = element.style.top = 0;
		element.style.width = "100%";
		element.style.height = "5000px";
	},
	center: function(element) {
		element = $(element);
		var extent = Element.getDimensions(element);
		var bounds = Position.windowBounds();
		var x = (bounds[0] - extent.width) / 2;
		var y = (bounds[1] - extent.height) / 2;
		x = x < 0 ? 0 : x; y = y < 0 ? 0 : y;
		element.style.position = "absolute";
		element.style.left = x + "px";
		element.style.top = y + "px";
	}
});'
]

{ #category : #hooks }
SUWindowTest >> style [
	^ '
div#overlay {
	z-index: 9998;
	background-color: #336699;
	filter: alpha(opacity=30);
	-moz-opacity: 0.3;
	opacity: 0.3;
}
div#overlay[id] { position: fixed; }
'
]

{ #category : #scripting }
SUWindowTest >> tooltipScriptOn: html window: aWindow [
	"add an event handler to all anchors which have the class tt"
	"use the html rel attribute as tooltip index"
	
	html document addLoadScript: (html prototype selector
     	add: 'a.tt';
     	do: [ :each | each element on: 'mouseover' do: ((JSStream on: 'event.target._showState = true'),
				((JSStream on: 'event.target._showState') then:
					(html prototype evaluator 
						callback: [ :v |
								| values |
								values := v substrings: ','.
								aWindow originX: values first y: (values at: 2) ; tooltipKey: (values at: 3) ]
						value: (JSStream on: '[event.clientX,event.clientY,event.target.rel]');
						callback: [ :script | aWindow openOn: script hidden: true ];
						onComplete: ((JSStream on: 'event.target._showState') then: (html prototype element id: aWindow windowId; show)));
						setTimeout: 2000)).
				each element on: 'mouseout' do: 	((JSStream on: 'event.target._showState = false'),
					((html prototype element id: aWindow windowId; visible) then:
						(html prototype evaluator 
							callback: [ :script | aWindow closeOn: script ]))) ])

	
]
