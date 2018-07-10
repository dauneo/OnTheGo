//
//  Constants.swift
//  AnotherGetGoing
//
//  Created by Alla Bondarenko on 2018-06-18.
//  Copyright © 2018 Alla Bondarenko. All rights reserved.
//

import Foundation

class Constants {
    static let apiKey = "AIzaSyDtcMLIL7vCZM8Za8tQkgePiy4P9sKLX6U"
    static let scheme = "https"
    static let host = "maps.googleapis.com"
    static let textPlaceSearch = "/maps/api/place/textsearch/json"
    static let nearbyPlaceSearch = "/maps/api/place/nearbysearch/json"
    static let placeDetails = "/maps/api/place/details/json"
    static let placePhotoSearch = "/maps/api/place/photo"
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PlacesOfInterest")
    
}
