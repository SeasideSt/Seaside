rendering-chat
renderChatMessagesOn: html
	html div id: 'messages'; with: [
		self 
			renderMessage: [
				self users isEmpty
					ifTrue: [ html text: 'You are the only one here!' ]
					ifFalse: [
						html text: 'Also there: '.
						self users
							do: [ :each | html text: each ]
							separatedBy: [ html text: ', ' ] ] ]
			class: 'event' on: html ]