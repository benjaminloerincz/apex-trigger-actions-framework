public class TA_Opportunity_StageInsertRules implements TriggerAction.BeforeInsert {
	@TestVisible
	private static final String PROSPECTING = 'Prospecting';
	@TestVisible
	private static final String INVALID_STAGE_INSERT_ERROR = 'The Stage must be \'Prospecting\' when an Opportunity is created';

	public void beforeInsert(List<Opportunity> newList) {
		for (Opportunity opp : newList) {
			if (opp.StageName != PROSPECTING) {
				opp.addError(INVALID_STAGE_INSERT_ERROR);
			}
		}
	}
}
