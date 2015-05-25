tests-tags-forms
testMultiSelectTag
	self
		assert: [ :html | html multiSelect ]
		gives: '<select multiple="multiple"></select>'.
	self
		assert: [ :html | html multiSelect list: #(1 2) ]
		gives: '<select multiple="multiple"><option>1</option><option>2</option></select>'.
	self
		assert: [ :html | html multiSelect list: #(1 2); labels: [ :v | 2 * v ] ]
		gives: '<select multiple="multiple"><option>2</option><option>4</option></select>'.
	self
		assert: [ :html | html multiSelect list: #(1 2); enabled: [ :v | v even ] ]
		gives: '<select multiple="multiple"><option disabled="disabled">1</option><option>2</option></select>'.
	self
		assert: [ :html | html multiSelect list: #(3 4); callback: [ :v | ] ]
		gives: '<select name="1" multiple="multiple"><option value="1">3</option><option value="2">4</option></select><input name="2" type="hidden" class="hidden"/>'