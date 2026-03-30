enum Flavor { dev, stg, prod }

class FlavorConfig {
  final Flavor flavor;
  final String appName;
  final String bundleId;
  final String baseUrl;

  FlavorConfig._({
    required this.flavor,
    required this.appName,
    required this.bundleId,
    required this.baseUrl,
  });

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    assert(
      _instance != null,
      'FlavorConfig must be initialised before use. '
      'Call FlavorConfig.init() in your main_*.dart entry point.',
    );
    return _instance!;
  }

  static void init({
    required Flavor flavor,
    required String appName,
    required String bundleId,
    required String baseUrl,
  }) {
    _instance = FlavorConfig._(
      flavor: flavor,
      appName: appName,
      bundleId: bundleId,
      baseUrl: baseUrl,
    );
  }

  bool get isDev => flavor == Flavor.dev;
  bool get isStg => flavor == Flavor.stg;
  bool get isProd => flavor == Flavor.prod;

  @override
  String toString() =>
      'FlavorConfig(flavor: $flavor, appName: $appName, '
      'bundleId: $bundleId, baseUrl: $baseUrl)';
}
