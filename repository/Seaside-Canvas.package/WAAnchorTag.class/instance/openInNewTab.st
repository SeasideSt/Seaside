public
openInNewTab
	"Load the URL into a new browsing context. This is usually a tab, but users can configure browsers to use new windows instead.
	
	Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a
	
	WARNING:
	Use with parcimonie. It goes against web development best practices to force the user to open the link in a new tab.
	Usually your should let the user decide how he wants to open a link."

	self target: '_blank'
