public with sharing class ExchangeRateMDTController {
	public static Exchange_Rate_API__mdt getExchangeRateMetaData() {
		return [SELECT URL__c, Key__c, Key_Value__c FROM Exchange_Rate_API__mdt].get(0);
	}
}