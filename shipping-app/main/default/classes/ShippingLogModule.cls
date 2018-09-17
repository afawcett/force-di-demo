/**
 * Example that binds a ShippingLog implementation
 * based on the existence of a NamedCredential.
 **/
public class ShippingLogModule extends di_Module {

    public override void configure() {
        if (ShippingLogWebhook.isConfigured()) {
            bind(ShippingLog.class).to(ShippingLogWebhook.class);
        } else {
            bind(ShippingLog.class).to(ShippingLogDatabase.class);
        }
    }
}