public class OpportunityTH extends TriggerHandler {
	private List<Opportunity> newOpps;
	private List<Opportunity> oldOpps;

	public OpportunityTH() {
		this.newOpps = Trigger.new;
		this.oldOpps = Trigger.old;
	}

	public override void beforeInsert() {
			for (Opportunity opp : newOpps) {
				opp.LastExchangeRate__c = 66.66;
            }
	}
}