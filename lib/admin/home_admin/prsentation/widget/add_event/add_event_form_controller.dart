import 'package:flutter/material.dart';

/// Owns all TextEditingControllers and local UI state for AddEventScreen.
/// The State class is just a coordinator — all form logic lives here.
class AddEventFormController {
  final eventTitle = TextEditingController();
  final desc       = TextEditingController();
  final zoomLink   = TextEditingController();

  DateTime?  selectedDate;
  TimeOfDay? selectedTime;
  int        durationMinutes = 60;

  // ── Validation ───────────────────────────────────────
  bool get isValid =>
      eventTitle.text.trim().isNotEmpty &&
      desc.text.trim().isNotEmpty &&
      zoomLink.text.trim().isNotEmpty &&
      selectedDate != null &&
      selectedTime != null;

  // ── Computed ─────────────────────────────────────────
  DateTime get scheduledAt => DateTime(
    selectedDate!.year,
    selectedDate!.month,
    selectedDate!.day,
    selectedTime!.hour,
    selectedTime!.minute,
  );

  String formatDuration(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h > 0 && m > 0) return '${h}h ${m}m';
    if (h > 0)          return '${h}h';
    return '${m}m';
  }

  // ── Lifecycle ────────────────────────────────────────
  void dispose() {
    eventTitle.dispose();
    desc.dispose();
    zoomLink.dispose();
  }
}
