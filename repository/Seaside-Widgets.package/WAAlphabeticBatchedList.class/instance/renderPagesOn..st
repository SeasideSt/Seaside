rendering
renderPagesOn: html
	self allPages
		do: [ :char |
			currentPage = char
				ifFalse: [
					(self validPages includes: char)
						ifTrue: [ html anchor callback: [ self currentPage: char ] ; with: char ]
						ifFalse: [ html text: char ] ]
				ifTrue: [ html strong: char ] ]
		separatedBy: [ html space ]