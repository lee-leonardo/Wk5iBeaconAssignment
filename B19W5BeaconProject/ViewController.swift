//
//  ViewController.swift
//  B19W5BeaconProject
//
//  Created by Leonardo Lee on 8/21/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth


let sampleUUID = NSUUID(UUIDString: "DF460DF8-B6DF-4F6C-BF13-CB46D98B8578")
//let sampleIdentifier = "com.codefellows.beacons.leo" //I worked on it
let sampleIdentifier = "com.codefellows.beacons.alex" //I worked on it

class ViewController: UIViewController, CBPeripheralManagerDelegate {
	
	
	@IBOutlet weak var bluetoothStatus: UILabel!
	
	var region : CLBeaconRegion!
	var beaconData : NSMutableDictionary!
	var peripheralManager : CBPeripheralManager!

//MARK: View Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.region = CLBeaconRegion(proximityUUID: sampleUUID, identifier: sampleIdentifier)
		self.beaconData = region.peripheralDataWithMeasuredPower(nil)
		self.peripheralManager = CBPeripheralManager(delegate: self, queue: nil)


	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

//MARK: - CBPeripheralManagerDelegate
	func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
		
		var state = peripheral.state
		
		switch state {
		case .PoweredOn:
			println("On")
			self.bluetoothStatus.text = "On"
			self.peripheralManager.startAdvertising(self.beaconData)
			
		case .PoweredOff:
			println("Off")
			self.bluetoothStatus.text = "Off"
			self.peripheralManager.stopAdvertising()
			
		default:
			println("Something else.")
		
		}
	}
	
//MARK: - CoreLocation
	
	
//MARK: - CoreBluetooth
	
	
}

