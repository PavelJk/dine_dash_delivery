import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentPosition() async{//Получение местоположения пользвателя
  bool serviceEnable;
  LocationPermission permission;

  // Проверка на включение службы определения местоположения
  serviceEnable = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnable) {
    return Future.error('Не удается определить местоположение');
  }

  // Проверка статуса разрешения на размещение
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Ошибка разрешения доступа к местоположению');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('В определении местоположения отказано навсегда');
  }

  Position position = await Geolocator.getCurrentPosition();
  return position;
}