trigger ShipmentTrigger on Shipment (before insert) {
    // TriggerInjector is an example of using force-di to manage multiple implementations to a given binding
    TriggerInjector.handle(Shipment.getSObjectType()); 
}