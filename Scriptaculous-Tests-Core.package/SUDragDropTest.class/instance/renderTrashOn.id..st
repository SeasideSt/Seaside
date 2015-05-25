rendering
renderTrashOn: html id: cartId
	html div
		class: 'trash';
		script: (html scriptaculous droppable
			accept: 'cart-item';
			hoverclass: 'hover';
			onDrop: (html scriptaculous updater
				id: cartId;
				triggerPassenger: [ :value | self cart remove: value ];
				callback: [ :renderer | self renderCartItemsOn: renderer ];
				onSuccess: (html scriptaculous effect id: cartId; shake)));
		with: 'Drop items here to remove them from the cart.'