target
targetBlank
	"Load the URL into a new browsing context. This is usually a tab, but users can configure browsers to use new windows instead.
	
	WARNING:
	Use with parcimonie. It goes against web development best practices to force the user to open the link in a new tab. Usually your should let the user decide how he wants to open a link.
	
	Linking to another page using target=""_blank"" will run the new page on the same process as your page. If the new page is executing expensive JS, your page's performance may suffer. To avoid this use rel=""noopener""."

	self target: '_blank'