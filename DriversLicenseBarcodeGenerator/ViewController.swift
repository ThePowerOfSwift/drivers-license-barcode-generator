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
    @IBOutlet var physicalDescriptionHeightTextField: NSTextField!

    private var customerFirstName: String {
        return firstNameTextField.stringValue
    }
    
    private var middleName: String {
        return middleNameTextField.stringValue
    }
    
    private var customerFamilyName: String {
        return lastNameTextField.stringValue;
    }
    
    private var customerIDNumber: String {
        return customerIDNumberTextField.stringValue
    }
    
    private var dateOfBirth: Date {
        return dateOfBirthDatePicker.dateValue
    }
    
    private var addressCity: String {
        return cityTextField.stringValue
    }
    
    private var jurisdictionSpecificEndorsementCodes: String {
        return jurisdictionSpecificEndorsementCodesTextField.stringValue
    }
    
    private var jurisdictionSpecificRestrictionCodes: String {
        return jurisdictionSpecificEndorsementCodesTextField.stringValue
    }
    
    private var addressJurisdictionCode: String {
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
    
    private var physicalDescriptionSex: DataElementGender {
        return .Male // TODO: Get this from the picker
    }
    
    private var physicalDescriptionEyeColor: DataElementEyeColor {
        return .Hazel // TODO: Get this from the picker
    }
    
    private var physicalDescriptionHeight: Int {
       return physicalDescriptionHeightTextField.integerValue
    }
    
    private var documentDiscriminator: String {
        return "1234567890123456789012345" // TODO: Create some kind of generator for this and populate a field in the UI w/ it initially
    }
    
    private var addressStreet1: String {
        return address1TextField.stringValue;
    }
    
    private var countryIdentification: DataElementCountryIdentificationCode {
        return .US // TODO
    }
    
    var dataElements:[Any] {
        return [
            DCA(jurisdictionSpecificVehicleClass),
            DCB(jurisdictionSpecificRestrictionCodes),
            DCD(jurisdictionSpecificEndorsementCodes),
            DBA(documentExpirationDate),
            DCS(customerFamilyName),
            DAC(customerFirstName),
            DAD([middleName]),
            DBD(documentIssueDate),
            DBB(dateOfBirth),
            DBC(physicalDescriptionSex),
            DAY(physicalDescriptionEyeColor),
            DAU(physicalDescriptionHeight),
            DAG(addressStreet1),
            DAI(addressCity),
            DAJ(addressJurisdictionCode),
            DAK(addressPostalCode),
            DAQ(customerIDNumber),
            DCF(documentDiscriminator),
            DCG(countryIdentification),
            DDE(.No), // TODO: This should be calculated inside of barcode
            DDF(.No), // TODO: This should be calculated inside of barcode
            DDG(.No), // TODO: This should be calculated inside of barcode
        ]
    }

    // MARK: - Actions
    
    @IBAction func generate(sender: Any) {
        let barcode = Barcode(dataElements: dataElements, issuerIdentificationNumber: "636000", AAMVAVersionNumber: "00", jurisdictionVersionNumber: "00")

        if let image = generatePDF417Barcode(from: barcode) {
            imageView.image = image

        }
    }

    // MARK: - Helpers
    
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

