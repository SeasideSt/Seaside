rendering
scriptToTriggerRenameOn: html

	^ html jQuery this 
			on: 'click' 
			selector: '.destroy' 
			do: ((html jQuery ajax 
						callback: [ :passengers | passengers first remove ]
						passengers: (((html jQuery expression: (JSStream on:'event.target')) closest: 'li'));
						onComplete: (((html jQuery expression: (JSStream on:'event.target')) closest: 'li') remove)) asFunction: #(event))