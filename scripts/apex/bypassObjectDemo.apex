Opportunity myOpp = new Opportunity();
myOpp.Name = 'My Opportunity';
myOpp.CloseDate = Date.today();
myOpp.StageName = 'Qualification';

TriggerBase.bypass('Opportunity');
insert myOpp;
TriggerBase.clearBypass('Opportunity');

System.debug(
	[SELECT Id, Name, StageName FROM Opportunity WHERE Id = :myOpp.Id]
);
