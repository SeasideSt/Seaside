building
buildInformationPaneWith: builder 
	
	^ self buildPanelWith: builder specs: {
		(LayoutFrame
			fractions: (0.0 @ 0.0 corner: 1.0 @ 0.0)
			offsets: (0 @ 0 corner: 0 @ self buttonHeight)) -> [self buildButtonsWith: builder].
		(LayoutFrame
			fractions: (0.0 @ 0.0 corner: 1.0 @ 1.0)
			offsets: (0 @ self buttonHeight corner: 0 @ 0)) -> [self buildInformationTextWith: builder]
	}.
