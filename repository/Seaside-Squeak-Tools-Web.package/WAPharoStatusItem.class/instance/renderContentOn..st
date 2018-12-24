rendering
renderContentOn: html
	"allow optional Cog parameters to be reported easily"
	html table: [
		self renderHeaderOn: html.
		self renderFooterOn: html.
		html tableBody
			class: self tableBodyCssClass;
			with: [ 
				self renderValuesOn: html.
				self isRunningCog  ifTrue: [
					self renderCogValuesOn: html ] ] ]