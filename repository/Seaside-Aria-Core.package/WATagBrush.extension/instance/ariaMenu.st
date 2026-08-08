*Seaside-Aria-Core
ariaMenu
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role
	
	The menu role is a type of composite widget that offers a list of choices to the user.
	
	required to set 
		#ariaLabel: or #ariaLabelledBy: 
		
	can set 
		#ariaActiveDescendent:
		#ariaOrientation:
		#ariaOwns:
	"
	self role:'menu'