//
//  APIParser.swift
//  AnotherGetGoing
//
//  Created by Alla Bondarenko on 2018-06-18.
//  Copyright © 2018 Alla Bondarenko. All rights reserved.
//

import Foundation

class APIParser {
    class func parseAPIResponse(json: [String: Any]) -> [PlaceOfInterest] {
        var places: [PlaceOfInterest] = []
        if let results = json["results"] as? [[String: Any]] {
            for result in results{
                if let newPlace = PlaceOfInterest(json: result){
                    places.append(newPlace)
                }
            }
        }
        return places
    }
}
