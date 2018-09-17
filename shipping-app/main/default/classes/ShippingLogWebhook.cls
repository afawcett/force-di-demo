/**
 * Posts shipping status as json to a web url.
 **/
public class ShippingLogWebhook implements ShippingLog {

    public static Boolean isConfigured() {
        Integer count = [
            SELECT COUNT() FROM NamedCredential
            WHERE DeveloperName = 'Shipping_Log_Webhook'
        ];
        return (count > 0);
    }

    public void status(List<Shipment> shippingRequests, ShippingStatus status, String detail) {
        System.debug('Logging shipping requests to webhook...');
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Shipping_Log_Webhook');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serializePretty(new Map<String, Object>{
            'status' => status,
            'detail' => detail,
            'shipments' => shippingRequests
        }));
        System.debug(req);
        HttpResponse res = new Http().send(req);
        System.debug(res);
    }

}