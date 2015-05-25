rendering
renderContentOn: html
	| cartId |
	cartId := html nextId.
	self
		renderInventoryOn: html;
		renderCartOn: html id: cartId;
		renderTrashOn: html id: cartId