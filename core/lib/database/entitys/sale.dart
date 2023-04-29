import 'package:floor/floor.dart';

import 'collaborator.dart';

@Entity(tableName: "sales_table", foreignKeys: [
  ForeignKey(
    childColumns: ['collaboratorId'],
    parentColumns: ['id'],
    entity: Collaborator,
  )
])
class Sale {
  @PrimaryKey(autoGenerate: true)
  int? id;

  double value;
  int collaboratorId;
  DateTime saleDate;

  Sale(
      {this.id,
      required this.value,
      required this.collaboratorId,
      required this.saleDate});
}
