import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';

class EmergencyMenuItem {
  const EmergencyMenuItem(
      {@required this.emergencyImageName, this.title, this.color, this.route});

  final String title;
  final String emergencyImageName;
  final Color color;
  final String route;
}

const List<EmergencyMenuItem> allEmergencyMenuItems = <EmergencyMenuItem>[
  EmergencyMenuItem(
    title: 'Public Toilet',
    emergencyImageName: 'public_toilet.png',
  ),
  EmergencyMenuItem(
      title: 'Police',
      emergencyImageName: 'national_emergency_service_999.PNG',
//      emergencyImageName: 'emergency_call_999.jpg',

      route: emergencyCategoryListFactoryPageRoute),
  EmergencyMenuItem(
    title: 'Fire Service',
    emergencyImageName: 'fire_service.png',
  ),
  EmergencyMenuItem(
    title: 'Hospital',
    emergencyImageName: 'hospital.png',
  ),
];
