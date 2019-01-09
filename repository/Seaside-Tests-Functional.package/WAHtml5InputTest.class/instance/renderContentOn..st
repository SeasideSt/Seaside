rendering
renderContentOn: html
	html form: [
		html table: [
			html tableRow: [
				html tableHeading: [ html label: 'required' ].
				html tableData: [
					html textInput
						required;
						on: #required of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'autofocus' ].
				html tableData: [
					html textInput
						autofocus;
						on: #autofocus of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'pattern ([0-9][A-Z]{3})' ].
				html tableData: [
					html textInput
						pattern: '[0-9][A-Z]{3}';
						on: #pattern of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'search' ].
				html tableData: [
					html searchInput
						autosave: 'Seaside';
						placeholder: 'placeholder ...';
						results: 5;
						incremental: false;
						on: #search of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'range (6..12) by 2' ].
				html tableData: [ html rangeInput
					min: 6;
					max: 12;
					step: 2;
					on: #range of: self.
				html space.
				html render: self range ] ].
			html tableRow: [
				html tableHeading: [ html label: 'email' ].
				html tableData: [
					html emailInput
						on: #email of: self ].
				html tableData: self email class name ].
			html tableRow: [
				html tableHeading: [ html label: 'url' ].
				html tableData: [
					html urlInput
					on: #url of: self ].
				html tableData: self url class name ].
			html tableRow: [
				html tableHeading: [ html label: 'number' ].
				html tableData: [
					html numberInput
						on: #number of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'datetimelocal' ].
				html tableData: [
					html dateTimeLocalInput
						on: #datetimelocal of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'datetime' ].
				html tableData: [
					html dateTimeInput
						on: #datetime of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'date' ].
				html tableData: [
					html dateInput5
						on: #date of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'time' ].
				html tableData: [
					html timeInput5
						on: #time of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'month' ].
				html tableData: [
					html monthInput
						step: 3;
						on: #month of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'week' ].
				html tableData: [
					html weekInput
						on: #week of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'color' ].
				html tableData: [
					html colorInput
						on: #color of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'telephone' ].
				html tableData: [
					html telephoneInput
						on: #telephone of: self ] ].
			html tableRow: [
				html tableHeading: [ html label: 'datalist' ].
				html tableData: [ 
					html textInput listId: #datalist.
					html datalist id: #datalist; with: [
						html option value: 'HTML 2'.
						html option value: 'HTML 3.2'.
						html option value: 'HTML 4.0'.
						html option value: 'HTML 4.0.1'.
						html option value: 'HTML 5'.
						html option disabled: true; value: 'XHTML' ] ] ] ].
		html submitButton ]