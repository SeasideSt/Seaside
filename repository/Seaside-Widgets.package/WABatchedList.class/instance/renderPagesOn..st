rendering
renderPagesOn: html
	self pageRange
		do: [ :index |
			self currentPage = index
				ifFalse: [
					html anchor
						callback: [ self currentPage: index ];
						with: index ]
				ifTrue: [ html strong: index ] ]
		separatedBy: [ html space ]