target
targetTop
	" Load the URL into the top-level browsing context (that is, the «highest» browsing context that is an ancestor of the current one, and has no parent). If there is no parent, this behaves the same way as _self."

	self target: '_top'
