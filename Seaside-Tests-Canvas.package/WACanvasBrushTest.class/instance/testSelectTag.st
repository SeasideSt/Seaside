tests-tags-forms
testSelectTag
	self
		assert: [ :html | html select ]
		gives: '<select></select>'.
	self
		assert: [ :html | html select list: #(1 2) ]
		gives: '<select><option>1</option><option>2</option></select>'.
	self
		assert: [ :html | html select list: #(1 2); labels: [ :v | 2 * v ] ]
		gives: '<select><option>2</option><option>4</option></select>'.
	self
		assert: [ :html | html select list: #(1 2); enabled: [ :v | v even ] ]
		gives: '<select><option disabled="disabled">1</option><option>2</option></select>'.
	self
		assert: [ :html | html select list: #(1 2); callback: [ :v | ] ]
		gives: '<select name="1"><option value="1">1</option><option value="2">2</option></select>'