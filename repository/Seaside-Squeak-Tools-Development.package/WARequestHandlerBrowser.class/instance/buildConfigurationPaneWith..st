building
buildConfigurationPaneWith: builder

	^  builder pluggableTreeSpec new
		model: self ;
		roots: #groupedAttributes ;
		hasChildren: #configurationIsGroup: ;
		getChildren: #configurationChildrenOf: ;
		label: #configurationLabelOf: ;
		icon: #configurationIconOf: ;
		setSelected: #attribute: ;
		getSelected: #attribute ;
		menu: #attributeMenu: ;
		columns: {
			[:listMorph | (listMorph filteredItems collect: [:item |
				item preferredWidthOfColumn: 1]) max].
			nil "take all the space"};
		yourself