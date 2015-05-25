tests-tags-forms
testButton
	self
		assert: [ :html | html button ]
		gives: '<button type="submit"></button>'.
	self
		assert: [ :html | html button text: 'foo' ]
		gives: '<button type="submit">foo</button>'.
	self
		assert: [ :html | html button with: 'foo' ]
		gives: '<button type="submit">foo</button>'.
	self
		assert: [ :html | html button beSubmit ]
		gives: '<button type="submit"></button>'.
	self
		assert: [ :html | html button bePush ]
		gives: '<button type="button"></button>'.
	self
		assert: [ :html | html button beReset ]
		gives: '<button type="reset"></button>'