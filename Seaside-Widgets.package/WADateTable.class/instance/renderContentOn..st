rendering
renderContentOn: html
	html table
		class: 'DateTable';
		with: [
			html tableRow: [
				self renderMonthHeadingsOn: html ].
			html tableRow: [
				self renderDayHeadingsOn: html ].
			rows keysAndValuesDo: [ :index :each | 
				html tableRow: [
					self
						renderRow: each
						index: index
						on: html ] ] ]