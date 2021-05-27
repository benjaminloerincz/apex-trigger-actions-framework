public class TA_Opportunity_RecalculateCategory implements TriggerAction.AfterUpdate {
	public void afterUpdate(
		List<Opportunity> newList,
		List<Opportunity> oldList
	) {
		Map<Id, Opportunity> oldMap = new Map<Id, Opportunity>(oldList);
		List<Opportunity> oppsToBeUpdated = new List<Opportunity>();
		for (Opportunity opp : newList) {
			if (
				TriggerBase.idToNumberOfTimesSeenAfterUpdate.get(opp.id) == 1 &&
				opp.StageName != oldMap.get(opp.id).StageName
			) {
				oppsToBeUpdated.add(opp);
			}
		}
		if (!oppsToBeUpdated.isEmpty()) {
			this.recalculateCategory(oppsToBeUpdated);
		}
	}

	private void recalculateCategory(List<Opportunity> opportunities) {
		// do some stuff
		update opportunities;
	}
}
