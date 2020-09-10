//
//  venue.swift
//  DucTran-MapKit
//
//  Created by Vibhu Prashar on 04/10/19.
//  Copyright © 2019 Duc Tran. All rights reserved.
//

import MapKit
import AddressBook
import SwiftyJSON
class Venue: NSObject, MKAnnotation
{
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(title: String, locationName: String?, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        
        super.init()
    }
    
    
    var subtitle: String?
    {
        return locationName
    }
    
    
    class func from(json: JSON) -> Venue?
    {
        var title: String
        if let unrappedTitle = json["name"].string
        {
            title=unrappedTitle
        }
        else
        {
            title = ""
        }
        
        let locationName = json["location"]["address"].string
        let lat = json["location"]["lat"].doubleValue
        let long = json["location"]["lng"].doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        return Venue(title: title, locationName: locationName, coordinate: coordinate)
    }
    func mapItem() -> MKMapItem
    {
let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(title) \(subtitle)"
        return mapItem
    }
    
}

