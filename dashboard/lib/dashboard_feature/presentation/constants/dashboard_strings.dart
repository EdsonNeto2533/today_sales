class DashboardStrings {
  static String collaboratorNamePlaceholder = "Nome do colaborador";
  static String collaboratorDescPlaceholder = "Cargo do colaborador";
  static String salePlaceholder = "Valor da venda";
  static String inputFieldsTitle = "Adicionar colaborador";
  static String addButtonText = "Adicionar";
  static String saleDate = "Data venda";
  static String report = "Relatório";
  static String totalSalesLabel = "Valor total das vendas";
  static String numberSalesLabel = "Quantidade de vendas";
  static String peformanceLabel = "Gráfico de desempenho";

  static String collaboratorSaleText(String collaboratorName) {
    return "Adicionar venda a $collaboratorName".toUpperCase();
  }

  static String salesQuantity(int salesQnt) {
    return "Número de vendas $salesQnt";
  }

  static String selectedDateText(DateTime? selectedDate) {
    return selectedDate != null
        ? "Data selecionada: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
        : "Data não selecionada";
  }
}
