rendering
renderWithContext: aRenderContext visitor: aPainterVisitor
	"Render the halo using aRenderContext. aPainterVisitor is the visitor that the halo
	visitor is wrapping; calling #visit: on it will perform the action that would have taken
	place had the halo wrapper not been present.
	"
	| html |
	html := WAHtmlCanvas context: aRenderContext.
	html div class: 'wa-halo'; with: [
		html div class: 'wa-halo-header'; with: [
			(self plugins select: [ :each | each isActive ])
				do: [ :each | html render: each ]
				separatedBy: [ html text: ' ' ] ].
		html div class: 'wa-halo-body'; with: [
			self perform: self modeSelector with: html with: aPainterVisitor ] ].
	html flush