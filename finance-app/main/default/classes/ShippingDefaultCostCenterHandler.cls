public class ShippingDefaultCostCenterHandler extends TriggerInjector.TriggerHandler {

    public override void handle(TriggerInjector.TriggerHandlerContext ctx) {
        if(Trigger.isInsert) { 
            // Default the Cost Center field to ensure shipping costs are analyized correctly
            for(Shipment shipment : (List<Shipment>) Trigger.new) {
                shipment.CostCenter__c = 'Marketing';
            }
        }
    }
}
