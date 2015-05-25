rendering
renderEntityTableOn: html
	html table
 		summary: 'This table gives the character entity reference,
                decimal character reference, and hexadecimal character
                reference for 8-bit Latin-1 characters, as well as the
                rendering of each in your browser.';
		with: [
			html tableCaption: 'HTML 4.0 entities'.
			self renderEntityTableColumnGroupsOn: html.
			self renderEntityTableHeadOn: html.
			self renderEntityTableFootOn: html.
			self renderEntityTableBodyOn: html ]