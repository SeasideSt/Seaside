*Seaside-Aria-Core
ariaTimer
	"Role.  https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/timer_role
	
	The timer role indicates to assistive technologies that an element is a numerical counter listing the amount of elapsed time from a starting point or the remaining time until an end point. Assistive technologies will not announce updates to a timer as it has an implicit aria-live value of off.

	can set 
		#ariaLabel: or #ariaLabelledBy:
		#ariaLive:
		
	"
	self role:'timer'