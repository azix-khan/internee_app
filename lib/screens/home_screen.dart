import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 8.0,
                    left: 4.0,
                    child: Text(
                      "App Making.co",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Dashboard"),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // This will open the drawer
              },
            );
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text(
          "Pakistan's Virtual Internship platform",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Home',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Card(
              color: Colors.white, // Change the color to white
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Welcome from Internee.pk, Aziz Ur Rahman!'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Your running tasks',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '#',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Task id',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Actions',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    TaskWidget(numText: '1', taskText: 'TSK-000-25'),
                    const Divider(),
                    TaskWidget(numText: '2', taskText: 'TSK-000-45'),
                    const Divider(),
                    TaskWidget(numText: '3', taskText: 'TSK-000-43'),
                    const Divider(),
                    TaskWidget(numText: '4', taskText: 'TSK-000-46'),
                    const Divider(),
                    TaskWidget(numText: '5', taskText: 'TSK-000-47'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  final String numText, taskText;
  TaskWidget({Key? key, required this.numText, required this.taskText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(numText),
            ],
          ),
          Text(taskText),
          const Text(
            'View',
            style:
                TextStyle(backgroundColor: Colors.green, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
