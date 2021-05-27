Opportunity myOpp = new Opportunity();
myOpp.Name = 'My Opportunity';
myOpp.CloseDate = Date.today();
myOpp.StageName = 'Qualification';

TriggerActionFlow.bypass('Goodbye_Flow');
insert myOpp;
TriggerActionFlow.clearAllBypasses('Goodbye_Flow');

System.debug(
	[SELECT Id, Name, StageName FROM Opportunity WHERE Id = :myOpp.Id]
);
