/**
 * Represents a means to log shipping request status changes
 **/
public interface ShippingLog {
    // Log shipping events
    void status(List<Shipment> shippingRequests, ShippingStatus status, String detail);
}
