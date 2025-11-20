//
//  Profile+CoreDataClass.swift
//  CoreData-NonPrimitive
//
//  Created by MOBILE HUTT on 18/11/25.
//
//

import Foundation
import CoreData
import UIKit
import SwiftUICore

@objc(Profile)
public class Profile: NSManagedObject {
    
    // Helper computed properties for UIImage and UIColor
    var uiImage: UIImage? {
        get {
            guard let data = photos else { return nil }
            return UIImage(data: data)
        }
        set {
            photos = newValue?.jpegData(compressionQuality: 0.8)
        }
    }
    
    var uiColor: UIColor {
        get { (favouriteColor as? UIColor) ?? .blue }
        set { favouriteColor = newValue }
    }
}

