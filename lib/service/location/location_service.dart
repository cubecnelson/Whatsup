import 'package:location/location.dart';

class LocationService {
  LocationService({required Location location}) : _location = location;

  LocationService._newInstance(this._location);

  static final LocationService _instance =
      LocationService._newInstance(Location());

  static LocationService get instance => _instance;

  final Location _location;
  late bool _serviceEnabled = false;
  PermissionStatus permissionGranted = PermissionStatus.denied;
  late LocationData _locationData;

  LocationData get lastLocationData {
    return _locationData;
  }

  Future<bool> checkIfServiceEnabled() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }
    return _serviceEnabled;
  }

  Future<PermissionStatus> checkIfPermissionGranted() async {
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
    }
    return permissionGranted;
  }

  Future<LocationData> getRealTimeLocation() async {
    return _locationData = await _location.getLocation();
  }

  Stream<LocationData> locationChanges() {
    return _location.onLocationChanged;
  }
}
