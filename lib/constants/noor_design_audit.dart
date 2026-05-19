/// Task 0 — Figma design audit manifest (no UI widgets).
///
/// File: تطبيق نور — Arabic UI
/// https://www.figma.com/design/CKJOEO1Qn9nMqHJNBW4IGH
abstract final class NoorDesignAudit {
  static const figmaFileKey = 'CKJOEO1Qn9nMqHJNBW4IGH';
  static const figmaUrl =
      'https://www.figma.com/design/CKJOEO1Qn9nMqHJNBW4IGH/'
      '%D8%AA%D8%B7%D8%A8%D9%8A%D9%82-%D9%86%D9%88%D8%B1---Arabic-UI'
      '?node-id=1-2&m=dev';
  static const homePageName = 'الصفحة الرئيسية';
  static const homeFrameNodeId = '1:2';
  static const homeFrameName = 'Phone Frame';

  static const screens = [
    NoorScreen(
      name: 'HomeScreen',
      figmaFrame: homeFrameName,
      nodeId: homeFrameNodeId,
      buildTask: 14,
    ),
  ];

  static const components = [
    NoorComponent(
      name: 'HomeHeader',
      nodeIds: ['1:3', '1:4', '1:5'],
      buildTask: 5,
    ),
    NoorComponent(
      name: 'SectionHeader',
      nodeIds: ['1:25', '1:26'],
      buildTask: 6,
    ),
    NoorComponent(
      name: 'PrayerTimeChip',
      nodeIds: ['1:14', '1:18'],
      buildTask: 7,
    ),
    NoorComponent(
      name: 'NextPrayerBanner',
      nodeId: '1:9',
      buildTask: 8,
    ),
    NoorComponent(
      name: 'PrayerTimesCard',
      nodeId: '1:6',
      buildTask: 9,
    ),
    NoorComponent(
      name: 'ZoomChip',
      nodeIds: ['1:34', '1:43'],
      buildTask: 10,
    ),
    NoorComponent(
      name: 'EventCard',
      nodeIds: ['1:27', '1:36'],
      buildTask: 11,
    ),
    NoorComponent(
      name: 'FollowingBadge',
      nodeId: '1:52',
      buildTask: 12,
    ),
    NoorComponent(
      name: 'ProgramCard',
      nodeIds: ['1:47', '1:54', '1:59', '1:64'],
      buildTask: 13,
    ),
  ];

  static const phase1Tasks = [
    'Task 1: RTL + MaterialApp locale',
    'Task 2: Directionality smoke test',
    'Task 3: constants (app_colors, app_text_styles, app_dimens)',
    'Task 4: Arabic fonts in pubspec + ThemeData',
  ];

  static const phase5Tasks = [
    'Task P1: Micro-animations',
    'Task P2: Accessibility',
    'Task P3: Figma side-by-side review',
  ];
}

class NoorScreen {
  const NoorScreen({
    required this.name,
    required this.figmaFrame,
    required this.nodeId,
    required this.buildTask,
  });

  final String name;
  final String figmaFrame;
  final String nodeId;
  final int buildTask;
}

class NoorComponent {
  const NoorComponent({
    required this.name,
    required this.buildTask,
    this.nodeId,
    this.nodeIds = const [],
  });

  final String name;
  final String? nodeId;
  final List<String> nodeIds;
  final int buildTask;
}
