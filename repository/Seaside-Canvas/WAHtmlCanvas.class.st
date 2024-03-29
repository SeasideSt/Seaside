"
I'm a canvas for building HTML.
"
Class {
	#name : 'WAHtmlCanvas',
	#superclass : 'WATagCanvas',
	#category : 'Seaside-Canvas-Canvas',
	#package : 'Seaside-Canvas',
	#tag : 'Canvas'
}

{ #category : 'instance creation' }
WAHtmlCanvas class >> builder [
	^ super builder
			rootClass: WAHtmlRoot;
			documentClass: WAHtmlDocument;
			yourself
]

{ #category : 'class initialization' }
WAHtmlCanvas class >> initialize [
	self selectAsDefault
]

{ #category : 'class initialization' }
WAHtmlCanvas class >> unload [
	self unselectAsDefault
]

{ #category : 'tags-block' }
WAHtmlCanvas >> abbreviated [
	"Defines an abbreviation, such as 'M.', 'Inc.', 'et al.', 'etc.'"

	^ self tag: 'abbr'
]

{ #category : 'tags-block' }
WAHtmlCanvas >> abbreviated: aBlock [
	self abbreviated with: aBlock
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> acronym [
	"Defines an acronym, such as 'GmbH', 'NATO', and 'F.B.I.'"
	self
		greaseDeprecatedApi: 'WAHtmlCanvas>>acronym'
		details: 'https://www.w3docs.com/learn-html/deprecated-html-tags.html'.
	^ self tag: 'acronym'
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> acronym: aBlock [
	self acronym with: aBlock
]

{ #category : 'tags-block' }
WAHtmlCanvas >> address [
	"Defines an address element."

	^ self tag: 'address'
]

{ #category : 'tags-block' }
WAHtmlCanvas >> address: aBlock [
	self address with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> anchor [
	"Defines an anchor."

	^ self brush: WAAnchorTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> anchor: aBlock [
	self anchor with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> article [
	"The article element represents a section of a page that consists of a composition that forms an independent part of a document, page, or site. This could be a forum post, a magazine or newspaper article, a Web log entry, a user-submitted comment, or any other independent item of content.

	An article element is 'independent' in that its contents could stand alone, for example in syndication. However, the element is still associated with its ancestors; for instance, contact information that applies to a parent body element still covers the article as well.

	When article elements are nested, the inner article elements represent articles that are in principle related to the contents of the outer article. For instance, a Web log entry on a site that accepts user-submitted comments could represent the comments as article elements nested within the article element for the Web log entry.

	Author information associated with an article element (q.v. the address element) does not apply to nested article elements.

	Each article element potentially has a heading."
	^ self tag: 'article'
]

{ #category : 'tags' }
WAHtmlCanvas >> article: aBlock [
	self article with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> aside [
	"The aside element represents a section of a page that consists of content that is tangentially related to the content around the aside element, and which could be considered separate from that content. Such sections are often represented as sidebars in printed typography.

	When used as an inline-level content container, the element represents a paragraph.

	Each aside element potentially has a heading. "
	^ self tag: 'aside'
]

{ #category : 'tags' }
WAHtmlCanvas >> aside: aBlock [
	self aside with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> audio [
	"An audio element represents a sound or audio stream."
	^ self brush: WAAudioTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> audio: aBlock [
	self audio with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> basicForm [
	^ self brush: WABasicFormTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> basicForm: aBlock [
	self basicForm with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> bidirectional [
	"The bdi element represents a span of text that is to be isolated from its surroundings for the purposes of bidirectional text formatting."
	^ self tag: 'bdi'
]

{ #category : 'tags' }
WAHtmlCanvas >> bidirectional: aBlock [
	self bidirectional with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> bidirectionalOverride [
	"The bdo element represents explicit text directionality formatting control for its children. It allows authors to override the Unicode bidirectional algorithm by explicitly specifying a direction override. [BIDI]

Authors must specify the dir attribute on this element, with the value ltr to specify a left-to-right override and with the value rtl to specify a right-to-left override."
	^ self tag: 'bdo'
]

{ #category : 'tags' }
WAHtmlCanvas >> bidirectionalOverride: aBlock [
	self bidirectionalOverride with: aBlock
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> big [
	"Defines big text."
	self
		greaseDeprecatedApi: 'WAHtmlCanvas>>big'
		details: 'https://www.w3docs.com/learn-html/deprecated-html-tags.html'.
	^ self tag: 'big'
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> big: aBlock [
	self big with: aBlock
]

{ #category : 'tags-block' }
WAHtmlCanvas >> blockquote [
	"Defines a long quotation."

	^ self tag: 'blockquote'
]

{ #category : 'tags-block' }
WAHtmlCanvas >> blockquote: aBlock [
	self blockquote with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> break [
	"Inserts a single line break."

	^ self brush: WABreakTag new
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> button [
	^ self brush: WAButtonTag new
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> button: anObject [
	^ self button with: anObject
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> cancelButton [
	^ self brush: WACancelButtonTag new
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> cancelButton: anObject [
	^ self cancelButton with: anObject
]

{ #category : 'tags' }
WAHtmlCanvas >> canvas [
	^ self brush: WACanvasTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> canvas: aBlock [
	self canvas with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> checkbox [
	^ self brush: WACheckboxTag new
]

{ #category : 'tags-block' }
WAHtmlCanvas >> citation [
	"Defines a citation."

	^ self tag: 'cite'
]

{ #category : 'tags-block' }
WAHtmlCanvas >> citation: aBlock [
	self citation with: aBlock
]

{ #category : 'tags-output' }
WAHtmlCanvas >> code [
	"Defines computer code text."

	^ self tag: 'code'
]

{ #category : 'tags-output' }
WAHtmlCanvas >> code: aBlock [
	self code with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> colorInput [
	^ self brush: WAColorInputTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> command [
	^ self brush: WACommandTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> command: aBlock [
	self command with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> datalist [
	^ self brush: WADatalistTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> datalist: aBlock [
	self datalist with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> dateInput [
	^ self brush: WADateInput new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> dateInput5 [
	^ self brush: WADateInputTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> dateTimeInput [
	^ self brush: WADateTimeInputTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> dateTimeLocalInput [
	^ self brush: WADateTimeLocalInputTag new
]

{ #category : 'tags-output' }
WAHtmlCanvas >> definition [
	"Defines a definition term."

	^ self tag: 'dfn'
]

{ #category : 'tags-output' }
WAHtmlCanvas >> definition: aBlock [
	self definition with: aBlock
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> definitionData [
	"Defines a definition description."

	^ self tag: 'dd'
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> definitionData: aBlock [
	self definitionData with: aBlock
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> definitionList [
	"Defines a definition list."

	^ self tag: 'dl'
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> definitionList: aBlock [
	self definitionList with: aBlock
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> definitionTerm [
	"Defines a definition term."

	^ self tag: 'dt'
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> definitionTerm: aBlock [
	self definitionTerm with: aBlock
]

{ #category : 'tags-block' }
WAHtmlCanvas >> deleted [
	"Defines deleted text."

	^ self brush: (WAEditTag tag: 'del')
]

{ #category : 'tags-block' }
WAHtmlCanvas >> deleted: aBlock [
	self deleted with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> details [
	^ self brush: WADetailsTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> details: aBlock [
	self details with: aBlock
]

{ #category : 'tags-styles' }
WAHtmlCanvas >> div [
	"Defines a section in a document."

	^ self tag: 'div'
]

{ #category : 'tags-styles' }
WAHtmlCanvas >> div: aBlock [
	self div with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> emailInput [
	^ self brush: WAEmailInputTag new
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> embed [
	"The embed element represents an integration point for an external (typically non-HTML) application or interactive content."
	self
		greaseDeprecatedApi: 'WAHtmlCanvas>>embed'
		details: 'https://www.w3docs.com/learn-html/deprecated-html-tags.html'.
	^ self brush: WAEmbedTag new
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> embed: aBlock [
	self embed with: aBlock
]

{ #category : 'tags-format' }
WAHtmlCanvas >> emphasis [
	"Defines emphasized text."

	^ self tag: 'em'
]

{ #category : 'tags-format' }
WAHtmlCanvas >> emphasis: aBlock [
	self emphasis with: aBlock
]

{ #category : 'convenience' }
WAHtmlCanvas >> encodeCharacter: aCharacter [ 
	self html: '&#' , aCharacter greaseInteger greaseString , ';'
]

{ #category : 'tags-input' }
WAHtmlCanvas >> fieldSet [
	"Defines a fieldset."

	^ self brush: WAFieldSetTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> fieldSet: aBlock [
	self fieldSet with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> figure [
	"no known browser support
	
	The figure element represents a paragraph consisting of embedded content and a caption.

The first embedded content element child of the figure element, if any, is the paragraph's content.

The first legend element child of the element, if any, represents the caption of the embedded content. If there is no child legend element, then there is no caption. 

	e.g.:
	html figure: [
		html legend: 'Credit: Media Inc., 2007'.
		html image url: 'smith.jpg'; altText: 'Photo: J. Smith' ]"
	^ self tag: 'figure'
]

{ #category : 'tags' }
WAHtmlCanvas >> figure: aBlock [
	self figure with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> figureCaption [
	"The figcaption element represents a caption or legend for the rest of the contents of the figcaption element's parent figure element, if any."
	^ self tag: 'figcaption'
]

{ #category : 'tags' }
WAHtmlCanvas >> figureCaption: aBlock [
	self figureCaption with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> fileUpload [
	^ self brush: WAFileUploadTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> footer [
	"The footer element represents the footer for the section it applies to. A footer typically contains information about its section such as who wrote it, links to related documents, copyright data, and the like.

	footer elements must not contain any footer, header, h1, h2, h3, h4, h5, or h6 elements, or any of the sectioning elements (such as section), as descendants.

	When used as an inline-level content container, the element represents a paragraph.

	Contact information for the section given in a footer should be marked up using the address element."
	^ self tag: 'footer'
]

{ #category : 'tags' }
WAHtmlCanvas >> footer: aBlock [
	self footer with: aBlock
]

{ #category : 'form' }
WAHtmlCanvas >> form [
	^ self brush: WAFormTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> form: aBlock [
	self form with: aBlock
]

{ #category : 'convenience' }
WAHtmlCanvas >> formatText: aString with: collection [
	| stream previousText |
	stream := aString readStream.
	previousText := WriteStream on: String new.
	[ stream atEnd ] whileFalse: [ | currentChar | 
			(currentChar := stream next) == ${
				ifTrue: [ 
					| expression index | 
					expression := stream upTo: $}.
					index := Integer readFrom: expression ifFail: [ expression ].
					self text: previousText contents.
					previousText := WriteStream on: String new.
					self render: (collection at: index) ]
				ifFalse: [
					currentChar == $\
						ifTrue: [ stream atEnd ifFalse: [ previousText nextPut: stream next ] ]
						ifFalse: [ previousText nextPut: currentChar ] ] ].
	self text: previousText contents.
]

{ #category : 'tags' }
WAHtmlCanvas >> header [
	"The header element represents the header of a section. Headers may contain more than just the section's heading \u2014 for example it would be reasonable for the header to include version history information.

	header elements must not contain any header elements, footer elements, or any sectioning elements (such as section) as descendants.

	header elements must have at least one h1, h2, h3, h4, h5, or h6 element as a descendant. "
	^ self tag: 'header'
]

{ #category : 'tags' }
WAHtmlCanvas >> header: aBlock [
	self header with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> heading [
	"Defines header 1 to header 6."

	^ self brush: WAHeadingTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> heading: aBlock [
	self heading with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> headingGroup [
	"The hgroup element represents the heading of a section. The element is used to group a set of h1-h6 elements when the heading has multiple levels, such as subheadings, alternative titles, or taglines.

	For the purposes of document summaries, outlines, and the like, the text of hgroup elements is defined to be the text of the highest ranked h1-h6 element descendant of the hgroup element, if there are any such elements, and the first such element if there are multiple elements with that rank. If there are no such elements, then the text of the hgroup element is the empty string.

	The rank of an hgroup element is the rank of the highest-ranked h1-h6 element descendant of the hgroup element, if there are any such elements, or otherwise the same as for an h1 element (the highest rank)."
	^ self tag: 'hgroup'
]

{ #category : 'tags' }
WAHtmlCanvas >> headingGroup: aBlock [
	self headingGroup with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> hiddenInput [
	^ self brush: WAHiddenInputTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> horizontalRule [
	"Defines a horizontal rule."

	^ self brush: WAHorizontalRuleTag new
]

{ #category : 'public' }
WAHtmlCanvas >> html: aString [ 
	"Emit aString unescaped onto the target document."
	self flush.
	self document nextPutAll: aString greaseString
]

{ #category : 'tags-transitional' }
WAHtmlCanvas >> iframe [
	^ self brush: WAIframeTag new
]

{ #category : 'tags-images' }
WAHtmlCanvas >> image [
	"Defines an image."

	^ self brush: WAImageTag new
]

{ #category : 'tags-images' }
WAHtmlCanvas >> image: aBlock [
	self image with: aBlock
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> imageButton [
	^ self brush: WAImageButtonTag new
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> imageButton: anObject [
	^ self imageButton with: anObject
]

{ #category : 'tags-block' }
WAHtmlCanvas >> inserted [
	"Defines inserted text."

	^ self brush: (WAEditTag tag: 'ins')
]

{ #category : 'tags-block' }
WAHtmlCanvas >> inserted: aBlock [
	self inserted with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> keyGenerator [
	^ self brush: WAKeyGeneratorTag new
]

{ #category : 'tags-output' }
WAHtmlCanvas >> keyboard [
	"Defines keyboard text."

	^ self tag: 'kbd'
]

{ #category : 'tags-output' }
WAHtmlCanvas >> keyboard: aBlock [
	self keyboard with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> label [
	"Defines a label for a form control."

	^ self brush: WALabelTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> label: aBlock [
	self label with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> legend [
	"Defines a title in a fieldset."

	^ self tag: 'legend'
]

{ #category : 'tags-input' }
WAHtmlCanvas >> legend: aBlock [
	self legend with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> lineBreakOpportunity [
	"The wbr element represents a line break opportunity."
	^ self brush: WAOptionalBreakTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> lineBreakOpportunity: aBlock [
	self lineBreakOpportunity with: aBlock
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> listItem [
	"Defines a list item."

	^ self tag: 'li'
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> listItem: aBlock [
	self listItem with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> main [
	"The HTML <main> element represents the dominant content of the <body> of a document. The main content area consists of content that is directly related to or expands upon the central topic of a document, or the central functionality of an application."

	^ self tag: 'main'
]

{ #category : 'tags' }
WAHtmlCanvas >> main: aBlock [
	self main with: aBlock
]

{ #category : 'tags-images' }
WAHtmlCanvas >> map [
	"Defines an anchor to be used around an image."

	^ self brush: WAImageMapTag new
]

{ #category : 'tags-images' }
WAHtmlCanvas >> map: aBlock [
	self map with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> marked [
	"no known browser support
	
	The mark element represents a run of text in one document marked or highlighted for reference purposes.

In the following snippet, a paragraph of text refers to a specific part of a code fragment.

<p>The highlighted part below is where the error lies:</p>
<pre><code>var i: Integer;
begin
   i := <mark>1.1</mark>;
end.</code></pre>

Another example of the mark element is highlighting parts of a document that are matching some search string. If someone looked at a document, and the server knew that the user was searching for the word 'kitten', then the server might return the document with one paragraph modified as follows:

<p>I also have some <mark>kitten</mark>s who are visiting me
these days. They're really cute. I think they like my garden! Maybe I
should adopt a <mark>kitten</mark>.</p>"
	^ self tag: 'mark'
]

{ #category : 'tags' }
WAHtmlCanvas >> marked: aBlock [
	self marked with: aBlock
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> menu [
	self
		greaseDeprecatedApi: 'WAHtmlCanvas>>menu'
		details: 'https://www.w3docs.com/learn-html/deprecated-html-tags.html'.
	^ self brush: WAMenuTag new
]

{ #category : 'tags-deprecated' }
WAHtmlCanvas >> menu: aBlock [
	self menu with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> meter [
	^ self brush: WAMeterTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> meter: aBlock [
	self meter with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> monthInput [
	^ self brush: WAMonthInputTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> multiSelect [
	^ self brush: WAMultiSelectTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> multiSelect: aBlock [
	^ self multiSelect with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> navigation [
	"The nav element represents a section of a page that links to other pages or to parts within the page: a section with navigation links.

	When used as an inline-level content container, the element represents a paragraph.

	Each nav element potentially has a heading."
	^ self tag: 'nav'
]

{ #category : 'tags' }
WAHtmlCanvas >> navigation: aBlock [
	self navigation with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> numberInput [
	^ self brush: WANumberInputTag new
]

{ #category : 'tags-program' }
WAHtmlCanvas >> object [
	"Defines an embedded object."

	^ self brush: WAObjectTag new
]

{ #category : 'tags-program' }
WAHtmlCanvas >> object: aBlock [
	self object with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> option [
	^ self brush: WAOptionTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> option: aBlock [
	^ self option with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> optionGroup [
	^ self brush: WAOptionGroupTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> optionGroup: aBlock [
	^ self optionGroup with: aBlock
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> orderedList [
	"Defines an ordered list."

	^ self brush: WAOrderedListTag new
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> orderedList: aBlock [
	self orderedList with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> output [
	^ self brush: WAOutputTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> output: aBlock [
	^ self output with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> paragraph [
	"Defines a paragraph."

	^ self tag: 'p'
]

{ #category : 'tags' }
WAHtmlCanvas >> paragraph: aBlock [
	self paragraph with: aBlock
]

{ #category : 'tags-program' }
WAHtmlCanvas >> parameter [
	"Defines a parameter for an object."

	^ self brush: WAParameterTag new
]

{ #category : 'tags-program' }
WAHtmlCanvas >> parameter: aBlock [
	self parameter
]

{ #category : 'form-elements' }
WAHtmlCanvas >> passwordInput [
	^ self brush: WAPasswordInputTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> passwordInput: anObject [
	^ self passwordInput with: anObject
]

{ #category : 'tags-input' }
WAHtmlCanvas >> popupAnchor [
	^ self brush: WAPopupAnchorTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> popupAnchor: aBlock [
	self popupAnchor with: aBlock
]

{ #category : 'tags-output' }
WAHtmlCanvas >> preformatted [
	"Defines preformatted text."

	^ self tag: 'pre'
]

{ #category : 'tags-output' }
WAHtmlCanvas >> preformatted: aBlock [
	self preformatted with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> progress [
	^ self brush: WAProgressTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> progress: aBlock [
	self progress with: aBlock
]

{ #category : 'tags-block' }
WAHtmlCanvas >> quote [
	"Defines a short quotation."

	^ self tag: 'q'
]

{ #category : 'tags-block' }
WAHtmlCanvas >> quote: aBlock [
	self quote with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> radioButton [
	^ self brush: WARadioButtonTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> radioButton: aBlock [
	^ self radioButton with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> radioGroup [
	^ WARadioGroup canvas: self
]

{ #category : 'form-elements' }
WAHtmlCanvas >> radioGroup: aBlock [
	^ aBlock value: self radioGroup
]

{ #category : 'tags-input' }
WAHtmlCanvas >> rangeInput [
	^ self brush: WARangeInputTag new
]

{ #category : 'tags-ruby' }
WAHtmlCanvas >> ruby [
	^ self tag: 'ruby'
]

{ #category : 'tags-ruby' }
WAHtmlCanvas >> ruby: aBlock [
	self ruby with: aBlock
]

{ #category : 'tags-ruby' }
WAHtmlCanvas >> rubyParentheses [
	^ self tag: 'rp'
]

{ #category : 'tags-ruby' }
WAHtmlCanvas >> rubyParentheses: aBlock [
	self rubyParentheses with: aBlock
]

{ #category : 'tags-ruby' }
WAHtmlCanvas >> rubyText [
	^ self tag: 'rt'
]

{ #category : 'tags-ruby' }
WAHtmlCanvas >> rubyText: aBlock [
	self rubyText with: aBlock
]

{ #category : 'tags-output' }
WAHtmlCanvas >> sample [
	"Defines sample computer code."

	^ self tag: 'samp'
]

{ #category : 'tags-output' }
WAHtmlCanvas >> sample: aBlock [
	self sample with: aBlock
]

{ #category : 'tags-program' }
WAHtmlCanvas >> script [
	"Defines a script."

	^ self brush: WAScriptTag new
]

{ #category : 'tags-program' }
WAHtmlCanvas >> script: aStringOrJSObject [
	self script with: aStringOrJSObject
]

{ #category : 'tags-input' }
WAHtmlCanvas >> searchInput [
	^ self brush: WASearchInputTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> section [
	"The section element represents a generic document or application section. A section, in this context, is a thematic grouping of content, typically with a header, possibly with a footer."
	^ self tag: 'section'
]

{ #category : 'tags' }
WAHtmlCanvas >> section: aBlock [
	self section with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> select [
	^ self brush: WASelectTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> select: aBlock [
	^ self select with: aBlock
]

{ #category : 'tags-format' }
WAHtmlCanvas >> small [
	"Defines small text."

	^ self tag: 'small'
]

{ #category : 'tags-format' }
WAHtmlCanvas >> small: aBlock [
	self small with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> source [
	^ self brush: WASourceTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> source: aBlock [
	self source with: aBlock
]

{ #category : 'private' }
WAHtmlCanvas >> spaceEntity [
	"The HTML entity representing a space. To be subclassed as needed."

	^ '&nbsp;'
]

{ #category : 'tags-styles' }
WAHtmlCanvas >> span [
	"Defines a section in a document."

	^ self tag: 'span'
]

{ #category : 'tags-styles' }
WAHtmlCanvas >> span: aBlock [
	self span with: aBlock
]

{ #category : 'tags-format' }
WAHtmlCanvas >> strong [
	"Defines strong text."

	^ self tag: 'strong'
]

{ #category : 'tags-format' }
WAHtmlCanvas >> strong: aBlock [
	self strong with: aBlock
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> submitButton [
	^ self brush: WASubmitButtonTag new
]

{ #category : 'form-buttons' }
WAHtmlCanvas >> submitButton: anObject [
	^ self submitButton with: anObject
]

{ #category : 'tags-format' }
WAHtmlCanvas >> subscript [
	"Defines subscripted text."

	^ self tag: 'sub'
]

{ #category : 'tags-format' }
WAHtmlCanvas >> subscript: aBlock [
	self subscript with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> summary [
	"The summary element represents a summary, caption, or legend for the rest of the contents of the summary element's parent details element, if any."
	^ self tag: 'summary'
]

{ #category : 'tags' }
WAHtmlCanvas >> summary: aBlock [
	self summary with: aBlock
]

{ #category : 'tags-format' }
WAHtmlCanvas >> superscript [
	"Defines superscripted text."

	^ self tag: 'sup'
]

{ #category : 'tags-format' }
WAHtmlCanvas >> superscript: aBlock [
	self superscript with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> table [
	"Defines a table."

	^ self brush: WATableTag new
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> table: aBlock [
	self table with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableBody [
	"Defines a table body."

	^ self tag: 'tbody'
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableBody: aBlock [
	self tableBody with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableCaption [
	"Defines a table caption."

	^ self tag: 'caption'
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableCaption: aBlock [
	self tableCaption with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableColumn [
	"Defines attributes for table columns."

	^ self brush: WATableColumnTag new
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableColumn: aBlock [
	self tableColumn with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableColumnGroup [
	"Defines groups of table columns."

	^ self brush: WATableColumnGroupTag new
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableColumnGroup: aBlock [
	self tableColumnGroup with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableData [
	"Defines a table cell."

	^ self brush: WATableDataTag new
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableData: aBlock [
	self tableData with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableFoot [
	"Defines a table footer."

	^ self tag: 'tfoot'
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableFoot: aBlock [
	^ self tableFoot with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableHead [
	"Defines a table header."

	^ self tag: 'thead'
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableHead: aBlock [
	self tableHead with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableHeading [
	"Defines a table header."

	^ self brush: WATableHeadingTag new
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableHeading: aBlock [
	self tableHeading with: aBlock
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableRow [
	"Defines a table row."

	^ self tag: 'tr'
]

{ #category : 'tags-tables' }
WAHtmlCanvas >> tableRow: aBlock [
	self tableRow with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> telephoneInput [
	^ self brush: WATelephoneInputTag new
]

{ #category : 'tags-output' }
WAHtmlCanvas >> teletype [
	"Defines teletype text."

	^ self tag: 'tt'
]

{ #category : 'tags-output' }
WAHtmlCanvas >> teletype: aBlock [
	self teletype with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> textArea [
	^ self brush: WATextAreaTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> textArea: anObject [
	^ self textArea with: anObject
]

{ #category : 'form-elements' }
WAHtmlCanvas >> textInput [
	^ self brush: WATextInputTag new
]

{ #category : 'form-elements' }
WAHtmlCanvas >> textInput: anObject [
	^ self textInput with: anObject
]

{ #category : 'tags' }
WAHtmlCanvas >> time [
	^ self brush: WATimeTag new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> time: aBlock [
	self time with: aBlock
]

{ #category : 'form-elements' }
WAHtmlCanvas >> timeInput [
	^ self brush: WATimeInput new
]

{ #category : 'tags-input' }
WAHtmlCanvas >> timeInput5 [
	^ self brush: WATimeInputTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> track [
	^ self brush: WATrackTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> track: aBlock [
	self track with: aBlock
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> unorderedList [
	"Defines an unordered list."

	^ self brush: WAUnorderedListTag new
]

{ #category : 'tags-lists' }
WAHtmlCanvas >> unorderedList: aBlock [
	self unorderedList with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> urlInput [
	^ self brush: WAUrlInputTag new
]

{ #category : 'tags-output' }
WAHtmlCanvas >> variable [
	"Defines a variable."

	^ self tag: 'var'
]

{ #category : 'tags-output' }
WAHtmlCanvas >> variable: aBlock [
	self variable with: aBlock
]

{ #category : 'tags' }
WAHtmlCanvas >> video [
	^ self brush: WAVideoTag new
]

{ #category : 'tags' }
WAHtmlCanvas >> video: aBlock [
	self video with: aBlock
]

{ #category : 'tags-input' }
WAHtmlCanvas >> weekInput [
	^ self brush: WAWeekInputTag new
]

{ #category : 'convenience' }
WAHtmlCanvas >> withLineBreaksAndUrls: aString [
	| stream |
	aString ifNil: [ ^ self ].
	stream := aString readStream.
	[ stream atEnd ] whileFalse: [ 
		self withUrls: stream nextLine.
		stream atEnd
			ifFalse: [ self break ] ]
]

{ #category : 'convenience' }
WAHtmlCanvas >> withUrls: aString [ 
	| stream url |
	stream := aString readStream.
	[ stream atEnd ] whileFalse: 
		[ self text: (stream greaseUpToAll: 'http://').
		stream atEnd ifFalse: 
			[ url := 'http://' , (stream upTo: Character space).
			self anchor
				url: url;
				with: url.
			self text: ' ' ] ]
]
