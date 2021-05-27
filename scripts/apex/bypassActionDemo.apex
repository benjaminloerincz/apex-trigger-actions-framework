Opportunity myOpp = new Opportunity();
myOpp.Name = 'My Opportunity';
myOpp.CloseDate = Date.today();
myOpp.StageName = 'Qualification';

MetadataTriggerHandler.bypass('TA_Opportunity_StageInsertRules');
insert myOpp;
MetadataTriggerHandler.clearBypass('TA_Opportunity_StageInsertRules');

System.debug(
	[SELECT Id, Name, StageName FROM Opportunity WHERE Id = :myOpp.Id]
);
