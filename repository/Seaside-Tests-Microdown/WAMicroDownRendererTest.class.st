Class {
	#name : 'WAMicroDownRendererTest',
	#superclass : 'TestCase',
	#category : 'Seaside-Tests-Microdown',
	#package : 'Seaside-Tests-Microdown'
}

{ #category : 'asserting' }
WAMicroDownRendererTest >> assertMicroDown: aMicrodownString rendersTo: htmlString [

	| renderedString |
	renderedString := WAHtmlCanvas builder render:[ :html | html microDown: aMicrodownString ].
	self assert: renderedString equals: htmlString.
]

{ #category : 'basic tests' }
WAMicroDownRendererTest >> testHeader [

	self
		assertMicroDown: '# Heading 1'
		rendersTo: '<h1>Heading 1</h1>'.

	self
		assertMicroDown: '## Heading 2'
		rendersTo: '<h2>Heading 2</h2>'.

	self
		assertMicroDown: '### Heading 3'
		rendersTo: '<h3>Heading 3</h3>'.
]

{ #category : 'basic tests' }
WAMicroDownRendererTest >> testLink [

	self
		assertMicroDown: '[Programmatic HTML generation](https://github.com/SeasideSt/Seaside/wiki/Generating-HTML)'
		rendersTo: '<p><a href="https://github.com/SeasideSt/Seaside/wiki/Generating-HTML">Programmatic HTML generation</a></p>'
]

{ #category : 'basic tests' }
WAMicroDownRendererTest >> testOnRender [

	| microDownString renderedString |
	microDownString := '[Programmatic HTML generation](https://github.com/SeasideSt/Seaside/wiki/Generating-HTML)'.
	renderedString := WAHtmlCanvas builder render:[ :html | WAMicroDownRenderer on: html render: microDownString ].
	self assert: renderedString equals: '<p><a href="https://github.com/SeasideSt/Seaside/wiki/Generating-HTML">Programmatic HTML generation</a></p>'
]

{ #category : 'basic tests' }
WAMicroDownRendererTest >> testOrderedList [

	self
		assertMicroDown: '1. Item 1 
2. Item 2
3. Item 3'
		rendersTo: '<ol><li>Item 1</li><li>Item 2</li><li>Item 3</li></ol>'
]

{ #category : 'basic tests' }
WAMicroDownRendererTest >> testTable [

	self
		assertMicroDown: 
'| aaa | bbb
| ccc | ddd'
		rendersTo: '<table><tr><td>aaa</td><td>bbb</td></tr><tr><td>ccc</td><td>ddd</td></tr></table>'
]

{ #category : 'basic tests' }
WAMicroDownRendererTest >> testText [

	self
		assertMicroDown: 'Seaside provides a layered set of abstractions over HTTP and HTML that let you build highly interactive web applications quickly, reusably and maintainably. It is based on Smalltalk, a proven and robust language that is implemented by  different vendors.'
		rendersTo: '<p>Seaside provides a layered set of abstractions over HTTP and HTML that let you build highly interactive web applications quickly, reusably and maintainably. It is based on Smalltalk, a proven and robust language that is implemented by  different vendors.</p>'
]

{ #category : 'basic tests' }
WAMicroDownRendererTest >> testUnorderedList [

	self
		assertMicroDown: '- Item 1 
- Item 2
- Item 3'
		rendersTo: '<ul><li>Item 1</li><li>Item 2</li><li>Item 3</li></ul>'
]
