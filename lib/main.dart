import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xfff5f7f9),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: Color(0xffb2b5be),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: <Widget>[
            Container(
              width: 50,
              margin: EdgeInsets.only(right: 9.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=1&w=500",
                ),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hi, Amazigh Halzoun",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text("Tuesday, Jun 20"),
                ],
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(13.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      "UPCOMMING APPOINTMENTS",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          AppointmentCard(),
                          AppointmentCard(),
                          AppointmentCard(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "My MEDICINES",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MedecineContainer(
                            active: true,
                            time: "Morning",
                          ),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: MedecineContainer(
                            active: false,
                            time: "Afternoon",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MedecineContainer(
                            active: false,
                            time: "Evening",
                          ),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: MedecineContainer(
                            active: false,
                            time: "Night",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "MESSAGES",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        MessagesCard(
                          color: Colors.blue,
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                        ),
                        MessagesCard(
                          color: Colors.blue,
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                        ),
                        MessagesCard(
                          color: Colors.blue,
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(11.0),
      padding: EdgeInsets.all(15.0),
      width: 250,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Consulting Doctor"),
          SizedBox(
            height: 21,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "http://pngimg.com/uploads/doctor/doctor_PNG15959.png",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Anthony Morrety",
                      style: TextStyle(fontSize: 23, color: Colors.blueAccent),
                    ),
                    Text(
                      "Clinical Medicine",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tommorow",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "03:30PM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MedecineContainer extends StatelessWidget {
  final String time;
  final bool active;

  const MedecineContainer(
      {super.key, required this.time, required this.active});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                  color: active ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.block,
                  color: Colors.yellow,
                ),
                active
                    ? Container()
                    : Icon(
                        Icons.block,
                        color: Colors.blue,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesCard extends StatelessWidget {
  final Color color;
  final Icon icon;

  const MessagesCard({super.key, required this.color, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300, blurRadius: 3.0, offset: Offset(0, 1))
      ]),
      margin: EdgeInsets.symmetric(vertical: 11.0, horizontal: 5.0),
      padding: EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: icon,
          ),
          SizedBox(
            width: 21,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Appointment Reminder",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  trailing: Text("10:00"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "You have an appointment with Amazigh Halzoun",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  trailing: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
