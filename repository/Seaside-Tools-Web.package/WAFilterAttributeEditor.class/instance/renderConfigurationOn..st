rendering
renderConfigurationOn: html
	| filters |
	filters := self filters.
	html form: [
		self renderPossibleFiltersOn: html.
		html table
			cellspacing: 0;
			cellpadding: 0;
			with: [
				filters do: [ :each |
					html tableRow: [
						html tableData: each class name.
						html tableData: [
							(each isKindOf: WAConfiguredRequestFilter)
								ifTrue: [
									html anchor
										callback: [ self show: each configurationComponent ];
										with: 'Configure' ].
								html space.
								html anchor
									callback: [ self removeFilter: each ];
									with: 'Remove' ] ] ] ] ]