channel-optional
language
	"The language the channel is written in. This allows aggregators to group all Italian language sites, for example, on a single page. A list of allowable values for this element, as provided by Netscape, is implemented in the 'languages-generated' protocl of RRLanguageTag. You may also use values defined by the W3C (http://www.w3.org/TR/REC-html40/struct/dirlang.html#langcodes)."
	^ self brush: RRLanguageTag new