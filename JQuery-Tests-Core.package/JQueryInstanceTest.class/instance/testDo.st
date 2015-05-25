tests-accessors
testDo
	self
		assert: ((self jQuery: 'div')
			do: [ :each | each remove ])
		equals: self function , '("div").each(function(){' , self function , '(this).remove()})'.
	self
		assert: ((self jQuery: 'div')
			do: [ :each :index | each text: index ])
		equals: self function , '("div").each(function(){' , self function , '(this).text(arguments[0])})'