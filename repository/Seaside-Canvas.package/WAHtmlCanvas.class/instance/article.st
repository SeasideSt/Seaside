tags
article
	"The article element represents a section of a page that consists of a composition that forms an independent part of a document, page, or site. This could be a forum post, a magazine or newspaper article, a Web log entry, a user-submitted comment, or any other independent item of content.

	An article element is 'independent' in that its contents could stand alone, for example in syndication. However, the element is still associated with its ancestors; for instance, contact information that applies to a parent body element still covers the article as well.

	When article elements are nested, the inner article elements represent articles that are in principle related to the contents of the outer article. For instance, a Web log entry on a site that accepts user-submitted comments could represent the comments as article elements nested within the article element for the Web log entry.

	Author information associated with an article element (q.v. the address element) does not apply to nested article elements.

	Each article element potentially has a heading."
	^ self tag: 'article'