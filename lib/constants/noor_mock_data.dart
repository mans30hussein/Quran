import 'package:flutter/material.dart';
import 'package:quran_app/constants/app_colors.dart';

/// Static content copied from Figma `Phone Frame` (Task 0) for UI-only builds.
abstract final class NoorMockData {
  static const greeting = 'السلام عليكم';
  static const appTitle = 'نور | Noor';
  static const prayerSectionTitle = 'أوقات الصلاة';
  static const prayerDateLocation = 'الجمعة، ٩ مايو · القاهرة';
  static const nextPrayerLabel = 'الصلاة القادمة';
  static const nextPrayerName = 'العصر · Asr';
  static const nextPrayerTime = '03:45 PM';
  static const nextPrayerCountdown = 'خلال 1س 22د';

  static const eventsSectionTitle = 'الأحداث القادمة';
  static const programsSectionTitle = 'البرامج';
  static const viewAllLabel = 'عرض الكل';

  static const prayers = [
    _PrayerTime(name: 'الفجر', time: '4:22', isActive: false),
    _PrayerTime(name: 'الظهر', time: '12:05', isActive: false),
    _PrayerTime(name: 'العصر', time: '3:45', isActive: true),
    _PrayerTime(name: 'المغرب', time: '6:48', isActive: false),
    _PrayerTime(name: 'العشاء', time: '8:15', isActive: false),
  ];

  static const events = [
    _EventItem(
      day: '12',
      month: 'مايو',
      title: 'تفسير البقرة — الجزء الثالث',
      programLine: '📖 برنامج القرآن والتفسير',
      scheduleLine: '8:00 م · 90 دقيقة',
      showZoom: true,
    ),
    _EventItem(
      day: '15',
      month: 'مايو',
      title: 'حديث الأسبوع — النيات',
      programLine: '🌿 دراسات السنة',
      scheduleLine: '9:00 م · 60 دقيقة',
      showZoom: true,
    ),
  ];

  static const programs = [
    _ProgramItem(
      emoji: '📖',
      title: 'القرآن والتفسير',
      subtitle: 'جلسات تفسير أسبوعية',
      followers: '234 متابع',
      backgroundColor: AppColors.programGreen,
      isFollowing: true,
    ),
    _ProgramItem(
      emoji: '📚',
      title: 'دراسات السنة',
      subtitle: 'الحديث والفقه',
      followers: '189 متابع',
      backgroundColor: AppColors.programBlue,
      isFollowing: false,
    ),
    _ProgramItem(
      emoji: '🕌',
      title: 'العقيدة',
      subtitle: 'الإسلام العقدي',
      followers: '97 متابع',
      backgroundColor: AppColors.programPurple,
      isFollowing: false,
    ),
    _ProgramItem(
      emoji: '🤲',
      title: 'الأذكار والدعاء',
      subtitle: 'أذكار يومية',
      followers: '156 متابع',
      backgroundColor: AppColors.programOlive,
      isFollowing: false,
    ),
  ];
}

class _PrayerTime {
  const _PrayerTime({
    required this.name,
    required this.time,
    required this.isActive,
  });

  final String name;
  final String time;
  final bool isActive;
}

class _EventItem {
  const _EventItem({
    required this.day,
    required this.month,
    required this.title,
    required this.programLine,
    required this.scheduleLine,
    required this.showZoom,
  });

  final String day;
  final String month;
  final String title;
  final String programLine;
  final String scheduleLine;
  final bool showZoom;
}

class _ProgramItem {
  const _ProgramItem({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.followers,
    required this.backgroundColor,
    required this.isFollowing,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final String followers;
  final Color backgroundColor;
  final bool isFollowing;
}
