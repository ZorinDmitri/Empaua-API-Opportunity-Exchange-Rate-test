@isTest
public class ExchangeRateCalloutMock implements HttpCalloutMock {
    private static final String RESPONSE_BODY = '{"status": "OK","data": {"currency_from": "USD","currency_to": "GBB","rate": 0.28},"seed": 73}';
    public HttpResponse respond(HttpRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(RESPONSE_BODY);
        res.setStatusCode(200);
        return res;
    }
}