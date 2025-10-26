import 'package:flutter/material.dart';
import 'schedule_detail.dart'; // pastikan nama file ini benar

void main() {
  runApp(const CyclingApp());
}

class CyclingApp extends StatelessWidget {
  const CyclingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semarang Cycling Schedule',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 248, 163, 204),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> schedule = [
      {
        "date": "22 OCT 2025",
        "route": "DIKALA – LATER S – SECTOR 1",
        "time": "06.00 AM",
        "meetingPoint": "DIKALA",
        "description": "Ride together towards a healthy lifestyle!"
      },
      {
        "date": "25 OCT 2025",
        "route": "KOPI 57 – GOMBEL – ANANTARI",
        "time": "06.30 AM",
        "meetingPoint": "KOPI 57",
        "description": "Fun uphill route — stay hydrated!"
      },
      {
        "date": "2 NOV 2025",
        "route": "MARINA BEACH – PRPP – JAGGAD",
        "time": "05.30 AM",
        "meetingPoint": "SIMPANG LIMA",
        "description": "Flat route for speed training — don’t forget your helmet!"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("🚴‍♀️ Semarang Cycling Schedule"),
        backgroundColor: const Color.fromARGB(255, 238, 162, 233),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF1F8E9),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: schedule.length,
          itemBuilder: (context, index) {
            final item = schedule[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.directions_bike,
                  color: Color.fromARGB(255, 134, 206, 235),
                ),
                title: Text(
                  item["route"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  "${item["date"]} • ${item["time"]}\nMeeting Point: ${item["meetingPoint"]}",
                ),
                isThreeLine: true,
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScheduleDetail(
                          date: item["date"],
                          route: item["route"],
                          time: item["time"],
                          meetingPoint: item["meetingPoint"],
                          description: item["description"],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 151, 179, 214),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Details"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
