import 'package:floor/floor.dart';

@Entity(tableName: 'collaborator_table')
class Collaborator {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;

  Collaborator({this.id, required this.name});
}
