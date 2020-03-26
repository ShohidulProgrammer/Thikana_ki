import 'package:flutter/material.dart';

class EmergencyMenuItem {
  const EmergencyMenuItem({@required this.icon, this.title, this.color});

  final String title;
  final IconData icon;
  final Color color;
}

const List<EmergencyMenuItem> allEmergencyMenuItems = <EmergencyMenuItem>[
  EmergencyMenuItem(
      title: '999-National Emergency Service ',
      icon: Icons.person_pin_circle,
      color: Colors.blueGrey),
  EmergencyMenuItem(
      title: 'Public Toilet', icon: Icons.accessible, color: Colors.brown),
  EmergencyMenuItem(
      title: 'Fire Service', icon: Icons.directions_bus, color: Colors.red),
  EmergencyMenuItem(
      title: 'Hospital', icon: Icons.local_hospital, color: Colors.green),
];
