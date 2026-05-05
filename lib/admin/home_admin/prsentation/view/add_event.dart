// lib/admin/home_admin/presentation/view/add_event.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/home_admin/data/model/event_model.dart';
import 'package:quran_app/admin/home_admin/data/remote_data_source/event_remote_data_source.dart';
import 'package:quran_app/admin/home_admin/data/repo_impl/event_repo_impl.dart';

import '../maneger/cubit/event_cubit.dart';
import '../maneger/cubit/event_state.dart';
 
class AddEvent extends StatefulWidget {
  final String programId; // passed from ProgramDetails

  const AddEvent({super.key, required this.programId});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _contentTitleController = TextEditingController();
  final _eventTitleController   = TextEditingController();
  final _descController         = TextEditingController();
  final _zoomLinkController     = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _durationMinutes = 60;

  @override
  void dispose() {
    _contentTitleController.dispose();
    _eventTitleController.dispose();
    _descController.dispose();
    _zoomLinkController.dispose();
    super.dispose();
  }

  String _formatDuration(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h > 0 && m > 0) return '${h}h ${m}m';
    if (h > 0) return '${h}h';
    return '${m}m';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  void _submit(BuildContext context) {
    // Validation
    if (_contentTitleController.text.trim().isEmpty ||
        _eventTitleController.text.trim().isEmpty ||
        _descController.text.trim().isEmpty ||
        _zoomLinkController.text.trim().isEmpty ||
        _selectedDate == null ||
        _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    final scheduledAt = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final event = EventModel(
      contentTitle:    _contentTitleController.text.trim(),
      eventTitle:      _eventTitleController.text.trim(),
      desc:            _descController.text.trim(),
      programId:       widget.programId,
      zoomLink:        _zoomLinkController.text.trim(),
      scheduledAt:     scheduledAt,
      durationMinutes: _durationMinutes,
    );

    context.read<EventCubit>().addEvent(event);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EventCubit(
        EventRepoImpl(EventRemoteDataSource(FirebaseFirestore.instance)),
      ),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Add Event')),
          body: BlocListener<EventCubit, EventState>(
            listener: (context, state) {
              if (state is EventAddSuccess) {
                Navigator.pop(context); // back to ProgramDetails
              }
              if (state is EventError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                final isLoading = state is EventLoading;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // ── Content title ─────────────────────
                      _label('Content title'),
                      TextField(
                        controller: _contentTitleController,
                        decoration: const InputDecoration(
                          hintText: 'e.g. Ramadan Series 2025',
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ── Event title ───────────────────────
                      _label('Event title'),
                      TextField(
                        controller: _eventTitleController,
                        decoration: const InputDecoration(
                          hintText: 'e.g. Session 1 — Introduction',
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ── Description ───────────────────────
                      _label('Event description'),
                      TextField(
                        controller: _descController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Describe what this event covers...',
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ── Zoom link ─────────────────────────
                      _label('Zoom meeting link'),
                      TextField(
                        controller: _zoomLinkController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          hintText: 'https://zoom.us/j/...',
                          prefixIcon: Icon(Icons.link),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ── Upload material (skipped) ─────────
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.upload_file,
                                color: Colors.grey.shade400),
                            const SizedBox(height: 4),
                            Text('Upload material',
                                style: TextStyle(color: Colors.grey.shade400)),
                            Text('Coming soon',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade400)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ── Date & Time ───────────────────────
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Date'),
                                OutlinedButton.icon(
                                  onPressed: _pickDate,
                                  icon: const Icon(Icons.calendar_today,
                                      size: 16),
                                  label: Text(
                                    _selectedDate == null
                                        ? 'Pick date'
                                        : '${_selectedDate!.day}/'
                                          '${_selectedDate!.month}/'
                                          '${_selectedDate!.year}',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Time'),
                                OutlinedButton.icon(
                                  onPressed: _pickTime,
                                  icon: const Icon(Icons.access_time,
                                      size: 16),
                                  label: Text(
                                    _selectedTime == null
                                        ? 'Pick time'
                                        : _selectedTime!.format(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // ── Duration ──────────────────────────
                      _label(
                          'Duration — ${_formatDuration(_durationMinutes)}'),
                      Slider(
                        value: _durationMinutes.toDouble(),
                        min: 15,
                        max: 480,
                        divisions: 31,
                        label: _formatDuration(_durationMinutes),
                        onChanged: (v) =>
                            setState(() => _durationMinutes = v.round()),
                      ),
                      const SizedBox(height: 24),

                      // ── Save button ───────────────────────
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () => _submit(context),
                          style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white),
                                )
                              : const Text('Save event',
                                  style: TextStyle(fontSize: 15)),
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text,
            style: const TextStyle(fontSize: 13, color: Colors.grey)),
      );
}