Class {
	#name : #JSRenderingTest,
	#superclass : #JSObjectTest,
	#category : 'Javascript-Tests-Core'
}

{ #category : #tests }
JSRenderingTest >> testAddToEvent [
	self 
		assert: [ :html | html div onClick: self mock ]
		renders: '<div onclick="mock"></div>'.
	self 
		assert: [ :html | html div onMouseOut: self mock ]
		renders: '<div onmouseout="mock"></div>'.
	self 
		assert: [ :html | html div onKeyUp: self mock ]
		renders: '<div onkeyup="mock"></div>'
]

{ #category : #tests }
JSRenderingTest >> testAddToScript [
	self 
		assert: [ :html | html script: self mock ]
		renders: '<script type="text/javascript">mock</script>'
]

{ #category : #tests }
JSRenderingTest >> testJavascript [
	self 
		assert: [ :html | html div onClick: (html javascript add: self mock; add: self mock; yourself) ]
		renders: '<div onclick="mock;mock"></div>'
]

{ #category : #tests }
JSRenderingTest >> testLogger [
	self 
		assert: [ :html | html div onClick: (html logger log: 'Foo') ]
		renders: '<div onclick="console.log(&quot;Foo&quot;)"></div>'
]

{ #category : #tests }
JSRenderingTest >> testPassenger [
	self 
		assert: [ :html | html div passenger: self ]
		renders: '<div id="id1"></div>'.
	self 
		assert: [ :html | 
			html div passenger: self.
			html div passenger: self class ]
		renders: '<div id="id1"></div><div id="id2"></div>'
]

{ #category : #tests }
JSRenderingTest >> testRenderOn [
	self 
		assert: [ :html | html html: (html javascript render: 123) ]
		renders: '123'.
	self 
		assert: [ :html | html html: (html javascript render: 'abc') ]
		renders: 'abc'.
	self 
		assert: [ :html | html html: (html javascript render: [ :h | h div ]) ]
		renders: '<div></div>'
]

{ #category : #tests }
JSRenderingTest >> testScript [
	self 
		assert: [ :html | html div script: self mock ]
		renders: '<div></div><script type="text/javascript">mock;</script>'
]

{ #category : #tests }
JSRenderingTest >> testScriptOn [
	self 
		assert: [ :html | html html: (html javascript script: [ :s | ]) ]
		renders: ''.
	self 
		assert: [ :html | html html: (html javascript script: [ :s | s add: self mock ]) ]
		renders: 'mock'.
	self 
		assert: [ :html | html html: (html javascript script: [ :s | s add: self mock; add: self mock ]) ]
		renders: 'mock;mock'
]
