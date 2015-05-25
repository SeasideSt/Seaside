WABatchSelection displays a list of objects. The list is show N (currently 8) items per page, with links to navigate to other pages if needed. Objects in the list must implement one method that returns text description of the item and one method that returns a name or label used as the link users click to select the item. The text description is displayed below the link.

Example
	items := OrderedCollection new.
	1 to: 20 do: [:each | items add: (Contact new name: each; phoneNumber: '54321';yourself)].
	selection := WABatchSelection items: items link: #name text: #phoneNumber.
	result := self call: selection.

	where the Contact class has methodsinstance vars "phoneNumber" and "name", with
	setter & getter methods.

Instance Variables:
	batcher	<WABatchedList>	description of batcher
	linkSelector	<Symbol>	method sent to items in list for link text
	textSelector	<Symbol>	method sent to items in list for text description

