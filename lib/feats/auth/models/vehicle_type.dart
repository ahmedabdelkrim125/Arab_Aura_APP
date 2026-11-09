import 'package:arab_ora_app/core/localization/app_strings.dart';

enum VehicleType {
  motorcycle,
  bicycle,
  car;

  String label(AppStrings strings) {
    return switch (this) {
      VehicleType.motorcycle => strings.vehicleMotorcycle,
      VehicleType.bicycle => strings.vehicleBicycle,
      VehicleType.car => strings.vehicleCar,
    };
  }
}
