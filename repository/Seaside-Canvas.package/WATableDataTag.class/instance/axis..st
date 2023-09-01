attributes
axis: aString
	"This attribute may be used to place a cell into conceptual categories that can be considered to form axes in an n-dimensional space. User agents may give users access to these categories (e.g., the user may query the user agent for all cells that belong to certain categories, the user agent may present a table in the form of a table of contents, etc.). Please consult the section on categorizing cells for more information. The value of this attribute is a comma-separated list of category names."
	self
		greaseDeprecatedApi: 'WATableDateTag>>axis:'
		details: 'Not supported in html5. https://www.w3docs.com/learn-html/html-td-tag.html'.		
	self attributes at: 'axis' put: aString