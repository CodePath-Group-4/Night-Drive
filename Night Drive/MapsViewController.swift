//
//  MapsViewController.swift
//  Night Drive
//
//  Created by Rashon Poole on 12/5/20.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
 
    @IBOutlet weak var viewMap: GMSMapView!
    //Variables
    var locationManager = CLLocationManager()
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeTheLocationManager()
        self.viewMap.isMyLocationEnabled = true
        
        viewMap.delegate = self
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//           return .lightContent
//
//       }
//
//       override func loadView() {
//           let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 14.0)
//           let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//
//           do {
//               if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json"){
//                   mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
//               } else {
//                   NSLog("Unable to find style.json")
//               }
//           }catch {
//               NSLog("One or more of the map styles failed to load. \(error)")
//           }
//
//
//
//       }

    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let coordinate = locationManager.location?.coordinate
        var location = locationManager.location?.coordinate
        var myCoordinate = (locationManager.location?.coordinate)!
        cameraMoveToLocation(toLocation: location)

    }

    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            viewMap.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
        }
    }
    
    func createPin (coordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D{
        
        let pin = GMSMarker(position: coordinate)
        pin.icon = GMSMarker.markerImage(with: .orange)
        pin.appearAnimation = .pop
        pin.map = viewMap
        
        return coordinate
 
  //      drawlineTo(coordinates: coordinate)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }


    var newCoord = CLLocationCoordinate2D()
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if count == 0 {
            var myCoordinate = (locationManager.location?.coordinate)!
            newCoord = createPin(coordinate: coordinate)
            let path = GMSMutablePath()
            path.add(myCoordinate)
            path.add(coordinate)
            let polyLine = GMSPolyline(path: path)
            polyLine.map = viewMap
            polyLine.strokeWidth = 3
        count += 1
        }else{
        
            createPin(coordinate: coordinate)
    //        var myCoordinate = coordinate
            let path = GMSMutablePath()
            path.add(newCoord)
            path.add(coordinate)
            let polyLine = GMSPolyline(path: path)
            polyLine.map = viewMap
            polyLine.strokeWidth = 3
            newCoord = coordinate
        }


    }
    
}
