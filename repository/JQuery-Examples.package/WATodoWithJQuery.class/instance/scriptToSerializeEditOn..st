rendering
scriptToSerializeEditOn: html

	| currentItem itemId |
	^ html jQuery this
		on: 'change'
		selector:'.edit'
		do: ((
			html jQuery ajax
				serialize: (html jQuery expression: (JSStream on:'event.target'));
				callback: [ :passengers | currentItem := passengers first ]
				passengers: ((html jQuery expression: (JSStream on:'event.target')) closest:'li');
				callback: [ :id | itemId := id ]
				value: (JSStream on:'$(event.target).closest("li").get(0).id');
					script: [ :s |  s << (((s jQuery id: itemId) find: 'label') html: currentItem description) ];
					onComplete: 
						((((html jQuery expression: (JSStream on: 'event.target')) closest:'li') find: '.edit') hide, 
						(((html jQuery expression: (JSStream on: 'event.target')) closest:'li') find: 'label') show))
				asFunction: #(event))