# Force-DI Demo Application

This sample shipping app was developed for the Dreamforce 2018 session
[Understanding the Value of Dependency Injection in the Lightning Platform](https://success.salesforce.com/sessions?eventId=a1Q3A00001XoCSUUA3#/session/a2q3A000001WZTYQA4)
presented by [Andy Fawcett](https://twitter.com/andyinthecloud) and [Doug Ayers](https://twitter.com/DouglasCAyers).

# Getting Started

1. Clone this project to your local machine

```
git clone https://github.com/afawcett/force-di-demo.git
cd force-di-demo
```

2. Create a new scratch org

```
sfdx force:org:create -a force-di-demo -s -f config/project-scratch-def.json
```

3. Install the force-di unlocked package

```
sfdx force:package:install -u force-di-demo --package force-di@0.1.0-5 --wait 10
```

4. Push the demo app's source

```
sfdx force:source:push
```

5. Assign the **ShippingApp** permission set

```
sfdx force:user:permset:assign --permsetname ShippingApp
```

6. Test out the application: log in and create a new shipment record

```
sfdx force:org:open --path "//lightning/o/Shipment/list"
```

7. Inject different implementations by editing the **Binding** custom metadata types

> For example, to change the tracking number component shown on the Shipment record page,
> edit the binding custom metadata record with name `ShipmentTracking` from `c:expressShipTracking` to `c:happyShipCoTracking`.
