rendering
renderHarryOn: html

	html heading level2; with: '<cite>, <q>, <strong>'.

	html paragraph: [
		html text: 'As '.
		html citation: 'Harry S. Truman'.
		html text: ' said, '.
		html quote: 'The buck stops here.'.

		html break.

		html text: 'More information can be found in '.
		html citation: '[ISO-0000]'.
		html text: '.'.

		html break.

		html text: 'Please refer to the following reference number in future correspondence: '.
		html strong: '1-234-55' ]