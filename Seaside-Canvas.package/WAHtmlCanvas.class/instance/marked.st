tags
marked
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