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
    
    private var state: String {
        return "OH"
//        return statePopupButton.selectedItem!.tag // TODO: How do you get the value of a popup?
    }
    
    private var zip: String {
        return zipTextField.stringValue
    }
    
    private var documentExpirationDate: Date {
        return expirationDatePicker.dateValue
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

    func dataElements() -> [Any] {
        let jurisdictionSpecificVehicleClass = DCA("D")
        let jurisdictionSpecificRestrictionCodes = DCB("NONE")
        let jurisdictionSpecificEndorsementCodes = DCD("NONE")
        let documentExpirationDate = DBA(self.documentExpirationDate)
        
        let customerFirstName = DAC(firstName)

        
        return [
            jurisdictionSpecificVehicleClass,
            jurisdictionSpecificRestrictionCodes,
            customerFirstName,
            jurisdictionSpecificEndorsementCodes,
            documentExpirationDate,
            DCD("NONE")
        ]
    }

    // MARK: - Actions
    
    
    @IBAction func generate(sender: Any) {
        let barcode = Barcode(dataElements: dataElements())
//
//        barcode.jurisdictionSpecificVehicleClass = DataElement.DCA("D")
//        barcode.jurisdictionSpecificRestrictionCodes = DataElement.DCB("A")
//        barcode.jurisdictionSpecificEndorsementCodes = DataElement.DCD("NONE")
//        barcode.documentExpirationDate = DataElement.DBA(buildDate(year: 2019, month: 9, day: 14))
//        barcode.customerFamilyName = DataElement.DCS(lastName)
//        barcode.customerFirstName = DataElement.DAC(firstName)
//        barcode.customerMiddleNames = DataElement.DAD([middleName])
//        barcode.documentIssueDate = DataElement.DBD(buildDate(year: 2015, month: 10, day: 3))
//        barcode.dateOfBirth = DataElement.DBB(buildDate(year: 1986, month: 9, day: 14))
//        barcode.physicalDescriptionSex = DataElement.DBC(1)
//        barcode.physicalDescriptionEyeColor = DataElement.DAY("HAZ")
//        barcode.phsyicalDescriptionHeight = DataElement.DAU(70) // TODO: This needs to be formatted as "70 IN" when encoding
//        barcode.addressStreet1 = DataElement.DAG(address1)
//        barcode.addressCity = DataElement.DAI(city)
//        barcode.addressJurisdictionCode = DataElement.DAJ(state)
//        barcode.addressPostalCode = DataElement.DAK("432122152")
//        barcode.customerIDNumber = DataElement.DAQ("SS430403")
//        barcode.documentDiscriminator = DataElement.DCF("2509UN6813300000")
//        barcode.countryIdentification = DataElement.DCG("USA")
//        barcode.familyNameTruncation = DataElement.DDE(.No)
//        barcode.firstNameTruncation = DataElement.DDF(.No)
//        barcode.middleNameTruncation = DataElement.DDG(.No)
//        
        if let image = generatePDF417Barcode(from: barcode) {
            imageView.image = image
            print(barcode)
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

