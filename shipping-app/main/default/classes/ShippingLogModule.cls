/**
 * Example that binds a ShippingLog implementation
 * based on the existence of a NamedCredential.
 **/
public class ShippingLogModule extends di_Module {

    public override void configure() {

        String credentialName = 'Shipping_Log_Webhook';
        Integer count = [
            SELECT COUNT() FROM NamedCredential
            WHERE DeveloperName = :credentialName
        ];

        if ( count > 0 ) {
            // Example of constructor injection where
            // ShippingLogWebhook class needs data passed in
            // at instantiation time. Also shows how dependency injection
            // be achieved with code that is not aware of Force DI library.
            String endpoint = 'callout:' + credentialName;
            ShippingLogWebhook webhook = new ShippingLogWebhook( endpoint );
            bind( ShippingLog.class ).toObject( webhook );
        } else {
            bind( ShippingLog.class ).to( ShippingLogDatabase.class );
        }

    }

}