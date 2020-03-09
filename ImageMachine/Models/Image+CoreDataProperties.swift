//
//  Image+CoreDataProperties.swift
//  ImageMachine
//
//  Created by Ilyasa Azmi on 09/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var lastMaintenanceDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var qrcode: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var type: String?
    @NSManaged public var photos: NSSet?

}

// MARK: Generated accessors for photos
extension Image {

    @objc(addPhotosObject:)
    @NSManaged public func addToPhotos(_ value: Photo)

    @objc(removePhotosObject:)
    @NSManaged public func removeFromPhotos(_ value: Photo)

    @objc(addPhotos:)
    @NSManaged public func addToPhotos(_ values: NSSet)

    @objc(removePhotos:)
    @NSManaged public func removeFromPhotos(_ values: NSSet)

}
