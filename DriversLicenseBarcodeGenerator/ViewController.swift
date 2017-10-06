//
//  ViewController.swift
//  DriversLicenseBarcodeGenerator
//
//  Created by Kyle Decot on 10/5/17.
//  Copyright © 2017 Kyle Decot. All rights reserved.
//

import Cocoa
import CoreImage

class ViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!
    
    @IBOutlet var firstNameTextField: NSTextField!
    @IBOutlet var middleNameTextField: NSTextField!
    @IBOutlet var lastNameTextField: NSTextField!
    
    @IBOutlet var address1TextField: NSTextField!
    @IBOutlet var cityTextField: NSTextField!
    @IBOutlet var zipTextField: NSTextField!
    @IBOutlet var statePopupButton: NSPopUpButton!
    
    @IBOutlet var expirationDatePicker: NSDatePicker!
    @IBOutlet var issueDatePicker: NSDatePicker!
    @IBOutlet var dateOfBirthDatePicker: NSDatePicker!
    @IBOutlet var sexPopupButton: NSPopUpButton!
    @IBOutlet var eyeColor: NSPopUpButton!
    @IBOutlet var customerIDNumberTextField: NSTextField!
    
    @IBOutlet var jurisdictionSpecificVehicleClassTextField: NSTextField!
    @IBOutlet var jurisdictionSpecificEndorsementCodesTextField: NSTextField!
    @IBOutlet var jurisdictionSpecificRestrictionCodesTextField: NSTextField!

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
    
    private var city: String {
        return cityTextField.stringValue
    }
    
    private var jurisdictionSpecificEndorsementCodes: String {
        return jurisdictionSpecificEndorsementCodesTextField.stringValue
    }
    
    private var jurisdictionSpecificRestrictionCodes: String {
        return jurisdictionSpecificEndorsementCodesTextField.stringValue
    }
    
    private var state: String {
        return "OH"
//        return statePopupButton.selectedItem!.tag // TODO: How do you get the value of a popup?
    }
    
    private var jurisdictionSpecificVehicleClass: String {
        return jurisdictionSpecificVehicleClassTextField.stringValue
    }
    
    private var zip: String {
        return zipTextField.stringValue
    }
    
    private var documentExpirationDate: Date {
        return expirationDatePicker.dateValue
    }
    
    private var documentIssueDate: Date {
        return issueDatePicker.dateValue;
    }
    
    private var addressPostalCode: String {
        return zipTextField.stringValue
    }
    
    var dataElements:[Any] {
        let jurisdictionSpecificVehicleClass = DCA(self.jurisdictionSpecificVehicleClass)
        let jurisdictionSpecificRestrictionCodes = DCB("NONE")
        let jurisdictionSpecificEndorsementCodes = DCD(self.jurisdictionSpecificEndorsementCodes)
        let documentExpirationDate = DBA(self.documentExpirationDate)
        let customerMiddleNames = DAD([middleName])
        let customerFamilyName = DCS(lastName)
        let customerFirstName = DAC(firstName)
        let documentIssueDate = DBD(self.documentIssueDate)
        let addressPostalCode = DAK(self.addressPostalCode)
        
        return [
            jurisdictionSpecificVehicleClass,
            jurisdictionSpecificRestrictionCodes,
            customerFirstName,
            customerMiddleNames,
            customerFamilyName,
            jurisdictionSpecificEndorsementCodes,
            documentIssueDate,
            documentExpirationDate,
        ]
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
        let barcode = Barcode(dataElements: dataElements, issuerIdentificationNumber: "636000", AAMVAVersionNumber: "00", jurisdictionVersionNumber: "00")

        if let image = generatePDF417Barcode(from: barcode) {
            imageView.image = image

        }
    }
    
//    private func buildDate(year: Int, month: Int, day: Int) -> Date! {
//        let calendar = NSCalendar.current
//        
//        var dateComponents = DateComponents()
//        dateComponents.year = 2019
//        dateComponents.month = 9
//        dateComponents.day = 14
//
//        return calendar.date(from: dateComponents as DateComponents)!
//    }
    
    func generatePDF417Barcode(from barcode: Barcode) -> NSImage? {
        if let filter = CIFilter(name: "CIPDF417BarcodeGenerator") {
            filter.setValue(barcode.data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                let cgImage = convertCIImageToCGImage(inputImage: output)
                
                return NSImage(cgImage: cgImage!, size: NSSize(width: 500, height: 100))
            }
        }
        
        return nil
    }
    
    func convertCIImageToCGImage(inputImage: CIImage) -> CGImage! {
        return CIContext(options: nil)
            .createCGImage(inputImage, from: inputImage.extent)
    }
}

