//
//  FiltersService.swift
//  OnTheGo
//
//  Created by MCDA on 2018-07-10.
//  Copyright © 2018 Alla Bondarenko. All rights reserved.
//

import Foundation
import UIKit

protocol FiltersServiceDelegate {
    func retrieveFilterParameters(controller: FiltersViewController, filters: FilterOptions?)
}
