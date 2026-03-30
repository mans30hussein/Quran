enum Flavor { dev, staging, production } 

class AppConfig {
  final String baseUrl;
  final Flavor flavor;

  AppConfig({
    required this.baseUrl,
    required this.flavor,
  });
}