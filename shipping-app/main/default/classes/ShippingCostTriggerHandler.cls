public class ShippingCostTriggerHandler extends TriggerInjector.TriggerHandler {

    public override void handle(TriggerInjector.TriggerHandlerContext ctx) {
        if(Trigger.isInsert) { 
            // Ask the ShippingProvider to calculate the costs of these requests
            List<Shipment> newShippingRequests = (List<Shipment>) Trigger.new;
            List<Decimal> costs = new ShippingProvider().calculateCost(newShippingRequests);
            for(Integer costIndex = 0; costIndex < newShippingRequests.size(); costIndex++) {
                newShippingRequests[costIndex].Cost__c = costs[costIndex];
            }
        }
    }
}
