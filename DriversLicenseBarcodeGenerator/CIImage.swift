import CoreImage

extension CIImage {
    func toCGImage() -> CGImage! {
        return CIContext(options: nil).createCGImage(self, from: extent)
    }
}
