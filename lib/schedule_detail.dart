import 'package:flutter/material.dart';

class ScheduleDetail extends StatelessWidget {
  final String date;
  final String route;
  final String time;
  final String meetingPoint;
  final String description;

  const ScheduleDetail({
    super.key,
    required this.date,
    required this.route,
    required this.time,
    required this.meetingPoint,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride Details"),
        backgroundColor: const Color.fromARGB(255, 150, 162, 189),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center( // ⬅️ ini yang menaruh card di tengah layar
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.map,
                    color: Color.fromARGB(255, 226, 189, 232),
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    route,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 225, 158, 215),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Date: $date\nTime: $time\nMeeting Point: $meetingPoint",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 243, 162, 195),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Back to Schedule"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
