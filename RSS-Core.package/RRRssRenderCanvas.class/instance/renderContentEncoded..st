convenience
renderContentEncoded: aOneArgumentBlock
	"renders the html content of an item
	a render canvas will be passed as an argument to the block"
	self contentEncoded
		with: [
			self renderHtml: aOneArgumentBlock ]