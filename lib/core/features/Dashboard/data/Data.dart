class DashBoardModel{
  final String cardName;
  final String cardImageUrl;
  final String namedRoute;

  DashBoardModel(this.cardName, this.cardImageUrl, this.namedRoute);
}

List<DashBoardModel> dashboardCard = [
  DashBoardModel("Agents", "lib/core/resources/images/agents.png", '/agentScreen'),
  DashBoardModel("Weapons", "lib/core/resources/images/weapons1.png", '/agentScreen'),
  DashBoardModel("Maps", "lib/core/resources/images/maps.png", '/agentScreen')
];