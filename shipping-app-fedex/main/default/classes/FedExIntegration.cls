public class FedExIntegration implements ShippingIntegration {
    // Calculate shipping costs
    public List<Decimal> calculateCost(List<Shipment> shippingRequests) {
        return new List<Decimal> { 150 };
    }
    // Ship the given items
    public void ship(List<Shipment> shippingRequest) {
    }
}
