//
//  MapViewController.swift
//  E-DustbinAdmin
//
//  Created by Vibhu Prashar on 07/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var venues = [Venue]()
    
    func fetchData()
    {
        let fileName = Bundle.main.path(forResource: "Venues", ofType: "json")
        
        let filePath = URL(fileURLWithPath: fileName!)
        var data : Data?
        
        do
        {
            data = try Data(contentsOf: filePath, options: Data.ReadingOptions(rawValue: 0))
        } catch let error
        {
            data = nil
            print("Report Error")
        }
        
        do
        {
            if let jsonData = data
            {
                let json = try JSON(data: jsonData)
                if let venueJSONs = json["response"]["venues"].array
                {
                    for venueJSON in venueJSONs
                    {
                        if let venue = Venue.from(json: venueJSON)
                        {
                            self.venues.append(venue)
                        }
                    }
                }
            }
        }
        
        catch let error
        {
            print(error.localizedDescription)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        fetchData()
        mapView.addAnnotations(venues)

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
     private let regionRadius: CLLocationDistance = 1000
    func zoomMapOn(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0 )
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    

   
}
extension MapViewController: MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
     
        if let annotation = annotation as? Venue
        {
            let identifier = "Pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            {
                dequeuedView.annotation = annotation
                view = dequeuedView as! MKPinAnnotationView
            }
            else
            {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            return view
        }
        
        
        
    return nil
        
    }
    
    
    
}

