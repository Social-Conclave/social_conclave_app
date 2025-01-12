import 'package:flutter/material.dart';
import 'package:social_conclave_app/app_colors.dart';
import '../data/schedule_info.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'SCHEDULE',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: scheduleData.length,
                itemBuilder: (context, index) {
                  String day = scheduleData.keys.elementAt(index);
                  List<EventDetails> events = scheduleData[day]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          day,
                          style: TextStyle(
                            color: index % 2 == 0
                                ? AppColors.primaryGreen
                                : AppColors.primaryBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? AppColors.primaryGreen
                              : AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: events.length,
                          itemBuilder: (context, eventIndex) {
                            return TimeSlotTile(event: events[eventIndex]);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSlotTile extends StatelessWidget {
  final EventDetails event;

  const TimeSlotTile({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${event.startTime} - ${event.endTime}',
            style: const TextStyle(
              color: AppColors.gray,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            event.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            event.description,
            style: const TextStyle(
              color: AppColors.gray,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
