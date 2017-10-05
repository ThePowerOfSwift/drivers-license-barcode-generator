//
//  ViewController.swift
//  DriversLicenseBarcodeGenerator
//
//  Created by Kyle Decot on 10/5/17.
//  Copyright © 2017 Kyle Decot. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var firstNameTextField: NSTextField!
    @IBOutlet var middleNameTextField: NSTextField!
    @IBOutlet var lastNameTextField: NSTextField!
    
    @IBOutlet var address1TextField: NSTextField!
    @IBOutlet var address2TextField: NSTextField!
    @IBOutlet var cityTextField: NSTextField!
    @IBOutlet var zipTextField: NSTextField!
    @IBOutlet var statePopupButton: NSPopUpButton!
    
    @IBOutlet var expirationDatePicker: NSDatePicker!
    @IBOutlet var issueDatePicker: NSDatePicker!
    @IBOutlet var dateOfBirthDatePicker: NSDatePicker!
    @IBOutlet var sexPopupButton: NSPopUpButton!
    @IBOutlet var eyeColor: NSPopUpButton!
    @IBOutlet var customerIDNumberTextField: NSTextField!

    private var firstName: String {
        return firstNameTextField.stringValue
    }
    
    private var middleName: String {
        return middleNameTextField.stringValue
    }
    
    private var lastName: String {
        return lastNameTextField.stringValue;
    }
    
    private var address1: String {
        return address1TextField.stringValue;
    }
    
    private var address2: String {
        return address2TextField.stringValue
    }
    
    private var city: String {
        return cityTextField.stringValue
    }
    
    private var state: String {
        return "OH"
//        return statePopupButton.selectedItem!.tag // TODO: How do you get the value of a popup?
    }
    
    private var zip: String {
        return zipTextField.stringValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    // MARK: - Actions
    
    @IBAction func generate(sender: Any) {
        let barcode = Encoder()

        barcode.documentDiscriminator = "2509UN6813300000"

        
        print(barcode.generate());
    }
}

