/**
 * Represents an integration with a given shipping provider
 **/
public interface ShippingIntegration {
    // Calculate shipping costs
    List<Decimal> calculateCost(List<Shipment> shippingRequest); 
    // Ship the given items
    void ship(List<Shipment> shippingRequest);
}
