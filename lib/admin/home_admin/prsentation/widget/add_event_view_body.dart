import '../../../core/function/add_event_action.dart';
import '../maneger/cubit/event_state.dart';
import '../widget/add_event/add_event_form_controller.dart';
import '../widget/add_event/sections/basic_info_section.dart';
import '../widget/add_event/sections/meeting_section.dart';
import '../widget/add_event/sections/schedule_section.dart';
import '../widget/add_event/shared/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_dimens.dart';
import '../maneger/cubit/event_cubit.dart';

class AddEventViewBody extends StatefulWidget {
  final String programId;

  const AddEventViewBody({super.key, required this.programId});

  @override
  State<AddEventViewBody> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventViewBody> {
  late final AddEventFormController _form;

  @override
  void initState() {
    super.initState();
    _form = AddEventFormController();
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EventCubit, EventState>(
      listener: (context, state) {
        if (state is EventAddSuccess) {
          Navigator.pop(context);
          context.read<EventCubit>().getEventsByProgram(
            widget.programId,
          ); // or fetchEvents(), loadEvents()
        }
        if (state is EventError) {
          AddEventActions.showError(context, state.error);
        }
      },
      child: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimens.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BasicInfoSection(
                  titleController: _form.eventTitle,
                  descController: _form.desc,
                ),
                const SizedBox(height: AppDimens.lg),

                MeetingSection(zoomController: _form.zoomLink),
                const SizedBox(height: AppDimens.lg),

                ScheduleSection(
                  selectedDate: _form.selectedDate,
                  selectedTime: _form.selectedTime,
                  durationMinutes: _form.durationMinutes,
                  formattedDuration: _form.formatDuration(
                    _form.durationMinutes,
                  ),
                  onPickDate: () => AddEventActions.pickDate(
                    context: context,
                    form: _form,
                    onPicked: () => setState(() {}),
                  ),
                  onPickTime: () => AddEventActions.pickTime(
                    context: context,
                    form: _form,
                    onPicked: () => setState(() {}),
                  ),
                  onDurationChanged: (value) =>
                      setState(() => _form.durationMinutes = value),
                ),
                const SizedBox(height: AppDimens.xl),

                SaveButton(
                  isLoading: state is EventLoading,
                  onPressed: () => AddEventActions.submit(
                    context: context,
                    form: _form,
                    programId: widget.programId,
                  ),
                ),

                const SizedBox(height: AppDimens.lg),
              ],
            ),
          );
        },
      ),
    );
  }
}
