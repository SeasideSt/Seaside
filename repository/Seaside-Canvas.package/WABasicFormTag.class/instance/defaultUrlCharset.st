private
defaultUrlCharset
	"the character set used for POSTs that are application/x-www-form-urlencoded
	and GETs
	There are standards that dictate this:
	http://www.w3.org/International/O-URL-code.html
	but that doesn't mean is will work with your favorite old browser"
	^ 'utf-8'