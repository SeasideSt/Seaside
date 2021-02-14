"
no known browser support

The menu element represents a list of commands.

The type attribute indicates the kind of menu. It must have either the value popup (to declare a context menu) or the value toolbar (to define a tool bar). The attribute may also be omitted, to indicate that the element is merely a list of commands that is neither declaring a context menu nor defining a tool bar.

If a menu element has a type attribute with the value popup, then it represents the commands of a context menu, and the user can only interact with the commands if that context menu is activated.

If a menu element has a type attribute with the value toolbar, then it represents a list of active commands that the user can immediately interact with.

Otherwise, if a menu element has no type attribute, or if has a type attribute with a value other than popup or toolbar, then it either represents an unordered list of items (each represented by an li element), each of which represents a command that the user may perform or activate, or, if the element has no li element children, a paragraph describing available commands.

The label attribute gives the label of the menu. It is used by user agents to display nested menus in the UI. For example, a context menu containing another menu would use the nested menu's label attribute for the submenu's menu label.

The autosubmit attribute is a boolean attribute that, if present, indicates that selections made to form controls in this menu are to result in the control's form being immediately submitted. 
"
Class {
	#name : #WAMenuTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAMenuTag >> autosubmit [
	"The autosubmit attribute is a boolean attribute that, if present, indicates that selections made to form controls in this menu are to result in the control's form being immediately submitted."
	self attributeAt: 'autosubmit' put: true
]

{ #category : #type }
WAMenuTag >> bePopup [
	self type: 'popup'
]

{ #category : #type }
WAMenuTag >> beToolbar [
	self type: 'toolbar'
]

{ #category : #attributes }
WAMenuTag >> label: aString [
	"The label  attribute gives the label of the menu. It is used by user agents to display nested menus in the UI. For example, a context menu containing another menu would use the nested menu's label attribute for the submenu's menu label."
	self attributeAt: 'label' put: aString
]

{ #category : #accessing }
WAMenuTag >> tag [
	^ 'menu'
]

{ #category : #attributes }
WAMenuTag >> type: aString [
	"The type  attribute indicates the kind of menu. It must have either the value popup (to declare a context menu) or the value toolbar (to define a tool bar). The attribute may also be omitted, to indicate that the element is merely a list of commands that is neither declaring a context menu nor defining a tool bar."
	self attributeAt: 'type' put: aString
]
