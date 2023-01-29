import 'package:floor/floor.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';

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

  Sale({this.id, required this.value, required this.collaboratorId});
}
