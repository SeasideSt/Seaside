rendering
renderNavigationOn: html
	"reset offset for each full refresh"
	offset := 1.
	html div 
		class: self cssClass;
		with: [
			html table: [
				html tableRow: [
					html tableData: [ self renderNavElementsOn: html ].
					html tableData
						verticalAlign: 'top';
						with: [ self renderBodyOn: html ] ] ] ]