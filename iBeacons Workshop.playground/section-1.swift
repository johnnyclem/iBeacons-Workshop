// Playground - noun: a place where people can play

import UIKit
import CoreLocation
import CoreBluetooth

let uuidString = "5E145790-AC19-463A-A7D7-5EF29CB2A571"

let myUUID = NSUUID(UUIDString: uuidString)

let myIdentifier = "com.codefellows.beacons.the_east_room"

var region = CLBeaconRegion(proximityUUID: myUUID, identifier: myIdentifier)

let beaconData = region.peripheralDataWithMeasuredPower(nil)

let peripheralManager = CBPeripheralManager(delegate: self, queue: nil)