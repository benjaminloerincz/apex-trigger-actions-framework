@isTest
private class TA_Opportunity_StageChangeRulesTest {
	@isTest
	private static void beforeUpdate_test() {
		List<Opportunity> newList = new List<Opportunity>();
		List<Opportunity> oldList = new List<Opportunity>();
		// generate fake Id
		Id myRecordId = TestUtility.getFakeId(Opportunity.SObjectType);
		newList.add(
			new Opportunity(
				Id = myRecordId,
				StageName = Constants.OPPORTUNITY_STAGENAME_CLOSED_WON
			)
		);
		oldList.add(
			new Opportunity(
				Id = myRecordId,
				StageName = Constants.OPPORTUNITY_STAGENAME_QUALIFICATION
			)
		);
		Test.startTest();
		new TA_Opportunity_StageChangeRules().beforeUpdate(newList, oldList);
		Test.stopTest();
		// Use getErrors() SObject method to get errors from addError without performing DML
		System.assertEquals(true, newList[0].hasErrors());
		System.assertEquals(1, newList[0].getErrors().size());
		System.assertEquals(
			newList[0].getErrors()[0].getMessage(),
			String.format(
				TA_Opportunity_StageChangeRules.INVALID_STAGE_CHANGE_ERROR,
				new List<String>{
					Constants.OPPORTUNITY_STAGENAME_QUALIFICATION,
					Constants.OPPORTUNITY_STAGENAME_CLOSED_WON
				}
			)
		);
	}
}
