public class TA_Opportunity_NameHello implements TriggerAction.BeforeInsert {
    @TestVisible
    private static final String HELLO = 'Hello';

    public void beforeInsert(List<Opportunity> newList) {
        for (Opportunity opp : newList) {
            opp.Name = HELLO;
        }
    }
}
