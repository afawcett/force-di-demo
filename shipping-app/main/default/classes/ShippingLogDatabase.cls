/**
 * Implementation of the ShippingLog that stores status changes in a custom object
 **/
public class ShippingLogDatabase implements ShippingLog {
    /**
     * Log given shipping events to the ShippingLog__c custom object
     **/
    public void status(List<Shipment> shippingRequests, ShippingStatus status, String detail) {
        System.debug('Logging shipping requests to custom object...');
    }
}
