tests-tags-forms
testTextArea
	self
		assert: [ :html | html textArea ]
		gives: '<textarea rows="auto" cols="auto"></textarea>'.
	self
		assert: [ :html | html textArea columns: 4 ]
		gives: '<textarea rows="auto" cols="4"></textarea>'.
	self
		assert: [ :html | html textArea rows: 40 ]
		gives: '<textarea rows="40" cols="auto"></textarea>'.
	self
		assert: [ :html | html textArea callback: [ :value | ] ]
		gives: '<textarea rows="auto" cols="auto" name="1"></textarea>'.
	self
		assert: [ :html | html textArea: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea text: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea value: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea with: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea callback: [ :value | ]; with: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto" name="1">foo bar&amp;zork</textarea>'