INS and DEL are used to markup sections of the document that have been inserted or deleted with respect to a different version of a document (e.g., in draft legislation where lawmakers need to view the changes).

These two elements are unusual for HTML in that they may serve as either block-level or inline elements (but not both). They may contain one or more words within a paragraph or contain one or more block-level elements such as paragraphs, lists and tables.

This example could be from a bill to change the legislation for how many deputies a County Sheriff can employ from 3 to 5.

<P>
  A Sheriff can employ <DEL>3</DEL><INS>5</INS> deputies.
</P>

The INS and DEL elements must not contain block-level content when these elements behave as inline elements.