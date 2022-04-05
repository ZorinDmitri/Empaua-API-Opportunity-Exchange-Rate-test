public class OpportunityTH extends TriggerHandler {
	private List<Opportunity> newOppList;
	private Map<Id, Opportunity> newOpps;
	private Map<Id, Opportunity> oldOpps;

	public OpportunityTH() {
		this.newOppList = Trigger.new;
		this.newOpps = (Map<Id, Opportunity>) Trigger.newMap;
		this.oldOpps = (Map<Id, Opportunity>) Trigger.oldMap;
	}

	public override void beforeInsert() {
		for (Opportunity opp : newOppList) {
			ExchangeRateConsumer erConsumer = new ExchangeRateConsumer(opp, 'null', opp.CurrencyIsoCode);
			ID jobID = System.enqueueJob(erConsumer);
		}
	}

	public override void beforeUpdate() {
		for (Opportunity opp : newOpps.values()) {

			if ((oldOpps.get(opp.Id).CurrencyIsoCode) != opp.CurrencyIsoCode) {
				ExchangeRateConsumer erConsumer = new ExchangeRateConsumer(opp, oldOpps.get(opp.Id).CurrencyIsoCode, opp.CurrencyIsoCode);
				ID jobID = System.enqueueJob(erConsumer);
			}
		}
	}
}