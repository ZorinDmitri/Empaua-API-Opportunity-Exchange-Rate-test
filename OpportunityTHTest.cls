@IsTest
public class OpportunityTHTest {
    private static final String TEST_OPP_NAME = 'TestOpp';
    private static final String TEST_OPP_STAGE = 'Prospecting';

    @IsTest
    public static void testOpportunityTHInsert() {
        Opportunity newOpp = new Opportunity();
        newOpp.Name = TEST_OPP_NAME;
        newOpp.CloseDate = Date.today();
        newOpp.StageName = TEST_OPP_STAGE;

        Test.setMock(HttpCalloutMock.class, new ExchangeRateCalloutMock());
        Test.startTest();
        insert newOpp;
        Test.stopTest();

        OpportunitySelector oppSelector = new OpportunitySelector();
        List<Opportunity> insertedOpps = oppSelector.retrieveOpportunityByName(TEST_OPP_NAME);
		for (Opportunity opp : insertedOpps) {
            System.AssertNotEquals(0, opp.LastExchangeRate__c);
        }
    }
}


