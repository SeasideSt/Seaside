rendering
renderAddressOn: html

	html heading level2; with: '<address>'.

	html address: [
		#(
			'Newsletter editor'
			'J.R. Brown'
			'JimquickPost News, Jimquick, CT 01234'
			'Tel (123) 456 7890')
			do: [ :each | html text: each ]
			separatedBy: [ html break ] ]