WAPath represents a path navigation (breadcrumbs) for a web page and displays standard breadcrumbs(xxx >> yyy >> zzz). WAPath maintains a stack of associations, one for each "location" or "page" in the path. The association key is the text that is displayed in the breadcrimb. The association value is an object of your choosing, which your code uses to restore that "page". 

To add to the path use the method WAPath>>pushSegment: anObject name: 'lulu'. The name: arguement is the association key, the segment: argument is the association value.

The method WAPath>>currentSegment returns object associated with the current "page". Your code is not notified when the user clicks on a link in the WAPath object. So when you render a page call WAPath>>currentSegment to get the current object, and generate the page accordingly.

See WAInspector for example use.

Use WATrail to handle breadcrumbs for sequences of call: and answers:.

Instance Variables:
	stack	<Array of associations(String->Object) > History of the page. Keys -> display string, values -> object used in helping generating page.

