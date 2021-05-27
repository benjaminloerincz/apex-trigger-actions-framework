public class TA_Opportunity_StageChangeRules implements TriggerAction.beforeUpdate {
	@TestVisible
	private static final String INVALID_STAGE_CHANGE_ERROR = 'You can not change the stage directly from {0} to {1}';

	public void beforeUpdate(
		List<Opportunity> newList,
		List<Opportunity> oldList
	) {
		Map<Id, Opportunity> oldMap = new Map<Id, Opportunity>(oldList);
		for (Opportunity opp : newList) {
			if (
				oldMap.get(opp.Id).StageName ==
				Constants.OPPORTUNITY_STAGENAME_QUALIFICATION &&
				opp.StageName == Constants.OPPORTUNITY_STAGENAME_CLOSED_WON
			) {
				opp.addError(
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
	}
}
