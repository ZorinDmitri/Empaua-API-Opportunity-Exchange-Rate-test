public with sharing class OpportunitySelector {
    public List<Opportunity> retrieveOpportunityByName(String name) {
        return [SELECT Id, Name, CurrencyIsoCode, LastExchangeRate__c FROM Opportunity WHERE Name = :name];
    }
}
