updating
updateUrl: aUrl
	super updateUrl: aUrl.
	"class name is a Symbol, using a String makes a big difference for WALotsaLinksFunctionalTest"
	aUrl addToPath: self selected name greaseString