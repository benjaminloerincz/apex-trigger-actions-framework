public class TA_Opportunity_Queries {
	private static TA_Opportunity_Queries instance;

	private TA_Opportunity_Queries() {
	}

	public static TA_Opportunity_Queries getInstance() {
		if (TA_Opportunity_Queries.instance == null) {
			TA_Opportunity_Queries.instance = new TA_Opportunity_Queries();
		}
		return TA_Opportunity_Queries.instance;
	}

	public Map<Id, Account> beforeAccountMap { get; private set; }

	public class Service implements TriggerAction.BeforeInsert {
		public void beforeInsert(List<Opportunity> newList) {
			TA_Opportunity_Queries.getInstance()
				.beforeAccountMap = getAccountMapFromOpportunities(newList);
		}

		private Map<Id, Account> getAccountMapFromOpportunities(
			List<Opportunity> newList
		) {
			Set<Id> accountIds = new Set<Id>();
			for (Opportunity myOpp : newList) {
				accountIds.add(myOpp.AccountId);
			}
			return new Map<Id, Account>(
				[SELECT Id, Name FROM Account WHERE Id IN :accountIds]
			);
		}
	}
}
