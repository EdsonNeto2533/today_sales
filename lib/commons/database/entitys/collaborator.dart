import 'package:floor/floor.dart';

@Entity(tableName: "collaborator_table")
class Collaborator {
  @primaryKey
  final int id;
  final String name;

  Collaborator({required this.id, required this.name});
}
