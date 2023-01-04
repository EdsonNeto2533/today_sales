import 'package:floor/floor.dart';

@entity
class Collaborator {
  @primaryKey
  final int id;
  final String name;

  Collaborator({required this.id, required this.name});
}
