event handling
pushClassChange: aClassAnnounce to: pusher

	pusher turboStream: [ :ts | 
		ts 
			replaceComponent: classesPane refreshList with: classesPane;
			replaceComponent: methodcategoriesPane refreshList with: methodcategoriesPane;
			replaceComponent: methodsPane refreshList with: methodsPane;
			replaceComponent: methodEditor with: methodEditor ]