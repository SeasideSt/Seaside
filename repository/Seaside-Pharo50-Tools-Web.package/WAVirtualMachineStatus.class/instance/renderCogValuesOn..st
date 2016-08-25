rendering
renderCogValuesOn: html
	self renderLabel: 'Cog VM - Interpreter' value: (self vm getSystemAttribute: 1007) on: html.
	self renderLabel: 'Cog VM - JIT' value: (self vm getSystemAttribute: 1008) on: html.
	self renderLabel: 'Cog VM - Stack pages' value: (self vm parameterAt: 42) on: html.
	self renderLabel: 'Cog VM - Desired stack pages' value: (self vm parameterAt: 43) on: html.
	"unclear which way round things go - and all appear to be zero anyway"
	"self renderLabel: 'Cog VM - bit 0' value: ((vm parameterAt: 48) bitAt: 1) on: html.
	self renderLabel: 'Cog VM - Interpreted method bit used?' value: ((vm parameterAt: 48) bitAt: 2) on: html.
	self renderLabel: 'Cog VM - preempted methods go to back of queue?' value: ((vm parameterAt: 48) bitAt: 3) on: html."
	self renderLabel: 'Cog VM - ForceInterruptChecks since startup' value: (self vm parameterAt: 58) on: html.
	self renderLabel: 'Cog VM - Stack page overflows since startup' value: (self vm parameterAt: 60) on: html.
	self renderLabel: 'Cog VM - Stack page divorces since startup' value: (self vm parameterAt: 61) on: html

