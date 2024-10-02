import 'package:flutter/material.dart';
import 'dummy.dart'; // Ensure you have this file with the data

class FacultyPage extends StatelessWidget {
  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fakultas'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: facultyList.length,
        itemBuilder: (context, index) {
          final Faculty faculty = facultyList[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fakultas: ${faculty.name}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Image.network(faculty.imageUrls[0]),
                  const SizedBox(height: 8.0),
                  Text("Jumlah Jurusan: ${faculty.numberOfMajors}"),
                  Text("Jumlah Mahasiswa ${faculty.numberOfStudents}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
