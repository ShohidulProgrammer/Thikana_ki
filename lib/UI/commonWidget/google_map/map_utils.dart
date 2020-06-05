import 'package:geolocator/geolocator.dart';

class MapUtils {
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('\n\nMy Location: $position');
    
    return position;
  }
}
