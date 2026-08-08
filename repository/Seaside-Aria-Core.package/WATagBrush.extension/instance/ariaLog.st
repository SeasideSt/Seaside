*Seaside-Aria-Core
ariaLog
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role
	
	The log role is used to identify an element that creates a live region where new information is added in a meaningful order and old information may disappear.
	
	required to set 
		#ariaLabel: or #ariaLabelledBy:
		
	can set 
		#ariaLive:
		#ariaAtomic:	
	"
	self role:'log'