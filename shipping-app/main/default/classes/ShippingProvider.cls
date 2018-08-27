public class ShippingProvider {

    // Shipping integration
    private ShippingIntegration integration = 
        (ShippingIntegration) di_Injector.Org.getInstance(ShippingIntegration.class);

    // Shipping log
    private ShippingLog log = (ShippingLog) 
        (ShippingLog) di_Injector.Org.getInstance(ShippingLog.class);

    /**
     * Calculate the cost to ship for the given items via the current shipping provider
     **/
    public List<Decimal> calculateCost(List<Shipment> shippingRequest) { 
        return integration.calculateCost(shippingRequest); 
    }

    /**
     * Ship the given items using the current shipping provider 
     **/
    public void ship(List<Shipment> shippingRequest) {
        try {
            // Ship it
            integration.ship(shippingRequest);
            // Log it
            log.status(shippingRequest, ShippingStatus.Success, null);
        } catch (Exception e) {
            // Log issue
            log.status(shippingRequest, ShippingStatus.Error, e.getMessage());
        }
    }
}
