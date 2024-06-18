//
//  QRCode.swift
//  TutuST
//
//  Created by tangbinqi on 2021/10/29.
//

import Foundation
import UIKit

class QRCode {
    class func generateQRCode(message: String, size: CGFloat) -> UIImage? {
        /// CIFilter
        let filter = CIFilter.init(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        /// Add Data
        //链接转换
        let data = message.data(using: .utf8)
        filter?.setValue(data, forKeyPath: "inputMessage")
        /// Out Put
        guard let outputImage = filter?.outputImage else {
            return nil
        }
        
        return createUIImageFromCIImage(image: outputImage, size: size)
    }

    
    class func createUIImageFromCIImage(image: CIImage, size: CGFloat) -> UIImage? {
        let extent = image.extent.integral
        let scale = min(size / extent.width, size / extent.height)
        
        /// Create bitmap
        let width: size_t = size_t(extent.width * scale)
        let height: size_t = size_t(extent.height * scale)
        let cs: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let bitmap: CGContext = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: 1)!
        
        ///
        let context = CIContext.init()
        let bitmapImage = context.createCGImage(image, from: extent)
        bitmap.interpolationQuality = .none
        bitmap.scaleBy(x: scale, y: scale)
        bitmap.draw(bitmapImage!, in: extent)
        
        guard let scaledImage = bitmap.makeImage() else {
            return nil
        }
        return UIImage.init(cgImage: scaledImage)
    }
}



