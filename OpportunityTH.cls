public class OpportunityTH extends TriggerHandler {
	private List<Opportunity> newOppList;
	private Map<Id, Opportunity> newOpps;
	private Map<Id, Opportunity> oldOpps;

	public OpportunityTH() {
		this.newOppList = Trigger.new;
		this.newOpps = (Map<Id, Opportunity>) Trigger.newMap;
		this.oldOpps = (Map<Id, Opportunity>) Trigger.oldMap;
	}

	public override void afterInsert() {
		for (Opportunity opp : newOppList) {
				Opportunity oppToUpdate = new Opportunity(Id = opp.Id);
				ExchangeRateConsumer erConsumer = new ExchangeRateConsumer(oppToUpdate, 'null', opp.CurrencyIsoCode);
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