@IsTest
private class ShippingProviderTest {

    @IsTest
    private static void givenIntegrationWhenNewRequestThenCalcPrice() {
        // Given
        ShippingProviderMocks shippingProviderMocks = new ShippingProviderMocks();
        di_Injector.Org.Bindings.set(new di_Module()
            .bind(ShippingIntegration.class)
            .toObject(Test.createStub(ShippingIntegration.class, shippingProviderMocks))
            .bind(ShippingLog.class)
            .toObject(Test.createStub(ShippingLog.class, shippingProviderMocks)));
        Shipment shipmentRequest = new Shipment();             
        // When
        ShippingProvider shippingProvider = new ShippingProvider();
        List<Decimal> costs = shippingProvider.calculateCost(new List<Shipment>{ shipmentRequest });
        // Then
        System.assertEquals(1, costs.size());
        System.assertEquals(100, costs[0]);
    }

    @IsTest
    private static void givenIntegrationWhenNewRequestThenShippedAndLog() {
        // Given
        ShippingProviderMocks shippingProviderMocks = new ShippingProviderMocks();
        di_Injector.Org.Bindings.set(new di_Module()
            .bind(ShippingIntegration.class)
            .toObject(Test.createStub(ShippingIntegration.class, shippingProviderMocks))
            .bind(ShippingLog.class)
            .toObject(Test.createStub(ShippingLog.class, shippingProviderMocks)));
        Shipment shipmentRequest = new Shipment();             
        // When
        ShippingProvider shippingProvider = new ShippingProvider();
        shippingProvider.ship(new List<Shipment>{ shipmentRequest });
        // Then
        System.assert(shipmentRequest == shippingProviderMocks.receivedShipment);
        System.assertEquals(ShippingStatus.Success, shippingProviderMocks.receivedShippingStatus);
    }

    private class ShippingProviderMocks implements System.StubProvider {

        public ShippingStatus receivedShippingStatus; 
        public Shipment receivedShipment; 

        public Object handleMethodCall(Object stubbedObject, String stubbedMethodName, Type returnType, List<Type> listOfParamTypes, List<String> listOfParamNames, List<Object> listOfArgs) {
            if(stubbedMethodName == 'calculateCost') { // ShippingIntegration.calculateCost
                return new List<Decimal> { 100 };
            } else if(stubbedMethodName == 'ship') { // ShippingIntegration.ship
                receivedShipment = ((List<Shipment>)listOfArgs[0])[0]; 
            } else if(stubbedMethodName == 'status') { // ShippingLog.status
                receivedShippingStatus = (ShippingStatus) listOfArgs[1];
            }
            return null;
        }
    }    
}
