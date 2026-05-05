// lib/admin/home_admin/presentation/view/program_details.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/admin/home_admin/data/model/event_model.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';
import 'package:quran_app/admin/home_admin/data/remote_data_source/event_remote_data_source.dart';
import 'package:quran_app/admin/home_admin/data/repo_impl/event_repo_impl.dart';
  import '../maneger/cubit/event_cubit.dart';
import '../maneger/cubit/event_state.dart';
import 'add_event.dart';

class ProgramDetails extends StatelessWidget {
  final ProgramModel program;

  const ProgramDetails({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EventCubit(
        EventRepoImpl(EventRemoteDataSource(FirebaseFirestore.instance)),
      )..getEventsByProgram(program.id!),
      child: Scaffold(
        appBar: AppBar(title: Text(program.title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Program info card ──────────────────────────
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(program.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(program.desc,
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.shade700)),
                ],
              ),
            ),

            // ── Events section header ──────────────────────
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Events',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 8),

            // ── Events list ───────────────────────────────
            Expanded(
              child: BlocBuilder<EventCubit, EventState>(
                builder: (context, state) {

                  if (state is EventLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is EventError) {
                    return Center(child: Text(state.error));
                  }

                  if (state is EventsFetchSuccess) {
                    final events = state.events;

                    // ── No events yet ────────────────────
                    if (events.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.event_busy,
                                size: 48, color: Colors.grey.shade400),
                            const SizedBox(height: 12),
                            Text('No events yet',
                                style: TextStyle(
                                    color: Colors.grey.shade500)),
                            const SizedBox(height: 4),
                            Text('Tap + to add the first event',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade400)),
                          ],
                        ),
                      );
                    }

                    // ── Event cards ──────────────────────
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return _EventCard(event: event);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),

        // ── FAB → AddEvent ─────────────────────────────────
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddEvent(programId: program.id!),
              ),
            );
            // Refresh events when returning
            if (context.mounted) {
              context
                  .read<EventCubit>()
                  .getEventsByProgram(program.id!);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final EventModel event;

  const _EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    final formatted =
        DateFormat('EEE, MMM d • hh:mm a').format(event.scheduledAt);
    final h = event.durationMinutes ~/ 60;
    final m = event.durationMinutes % 60;
    final duration =
        h > 0 ? (m > 0 ? '${h}h ${m}m' : '${h}h') : '${m}m';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(event.contentTitle,
              style: const TextStyle(
                  fontSize: 12, color: Colors.deepPurple)),
          const SizedBox(height: 4),
          Text(event.eventTitle,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text(event.desc,
              style: TextStyle(
                  fontSize: 13, color: Colors.grey.shade600)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.calendar_today,
                  size: 13, color: Colors.grey),
              const SizedBox(width: 4),
              Text(formatted,
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade600)),
              const Spacer(),
              const Icon(Icons.timer, size: 13, color: Colors.grey),
              const SizedBox(width: 4),
              Text(duration,
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade600)),
            ],
          ),
          if (event.zoomLink.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.link, size: 13, color: Colors.blue),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(event.zoomLink,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.blue)),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}