import 'package:flutter/material.dart';
 import '../../../../../core/l10n/app_strings.dart';
import '../shared/app_text_field.dart';
import '../shared/section_header.dart';

class MeetingSection extends StatelessWidget {
  final TextEditingController zoomController;

  const MeetingSection({super.key, required this.zoomController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: AppStrings.sectionMeeting,
          icon: Icons.videocam_outlined,
        ),
        AppTextField(
          label: AppStrings.labelZoomLink,
          controller: zoomController,
          hint: AppStrings.hintZoomLink,
          keyboardType: TextInputType.url,
          prefixIcon: const Icon(Icons.link_rounded),
        ),
      ],
    );
  }
}
