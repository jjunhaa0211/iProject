import UIKit
import MapKit
import CoreLocation
import SnapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    //위치 정보를 관리하는 클래스
    let locationManager = CLLocationManager()
    //사용자의 위치, 주소 검색, 주변 장소 표시 지도 기능
    let mapView = MKMapView()
    // 지도의 경로를 표시
    var polyline: MKPolyline?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //유저의 현재 위치 코드
        mapView.showsUserLocation = true
        //지도가 사용자의 위치를 따라가게 합니다.
        mapView.userTrackingMode = .follow
        
        // 위치 관리자 설정
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        // 더블 탭 제스처 추가
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        mapView.addGestureRecognizer(doubleTapGesture)
        
        // 뷰에 MapView 추가
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // 델리게이트 설정
        mapView.delegate = self
        
        // 주소 변환 및 위치 표시
        convertAddressToCoordinates(sourceAddress: "현재 위치 주소", destinationAddress: "경기도 성남시 분당구 분당내곡로 131, 8층(백현동)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startUpdatingLocation()
    }
    
    //위치를 지속적으로 업데이트하기 위해서 조건을 검사하는 것입니다.
    func startUpdatingLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    // 더블 탭했을 때 2배씩 커지는 효과
    @objc func handleDoubleTap(gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            let point = gesture.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            
            // 현재 지도의 확대 배율(초기 나의 위치 기준)
            var currentZoom = mapView.region.span.latitudeDelta
            
            // 등비 수열의 공비 설정 (2는 확대되는 비율)
            let commonRatio: Double = 2.0
            
            // 새로운 확대 배율 계산
            let newZoom = currentZoom * commonRatio
            
            // 현재 지도의 중심 좌표
            let currentCenterCoordinate = mapView.region.center
            
            // 새로운 지역 설정
            let span = MKCoordinateSpan(latitudeDelta: newZoom, longitudeDelta: newZoom)
            let region = MKCoordinateRegion(center: currentCenterCoordinate, span: span)
            
            // 콘솔에 확대 배율 출력
            print("Zoom Level: \(newZoom)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        // 현재 위치를 보여주기 위해 핀(annotation) 추가
        let annotation = MKPointAnnotation()
        //location의 CLLocation를 개체로 변환환
        annotation.coordinate = location.coordinate
        //내가 있는 곳 이름
        annotation.title = "현재 위치"

        mapView.addAnnotation(annotation)
        
        // 위치 업데이트 중지
        locationManager.stopUpdatingLocation()
        
        // 빨간 선 추가
        if let polyline = polyline {
            mapView.removeOverlay(polyline)
        }
        
        let sourceCoordinate = location.coordinate
        let destinationCoordinate = CLLocationCoordinate2D(latitude: 37.370103, longitude: 127.139640) // 경기도 성남시 분당구 분당내곡로 131, 8층(백현동)의 좌표
        
        let coordinates: [CLLocationCoordinate2D] = [sourceCoordinate, destinationCoordinate]
        polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        mapView.addOverlay(polyline!)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
    
    func convertAddressToCoordinates(sourceAddress: String, destinationAddress: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(sourceAddress) { [weak self] (sourcePlacemarks, error) in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
            }
            
            if let sourcePlacemark = sourcePlacemarks?.first {
                let sourceCoordinate = sourcePlacemark.location?.coordinate
                if let sourceCoordinate = sourceCoordinate {
                    self?.addAnnotationToMap(coordinate: sourceCoordinate, title: sourceAddress)
                }
            }
        }
        
        geocoder.geocodeAddressString(destinationAddress) { [weak self] (destinationPlacemarks, error) in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
            }
            
            if let destinationPlacemark = destinationPlacemarks?.first {
                let destinationCoordinate = destinationPlacemark.location?.coordinate
                if let destinationCoordinate = destinationCoordinate {
                    self?.addAnnotationToMap(coordinate: destinationCoordinate, title: destinationAddress)
                    self?.calculateAndDisplayRoute(sourceCoordinate: destinationCoordinate, destinationCoordinate: destinationCoordinate)
                }
            }
        }
    }
    
    func addAnnotationToMap(coordinate: CLLocationCoordinate2D, title: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        mapView.addAnnotation(annotation)
    }
    
    func calculateAndDisplayRoute(sourceCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { [weak self] (response, error) in
            if let error = error {
                print("Directions error: \(error.localizedDescription)")
                return
            }
            
            if let route = response?.routes.first {
                self?.mapView.addOverlay(route.polyline)
            }
        }
    }
}

extension ViewController: MKMapViewDelegate {
    
    //빨간색 선
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.red
            renderer.lineWidth = 3.0
            return renderer
        }
        return MKOverlayRenderer()
    }
}
