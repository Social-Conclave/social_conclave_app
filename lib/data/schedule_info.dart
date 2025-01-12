final Map<String, List<EventDetails>> scheduleData = {
  'DAY 1': [
    EventDetails(
      startTime: '10:00 AM',
      endTime: '11:00 AM',
      title: 'Opening Ceremony',
      description: 'Welcome address and introduction to the conference',
    ),
    EventDetails(
      startTime: '11:00 AM',
      endTime: '12:00 PM',
      title: 'Keynote Speaker',
      description: 'Industry insights and future trends',
    ),
    EventDetails(
      startTime: '12:00 PM',
      endTime: '01:00 PM',
      title: 'Networking Lunch',
      description: 'Connect with fellow attendees over lunch',
    ),
    EventDetails(
      startTime: '01:00 PM',
      endTime: '02:00 PM',
      title: 'Workshop Session',
      description: 'Interactive learning and hands-on activities',
    ),
  ],
  'DAY 2': [
    EventDetails(
      startTime: '10:00 AM',
      endTime: '11:00 AM',
      title: 'Panel Discussion',
      description: 'Expert panel on sustainability',
    ),
    EventDetails(
      startTime: '11:00 AM',
      endTime: '12:00 PM',
      title: 'Breakout Sessions',
      description: 'Small group discussions on key topics',
    ),
    EventDetails(
      startTime: '12:00 PM',
      endTime: '01:00 PM',
      title: 'Lunch & Learn',
      description: 'Educational session during lunch break',
    ),
    EventDetails(
      startTime: '01:00 PM',
      endTime: '02:00 PM',
      title: 'Innovation Showcase',
      description: 'Presentation of new ideas and projects',
    ),
  ],
  'DAY 3': [
    EventDetails(
      startTime: '10:00 AM',
      endTime: '11:00 AM',
      title: 'Tech Workshop',
      description: 'Hands-on technology demonstration',
    ),
    EventDetails(
      startTime: '11:00 AM',
      endTime: '12:00 PM',
      title: 'Industry Updates',
      description: 'Latest developments and trends',
    ),
    EventDetails(
      startTime: '12:00 PM',
      endTime: '01:00 PM',
      title: 'Community Meetup',
      description: 'Networking and community building',
    ),
    EventDetails(
      startTime: '01:00 PM',
      endTime: '02:00 PM',
      title: 'Closing Ceremony',
      description: 'Final remarks and future plans',
    ),
  ],
};

class EventDetails {
  final String startTime;
  final String endTime;
  final String title;
  final String description;

  EventDetails({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.description,
  });
}
