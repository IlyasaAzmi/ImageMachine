//
//  Photo+CoreDataProperties.swift
//  ImageMachine
//
//  Created by Ilyasa Azmi on 09/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var thumbnail: String?
    @NSManaged public var image: Image?

}
