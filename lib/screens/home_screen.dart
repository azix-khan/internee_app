import 'package:flutter/material.dart';
import 'package:internee_pk/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          width: 200,
          backgroundColor: Colors.blueGrey[900],
          child: ListView(
            children: [
              const DrawerHeader(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 50.0,
                      left: 30.4,
                      child: Text(
                        "Internee.Pk",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.speed,
                  color: Colors.white,
                ),
                title: const Text(
                  "Dashboard",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
            ],
          ),
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
        actions: [
          const Icon(Icons.person),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                dispose();
              },
              child: const Icon(Icons.keyboard_arrow_down)),
          const SizedBox(
            width: 10,
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text(
          "Pakistan's Virtual Internship platform",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Welcome from Internee.pk,\nAziz Ur Rahman!'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Your running tasks',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
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
                      Divider(),
                      TaskWidget(numText: '1', taskText: 'TSK-000-25'),
                      Divider(),
                      TaskWidget(numText: '2', taskText: 'TSK-000-45'),
                      Divider(),
                      TaskWidget(numText: '3', taskText: 'TSK-000-43'),
                      Divider(),
                      TaskWidget(numText: '4', taskText: 'TSK-000-46'),
                      Divider(),
                      TaskWidget(numText: '5', taskText: 'TSK-000-47'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  final String numText, taskText;
  const TaskWidget({Key? key, required this.numText, required this.taskText})
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
          Container(
            height: 20,
            width: 40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.green),
            child: const Center(
              child: Text(
                'View',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
