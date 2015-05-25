channel-optional
category
	"---- as optional subelement of channel ----
	Specify one or more categories that the channel belongs to. Follows the same rules as the <item>-level category element below.
	
	---- as optional subelement of item ----
	Includes the item in one or more categories.
	
	The value of the element is a forward-slash-separated string that identifies a hierarchic location in the indicated taxonomy. Processors may establish conventions for the interpretation of categories.
	
	You may include as many category elements as you need to, for different domains, and to have an item cross-referenced in different parts of the same domain.
	
	It has one optional attribute, domain, a string that identifies a categorization taxonomy.
	
	In RSS 2.0, a provision is made for linking a channel to its identifier in a cataloging system, using the channel-level category feature, described above. For example, to link a channel to its Syndic8 identifier, include a category element as a sub-element of <channel>, with domain 'Syndic8', and value the identifier for your channel in the Syndic8 database. The appropriate category element for Scripting News would be
	
	rss category
		domain: 'Syndic8';
		with: 1765"
	^ self brush: RRCategoryTag new