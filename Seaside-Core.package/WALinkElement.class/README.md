Defines either a link or style sheet rules. If it has children then it defines style sheet rules, else it defines a link.

= if link =
This element defines a link. Unlike A, it may only appear in the HEAD section of a document, although it may appear any number of times. Although LINK has no content, it conveys relationship information that may be rendered by user agents in a variety of ways (e.g., a tool-bar with a drop-down menu of links).

= style sheet rules =
The STYLE element allows authors to put style sheet rules in the head of the document. HTML permits any number of STYLE elements in the HEAD section of a document.

User agents that don't support style sheets, or don't support the specific style sheet language used by a STYLE element, must hide the contents of the STYLE element. It is an error to render the content as part of the document's text. Some style sheet languages support syntax for hiding the content from non-conforming user agents.