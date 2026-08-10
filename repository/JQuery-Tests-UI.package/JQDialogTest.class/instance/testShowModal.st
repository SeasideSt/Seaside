tests
testShowModal
	| script |
	script := ((self jQuery: 'div') dialog showModal) greaseString.
	self assert: (script = (self function , '("div").dialog("open",{"modal":true})')
		or: [ script = (self function , '("div").dialog({"modal":true}).dialog("open")') ])
