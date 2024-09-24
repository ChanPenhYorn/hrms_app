import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> item = [
      {
        "name": "John Doe",
        "age": 30,
        "gender": "Male",
        "profile": "assets/images/boy.png"
      },
      {
        "name": "Jane Doe",
        "age": 25,
        "gender": "Female",
        "profile": "assets/images/boy.png"
      },
      {
        "name": "John Doe",
        "age": 30,
        "gender": "Male",
        "profile": "assets/images/boy.png"
      },
      {
        "name": "Jane Doe",
        "age": 25,
        "gender": "Female",
        "profile": "assets/images/boy.png"
      },
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: item.length, // Replace with your actual data count
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2, // Replace with your desired column count
                mainAxisSpacing: 10,
                childAspectRatio: 1.0),
            itemBuilder: (BuildContext context, int index) {
              final data = item[index];
              return Card(
                color: Colors.amber,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image(image: AssetImage(data["profile"])),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data["name"]),
                    Text(data["gender"]),
                  ],
                )),
              );
            },
          ),
        ));
  }
}
