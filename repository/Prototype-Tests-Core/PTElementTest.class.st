Class {
	#name : #PTElementTest,
	#superclass : #JSObjectTest,
	#category : 'Prototype-Tests-Core'
}

{ #category : #accessing }
PTElementTest class >> packageNamesUnderTest [
	^ #('Prototype-Core')
]

{ #category : #utilities }
PTElementTest >> assertEnumerable: aBlock prefix: aString [
	self assert: (aBlock value isKindOf: PTEnumerable).
	self
		assert: (aBlock value allSatisfy: [ :each | each element visible ])
		equals: aString , '.all(function(){return $(arguments[0]).visible()})'.
	self
		assert: (aBlock value anySatisfy: [ :each | each element visible not ])
		equals: aString , '.any(function(){return !$(arguments[0]).visible()})'.
	self
		assert: (aBlock value collect: [ :each | each element up ])
		equals: aString , '.map(function(){return $(arguments[0]).up()})'.
	self
		assert: (aBlock value detect: [ :each | each element empty ])
		equals: aString , '.find(function(){return $(arguments[0]).empty()})'.
	self
		assert: (aBlock value detectMax: [ :each | each element width ])
		equals: aString , '.max(function(){return $(arguments[0]).getWidth()})'.
	self
		assert: (aBlock value detectMin: [ :each | each element height ])
		equals: aString , '.min(function(){return $(arguments[0]).getHeight()})'.
	self
		assert: (aBlock value select: [ :each | each element empty ])
		equals: aString , '.findAll(function(){return $(arguments[0]).empty()})'.
	self
		assert: (aBlock value reject: [ :each | each element empty not ])
		equals: aString , '.reject(function(){return !$(arguments[0]).empty()})'.
	self
		assert: (aBlock value sortBy: [ :each | each element height ])
		equals: aString , '.sortBy(function(){return $(arguments[0]).getHeight()})'.

	self
		assert: (aBlock value grep: '[a-z]+')
		equals: aString , '.grep("[a-z]+")'.
	self
		assert: (aBlock value include: nil)
		equals: aString , '.include(null)'.
	self
		assert: (aBlock value invoke: 'zork')
		equals: aString , '.invoke("zork")'.
	self
		assert: (aBlock value invoke: 'zork' with: 1)
		equals: aString , '.invoke("zork",1)'.
	self
		assert: (aBlock value invoke: 'zork' withAll: #(1 2))
		equals: aString , '.invoke("zork",1,2)'.
	self
		assert: (aBlock value pluck: 'id')
		equals: aString , '.pluck("id")'.
	self
		assert: (aBlock value size)
		equals: aString , '.size()'
]

{ #category : #accessing }
PTElementTest >> element [
	^ PTElement context: self renderContext
]

{ #category : #accessing }
PTElementTest >> event [
	^ PTEvent context: self renderContext
]

{ #category : #accessing }
PTElementTest >> form [
	^ PTForm context: self renderContext
]

{ #category : #accessing }
PTElementTest >> formElement [
	^ PTFormElement context: self renderContext
]

{ #category : #accessing }
PTElementTest >> formElementObserver [
	^ PTFormElementObserver context: self renderContext
]

{ #category : #accessing }
PTElementTest >> formObserver [
	^ PTFormObserver context: self renderContext
]

{ #category : #accessing }
PTElementTest >> insertion [
	^ PTInsertion context: self renderContext
]

{ #category : #accessing }
PTElementTest >> ptSelector [
	^ PTSelector context: self renderContext
]

{ #category : #tests }
PTElementTest >> testDisplaying [
	self
		assert: (self element hide)
		equals: '$(this).hide()'.
	self
		assert: (self element id: 'foo'; show)
		equals: '$("foo").show()'.
	self
		assert: (self element toggle)
		equals: '$(this).toggle()'.
	self
		assert: (self element id: 'bar'; scroll)
		equals: '$("bar").scrollTo()'
]

{ #category : #tests }
PTElementTest >> testEnumerating [
	self
		assertEnumerable: [ self element ancestors ]
		prefix: '$(this).ancestors()'.
	self
		assertEnumerable: [ self element childElements ]
		prefix: '$(this).childElements()'.
	self
		assertEnumerable: [ self element descendants ]
		prefix: '$(this).descendants()'.
	self
		assertEnumerable: [ self element nextSiblings ]
		prefix: '$(this).nextSiblings()'.
	self
		assertEnumerable: [ self element previousSiblings ]
		prefix: '$(this).previousSiblings()'.
	self
		assertEnumerable: [ self element select: 'div.foo' ]
		prefix: '$(this).select("div.foo")'.
	self
		assertEnumerable: [ self element siblings ]
		prefix: '$(this).siblings()'
]

{ #category : #'tests-events' }
PTElementTest >> testEventActions [
	self
		assert: (self event stop)
		equals: 'Event.stop(event)'.
	self
		assert: (self event observe: 'foo' on: 'click' do: self element toggle)
		equals: 'Event.observe("foo","click",function(event){$(this).toggle()})'
]

{ #category : #'tests-events' }
PTElementTest >> testEventFire [
	self
		assert: (self element fire: 'foo')
		equals: '$(this).fire("foo")'.
	self
		assert: (self element fire: 'foo' with: 123)
		equals: '$(this).fire("foo",123)'
]

{ #category : #'tests-events' }
PTElementTest >> testEventOnDo [
	self
		assert: (self element on: 'click' do: self event stop)
		equals: '$(this).observe("click",function(event){Event.stop(event)})'.
	self
		assert: (self element id: 'foo'; on: 'mouseout' do: self element hide)
		equals: '$("foo").observe("mouseout",function(event){$(this).hide()})'
]

{ #category : #'tests-events' }
PTElementTest >> testEventQuerying [
	self
		assert: (self event element)
		equals: 'Event.element(event)'.
	self
		assert: (self event event: 'bar'; x)
		equals: 'Event.pointerX("bar")'.
	self
		assert: self event y
		equals: 'Event.pointerY(event)'
]

{ #category : #'tests-events' }
PTElementTest >> testEvery [
	self
		assert: (('alert' asFunction: #('ok')) every: 2 "seconds")
		equals: 'new PeriodicalExecuter(function(){function(ok){alert}},2)'
]

{ #category : #'tests-form' }
PTElementTest >> testForm [
	self
		assert: self form disable
		equals: '$(this).disable()'.
	self
		assert: self form enable
		equals: '$(this).enable()'.
	self
		assert: self form findFirstElement
		equals: '$(this).findFirstElement()'.
	self
		assert: self form focusFirstElement
		equals: '$(this).focusFirstElement()'.
	self
		assert: self form request
		equals: '$(this).request()'.
	self
		assert: self form reset
		equals: '$(this).reset()'.
	self
		assert: (self form id: 'foo'; serialize)
		equals: '$("foo").serialize()'
]

{ #category : #'tests-form' }
PTElementTest >> testFormElement [
	self
		assert: self formElement activate
		equals: '$(this).activate()'.
	self
		assert: self formElement clear
		equals: '$(this).clear()'.
	self
		assert: self formElement disable
		equals: '$(this).disable()'.
	self
		assert: self formElement enable
		equals: '$(this).enable()'.
	self
		assert: self formElement focus
		equals: '$(this).focus()'.
	self
		assert: self formElement present
		equals: '$(this).present()'.
	self
		assert: self formElement select
		equals: '$(this).select()'.
	self
		assert: (self formElement id: 'foo'; serialize)
		equals: '$("foo").serialize()'.
	self
		assert: (self formElement id: 'foo'; value)
		equals: '$("foo").getValue()'
]

{ #category : #'tests-observers' }
PTElementTest >> testFormElementObserver [
	self 
		assert: self formElementObserver
		equals: 'new Form.Element.Observer(this,1,function(){})'.
	self 
		assert: (self formElementObserver 
			id: 'foo';
			frequency: 2;
			function: (JSFunction context: self renderContext) refresh)
		equals: 'new Form.Element.Observer("foo",2,function(element,value){window.location="http://www.seaside.st/?_s=1&_k=a"})'
]

{ #category : #'tests-form' }
PTElementTest >> testFormEnumerating [
	self
		assertEnumerable: [ self form elements ]
		prefix: '$(this).getElements()'.
	self
		assertEnumerable: [ self form inputs ]
		prefix: '$(this).getInputs()'
]

{ #category : #'tests-observers' }
PTElementTest >> testFormObserver [
	self 
		assert: self formObserver
		equals: 'new Form.Observer(this,1,function(){})'.
	self 
		assert: (self formObserver 
			id: 'foo';
			frequency: 2;
			function: (JSFunction context: self renderContext) refresh)
		equals: 'new Form.Observer("foo",2,function(element,value){window.location="http://www.seaside.st/?_s=1&_k=a"})'
]

{ #category : #tests }
PTElementTest >> testGeometric [
	self
		assert: (self element absolutize)
		equals: '$(this).absolutize()'.
	self
		assert: (self element clonePosition: 'foo')
		equals: '$(this).clonePosition("foo")'.
	self
		assert: (self element cumulativeOffset)
		equals: '$(this).cumulativeOffset()'.
	self
		assert: (self element cumulativeScrollOffset)
		equals: '$(this).cumulativeScrollOffset()'.
	self
		assert: (self element dimensions)
		equals: '$(this).getDimensions()'.
	self
		assert: (self element height)
		equals: '$(this).getHeight()'.
	self
		assert: (self element makeClipping)
		equals: '$(this).makeClipping()'.
	self
		assert: (self element makePositioned)
		equals: '$(this).makePositioned()'.
	self
		assert: (self element offsetParent)
		equals: '$(this).getOffsetParent()'.
	self
		assert: (self element positionedOffset)
		equals: '$(this).positionedOffset()'.
	self
		assert: (self element relativize)
		equals: '$(this).relativize()'.
	self
		assert: (self element undoClipping)
		equals: '$(this).undoClipping()'.
	self
		assert: (self element undoPositioned)
		equals: '$(this).undoPositioned()'.
	self
		assert: (self element viewportOffset)
		equals: '$(this).viewportOffset()'.
	self
		assert: (self element width)
		equals: '$(this).getWidth()'
]

{ #category : #'tests-insertion' }
PTElementTest >> testInsertion [
	| element |
	element := self insertion top.
	self assert: element equals: 'Insertion.Top'.

	element := self insertion bottom.
	self assert: element equals: 'Insertion.Bottom'.

	element := self insertion before.
	self assert: element equals: 'Insertion.Before'.

	element := self insertion after.
	self assert: element equals: 'Insertion.After'
]

{ #category : #'tests-insertion' }
PTElementTest >> testInsertionBasic [
	| element |
	element := self insertion top; with: 'foo'.
	self assert: element equals: 'new Insertion.Top(this,"foo")'.

	element := self insertion bottom; id: 'bar'; with: 'foo'.
	self assert: element equals: 'new Insertion.Bottom("bar","foo")'.

	element := self insertion before; with: 'foo'.
	self assert: element equals: 'new Insertion.Before(this,"foo")'.

	element := self insertion after; id: 'bar'; with: 'foo'.
	self assert: element equals: 'new Insertion.After("bar","foo")'
]

{ #category : #'tests-insertion' }
PTElementTest >> testInsertionShort [
	| element |
	element := self insertion top: 'foo'.
	self assert: element equals: 'new Insertion.Top(this,"foo")'.

	element := self insertion id: 'bar'; bottom: 'foo'.
	self assert: element equals: 'new Insertion.Bottom("bar","foo")'.

	element := self insertion before: 'foo'.
	self assert: element equals: 'new Insertion.Before(this,"foo")'.

	element := self insertion id: 'bar'; after: 'foo'.
	self assert: element equals: 'new Insertion.After("bar","foo")'
]

{ #category : #'tests-insertion' }
PTElementTest >> testInsertionWith [
	self
		assert: (self insertion id: 'foo'; top: 'bar')
		equals: 'new Insertion.Top("foo","bar")'.
	self
		assert: (self insertion bottom: 'bar')
		equals: 'new Insertion.Bottom(this,"bar")'.
	self
		assert: (self insertion id: 'foo'; before: 'bar')
		equals: 'new Insertion.Before("foo","bar")'.
	self
		assert: (self insertion after: 'bar')
		equals: 'new Insertion.After(this,"bar")'
]

{ #category : #tests }
PTElementTest >> testModifying [
	self
		assert: (self element cleanWhitespace)
		equals: '$(this).cleanWhitespace()'.
	self
		assert: (self element id: 'foo'; remove)
		equals: '$("foo").remove()'.
	self
		assert: (self element wrap: 'p')
		equals: '$(this).wrap("p",{})'.
	self
		assert: (self element wrap: 'p' attributes: (Dictionary new at: 'id' put: 'foo'; yourself))
		equals: '$(this).wrap("p",{"id":"foo"})'
]

{ #category : #tests }
PTElementTest >> testModifyingInsert [
	self
		assert: (self element insert: 1)
		equals: '$(this).insert("1")'.
	self
		assert: (self element insertAfter: [ :r | r div ])
		equals: '$(this).insert({"after":"<div></div>"})'.
	self
		assert: (self element insertBefore: 'abc')
		equals: '$(this).insert({"before":"abc"})'.
	self
		assert: (self element insertTop: [ :r | r span: 5 ])
		equals: '$(this).insert({"top":"<span>5</span>"})'.
	self
		assert: (self element insertBottom: '5')
		equals: '$(this).insert({"bottom":"5"})'
]

{ #category : #tests }
PTElementTest >> testModifyingReplace [
	self
		assert: (self element replace: 'foo')
		equals: '$(this).replace("foo")'.
	self
		assert: (self element replace: [ :r | r div id: 'foo' ])
		equals: '$(this).replace("<div id=\"foo\"></div>")'
]

{ #category : #tests }
PTElementTest >> testModifyingUpdate [
	self
		assert: (self element id: 'foo'; update: 'bar')
		equals: '$("foo").update("bar")'.
	self
		assert: (self element update: [ :r | r div: 'bar' ])
		equals: '$(this).update("<div>bar</div>")'
]

{ #category : #tests }
PTElementTest >> testModifyingWrap [
	self
		assert: (self element wrap: 'p')
		equals: '$(this).wrap("p",{})'.
	self
		assert: (self element wrap: 'p' attributes: (Dictionary new at: 'id' put: 'foo'; yourself))
		equals: '$(this).wrap("p",{"id":"foo"})'
]

{ #category : #tests }
PTElementTest >> testNavigationDown [
	self
		assert: (self element down)
		equals: '$(this).down()'.
	self
		assert: (self element down: 'div')
		equals: '$(this).down("div")'.
	self
		assert: (self element down: 'div' at: 2)
		equals: '$(this).down("div",2)'
]

{ #category : #tests }
PTElementTest >> testNavigationNext [
	self
		assert: (self element next)
		equals: '$(this).next()'.
	self
		assert: (self element next: 'div')
		equals: '$(this).next("div")'.
	self
		assert: (self element next: 'div' at: 2)
		equals: '$(this).next("div",2)'
]

{ #category : #tests }
PTElementTest >> testNavigationPrevious [
	self
		assert: (self element previous)
		equals: '$(this).previous()'.
	self
		assert: (self element previous: 'div')
		equals: '$(this).previous("div")'.
	self
		assert: (self element previous: 'div' at: 2)
		equals: '$(this).previous("div",2)'
]

{ #category : #tests }
PTElementTest >> testNavigationUp [
	self
		assert: (self element up)
		equals: '$(this).up()'.
	self
		assert: (self element up: 'div')
		equals: '$(this).up("div")'.
	self
		assert: (self element up: 'div' at: 2)
		equals: '$(this).up("div",2)'
]

{ #category : #tests }
PTElementTest >> testQuerying [
	self
		assert: (self element descendantOf: 'foo')
		equals: '$(this).descendantOf("foo")'.
	self
		assert: (self element empty)
		equals: '$(this).empty()'.
	self
		assert: (self element firstDescendant)
		equals: '$(this).firstDescendant()'.
	self
		assert: (self element identify)
		equals: '$(this).identify()'.
	self
		assert: (self element match: 'first-child')
		equals: '$(this).match("first-child")'
]

{ #category : #'tests-rendering' }
PTElementTest >> testRenderedHtml [
	self 
		assert: [ :html | html div script: (html scriptaculous element update: [ :r | r span ]) ]
		renders: '<div id="id1"></div><script type="text/javascript">$("id1").update("<span></span>");</script>'
]

{ #category : #'tests-rendering' }
PTElementTest >> testRenderedHtmlWithScripts [
	self
		assert: [ :html |
			html div script: (html scriptaculous element remove).
			html div script: (html scriptaculous element update: [ :r | r span ]) ]
		renders: '<div id="id1"></div><div id="id2"></div><script type="text/javascript">$("id1").remove();$("id2").update("<span></span>");</script>'
]

{ #category : #tests }
PTElementTest >> testSelector [
	| selector |
	selector := self ptSelector add: '*'.
	self assert: selector equals: '$$("*")'.

	selector := self ptSelector add: 'div.zork'; add: 'p#zork'.
	self assert: selector equals: '$$("div.zork","p#zork")'.

	self
		assertEnumerable: [ self ptSelector add: 'p>a' ]
		prefix: '$$("p>a")'
]

{ #category : #tests }
PTElementTest >> testStylingClasses [
	self
		assert: (self element id: 'foo'; addClassName: 'bar')
		equals: '$("foo").addClassName("bar")'.
	self
		assert: (self element id: 'foo'; hasClassName: 'bar')
		equals: '$("foo").hasClassName("bar")'.
	self
		assert: (self element removeClassName: 'bar')
		equals: '$(this).removeClassName("bar")'.
	self
		assert: (self element id: 'foo'; toggleClassName: 'bar')
		equals: '$("foo").toggleClassName("bar")'
]

{ #category : #tests }
PTElementTest >> testStylingStyles [
	self
		assert: (self element id: 'foo'; styleAt: 'width')
		equals: '$("foo").getStyle("width")'.
	self
		assert: (self element styleAt: 'height')
		equals: '$(this).getStyle("height")'.
	self
		assert: (self element id: 'foo'; styleAt: 'width' put: '100px')
		equals: '$("foo").setStyle({"width":"100px"})'.
	self
		assert: (self element styleAt: 'background-color' put: Color white)
		equals: '$(this).setStyle({"background-color":"#FFFFFF"})'
]
