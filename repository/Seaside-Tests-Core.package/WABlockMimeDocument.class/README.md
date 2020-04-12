I am a MIME document whos contents are generated dynamically by a block.

I can be used like this:

html image
	document: (WABlockMimeDocument onBlock: [ self generateSvg ])
	mimeType: (WAMimeType main: 'image' sub: 'svg+xml')

Instance Variables
	block:		<aNiladicBlock>

block
	- the block that generates the contents, either a String or ByteArray