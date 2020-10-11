rendering
renderExplanationOn: html

	html paragraph: 'The purpose of this test is to make sure WAContext and WACurrentContext work correctly. For each label you should see the print string of one or several matching objects. For the ''Request Handlers'' the first object should be a WARenderLoopContinuation or subclass, then a WASession or subclass, the third a WAApplication and then one or several WADispatchers matching the path.'