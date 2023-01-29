import 'package:floor/floor.dart';
import 'package:today_sale/commons/database/entitys/sale.dart';

@dao
abstract class SaleDAO {
  @Query("SELECT * FROM sales_table")
  Future<List<Sale>> getSales();

  @Query("SELECT * FROM sales_table WHERE id == :saleId")
  Future<List<Sale>> getSaleById(int saleId);

  @Query("SELECT * FROM sales_table WHERE collaboratorId == :collaboratorId")
  Future<List<Sale>> getSaleByCollaboratorId(int collaboratorId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSale(Sale sale);

  @delete
  Future<void> deleteSale(Sale sale);
}
