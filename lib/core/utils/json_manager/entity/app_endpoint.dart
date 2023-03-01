enum AppEndpoint {
  badge("assets/jsons/badge-data.json"),
  list("assets/jsons/list-data.json");

  final String value;
  const AppEndpoint(this.value);
}
