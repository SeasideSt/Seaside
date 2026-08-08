*Seaside-Aria-Core
ariaDialog
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role
	
	The dialog role is used to mark up an HTML based application dialog or window that separates content or UI from the rest of the web application or page. Dialogs are generally placed on top of the rest of the page content using an overlay. Dialogs can be either non-modal (it's still possible to interact with content outside of the dialog) or modal (only the content in the dialog can be interacted with).

	should set 
		#ariaLabelledBy:
		#ariaDescribedBy:
		
	"
	self role:'dialog'