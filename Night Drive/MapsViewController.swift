//
//  MapsViewController.swift
//  Night Drive
//
//  Created by Rashon Poole on 12/5/20.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController, CLLocationManagerDelegate {
 
    @IBOutlet weak var viewMap: GMSMapView!
    //Variables
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeTheLocationManager()
        self.viewMap.isMyLocationEnabled = true
        
        viewMap.delegate = self
    }

    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let coordinate = locationManager.location?.coordinate
        var location = locationManager.location?.coordinate

        cameraMoveToLocation(toLocation: location)

    }

    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            viewMap.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
        }
    }
    
    func createPin (coordinate: CLLocationCoordinate2D){
        
        let pin = GMSMarker(position: coordinate)
        pin.icon = GMSMarker.markerImage(with: .orange)
        pin.appearAnimation = .pop
        pin.map = viewMap
        
 
        drawlineTo(coordinates: coordinate)
    }
    
    func drawlineTo(coordinates: CLLocationCoordinate2D){
        
        let myCoordinate = (locationManager.location?.coordinate)!
        let path = GMSMutablePath()
  //      path.add(myCoordinate)
        path.add(coordinates)
        let polyLine = GMSPolyline(path: path)
        polyLine.map = viewMap
        polyLine.strokeWidth = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapsViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        createPin(coordinate: coordinate)
    }
    
}
