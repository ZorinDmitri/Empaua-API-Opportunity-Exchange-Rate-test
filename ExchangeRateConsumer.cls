public with sharing class ExchangeRateConsumer implements Queueable, Database.AllowsCallouts {
    Opportunity oppToUpdate;
    String oldCurrencyCode;
    String newCurrencyCode;


    public ExchangeRateConsumer(Opportunity opportunity, String oldCurrencyCode, String newCurrencyCode) {
        this.oppToUpdate = opportunity;
        this.oldCurrencyCode = oldCurrencyCode;
        this.newCurrencyCode = newCurrencyCode;
    }

	public void execute(QueueableContext context) {
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		Exchange_Rate_API__mdt exchangeRateMetaData = ExchangeRateMDTController.getExchangeRateMetaData();
		String endpoint =
            exchangeRateMetaData.URL__c + '/' +
			oldCurrencyCode + '/' +
            newCurrencyCode;

        request.setHeader(exchangeRateMetaData.Key__c, exchangeRateMetaData.Key_Value__c);
		request.setEndpoint(endpoint);
		request.setMethod('GET');
		try {
			HttpResponse response = http.send(request);
			ExchangeRateDTO exchangeRate = new ExchangeRateDTO();
			if (response.getStatusCode() == 200) {
				exchangeRate = ExchangeRateDTO.parse(response.getBody());
                oppToUpdate.LastExchangeRate__c = exchangeRate.Data.rate;
				update oppToUpdate;
			}
		} catch (Exception e) {
			throw e;
		}
	}
}