tests-tags-forms
testButton
	self
		assert: [ :html | html button ]
		gives: '<button type="submit" class="submit"></button>'.
	self
		assert: [ :html | html button text: 'foo' ]
		gives: '<button type="submit" class="submit">foo</button>'.
	self
		assert: [ :html | html button with: 'foo' ]
		gives: '<button type="submit" class="submit">foo</button>'.
	self
		assert: [ :html | html button beSubmit ]
		gives: '<button type="submit" class="submit"></button>'.
	self
		assert: [ :html | html button bePush ]
		gives: '<button type="button" class="button"></button>'.
	self
		assert: [ :html | html button beReset ]
		gives: '<button type="reset" class="reset"></button>'