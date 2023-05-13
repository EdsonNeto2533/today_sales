import 'package:flutter/material.dart';

class CollaboratorDetailsPage extends StatefulWidget {
  final int collaboratorId;
  const CollaboratorDetailsPage({
    super.key,
    required this.collaboratorId,
  });

  @override
  State<CollaboratorDetailsPage> createState() =>
      _CollaboratorDetailsPageState();
}

class _CollaboratorDetailsPageState extends State<CollaboratorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
