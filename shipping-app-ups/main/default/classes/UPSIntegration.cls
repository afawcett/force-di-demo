public class UPSIntegration implements ShippingIntegration {
    // Calculate shipping costs
    public List<Decimal> calculateCost(List<Shipment> shippingRequest) {
        return new List<Decimal> { 100 };
    }
    // Ship the given items
    public void ship(List<Shipment> shippingRequest) {
    }
}
