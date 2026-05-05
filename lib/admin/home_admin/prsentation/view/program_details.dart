import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/admin/core/l10n/app_strings.dart';
import 'package:quran_app/admin/core/theme/app_text_styles.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/cubit/event_state.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_event.dart';


import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimens.dart';
import '../../data/model/event_model.dart';
import '../../data/model/program_model.dart';
import '../../data/remote_data_source/event_remote_data_source.dart';
import '../../data/repo_impl/event_repo_impl.dart';
import '../maneger/cubit/event_cubit.dart';


class ProgramDetails extends StatelessWidget {
  final ProgramModel program;

  const ProgramDetails({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EventCubit(
        EventRepoImpl(EventRemoteDataSource(FirebaseFirestore.instance)),
      )..getEventsByProgram(program.id!),
      child: _ProgramDetailsView(program: program),
    );
  }
}

class _ProgramDetailsView extends StatelessWidget {
  final ProgramModel program;

  const _ProgramDetailsView({required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(program.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimens.md),
          const _SectionHeader(),
          const SizedBox(height: AppDimens.sm),
          Expanded(child: _EventsList(programId: program.id!)),
        ],
      ),
      floatingActionButton: _AddEventFab(programId: program.id!),
    );
  }
}

// ─────────────────────────────────────────────────────────
// Section header
// ─────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.md),
      child: Row(
        children: [
          const Icon(
            Icons.event_rounded,
            color: AppColors.gold,
            size: AppDimens.sectionIconSize,
          ),
          const SizedBox(width: AppDimens.sm),
          Text("AppStrings.sectionEvents", style: AppTextStyles.headingSmall),
          const SizedBox(width: AppDimens.sm),
          const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// Events list — handles all BLoC states
// ─────────────────────────────────────────────────────────
class _EventsList extends StatelessWidget {
  final String programId;

  const _EventsList({required this.programId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state is EventLoading)       return const _LoadingView();
        if (state is EventError)         return _ErrorView(message: state.error);
        if (state is EventsFetchSuccess) {
          if (state.events.isEmpty)      return const _EmptyView();
          return _EventsListView(events: state.events);
        }
        return const SizedBox();
      },
    );
  }
}

// ─────────────────────────────────────────────────────────
// State views
// ─────────────────────────────────────────────────────────
class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_rounded,
              size: 48, color: AppColors.error),
          const SizedBox(height: AppDimens.sm),
          Text(message, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.event_busy_rounded,
              size: 48, color: AppColors.textDisabled),
          const SizedBox(height: AppDimens.sm),
          Text("AppStrings.emptyEventsTitle",
              style: AppTextStyles.bodyMedium),
          const SizedBox(height: AppDimens.xs),
          Text("AppStrings.emptyEventsSubtitle",
              style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}

class _EventsListView extends StatelessWidget {
  final List<EventModel> events;

  const _EventsListView({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.md),
      itemCount: events.length,
      itemBuilder: (_, index) => _EventCard(event: events[index]),
    );
  }
}

// ─────────────────────────────────────────────────────────
// Event card
// ─────────────────────────────────────────────────────────
class _EventCard extends StatelessWidget {
  final EventModel event;

  const _EventCard({required this.event});

  String get _formattedDate =>
      DateFormat('EEE, MMM d • hh:mm a').format(event.scheduledAt);

  String get _formattedDuration {
    final h = event.durationMinutes ~/ 60;
    final m = event.durationMinutes % 60;
    if (h > 0 && m > 0) return '${h}h ${m}m';
    if (h > 0)          return '${h}h';
    return '${m}m';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.sm + AppDimens.xs),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(title: event.eventTitle),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimens.md,
              0,
              AppDimens.md,
              AppDimens.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.desc, style: AppTextStyles.bodySmall),
                const SizedBox(height: AppDimens.sm),
                const Divider(color: AppColors.divider, thickness: 1),
                const SizedBox(height: AppDimens.sm),
                _CardMeta(
                  formatted: _formattedDate,
                  duration: _formattedDuration,
                ),
                if (event.zoomLink.isNotEmpty) ...[
                  const SizedBox(height: AppDimens.sm),
                  _ZoomLinkRow(link: event.zoomLink),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Card sub-widgets ──────────────────────────────────────

class _CardHeader extends StatelessWidget {
  final String title;

  const _CardHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.md,
        vertical: AppDimens.sm + AppDimens.xs,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primarySurface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.radiusLg),
        ),
      ),
      child: Text(title, style: AppTextStyles.headingSmall),
    );
  }
}

class _CardMeta extends StatelessWidget {
  final String formatted;
  final String duration;

  const _CardMeta({required this.formatted, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_today_rounded,
            size: 13, color: AppColors.gold),
        const SizedBox(width: AppDimens.xs),
        Text(formatted, style: AppTextStyles.bodySmall),
        const Spacer(),
        const Icon(Icons.timer_rounded, size: 13, color: AppColors.gold),
        const SizedBox(width: AppDimens.xs),
        Text(duration, style: AppTextStyles.bodySmall),
      ],
    );
  }
}

class _ZoomLinkRow extends StatelessWidget {
  final String link;

  const _ZoomLinkRow({required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.sm,
        vertical: AppDimens.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.infoLight,
        borderRadius: BorderRadius.circular(AppDimens.radiusSm),
      ),
      child: Row(
        children: [
          const Icon(Icons.link_rounded, size: 13, color: AppColors.info),
          const SizedBox(width: AppDimens.xs),
          Expanded(
            child: Text(
              link,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.info),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// FAB
// ─────────────────────────────────────────────────────────
class _AddEventFab extends StatelessWidget {
  final String programId;

  const _AddEventFab({required this.programId});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddEventScreen(programId: programId),
          ),
        );
        if (context.mounted) {
          context.read<EventCubit>().getEventsByProgram(programId);
        }
      },
      child: const Icon(Icons.add_rounded),
    );
  }
}