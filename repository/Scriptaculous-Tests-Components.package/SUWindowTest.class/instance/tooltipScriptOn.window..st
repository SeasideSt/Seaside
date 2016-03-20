scripting
tooltipScriptOn: html window: aWindow
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
						timeout: 2000)).
				each element on: 'mouseout' do: 	((JSStream on: 'event.target._showState = false'),
					((html prototype element id: aWindow windowId; visible) then:
						(html prototype evaluator 
							callback: [ :script | aWindow closeOn: script ]))) ])

	