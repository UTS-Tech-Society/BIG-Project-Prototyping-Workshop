import 'package:flutter/material.dart';

class SocietyEventList extends StatelessWidget {
  const SocietyEventList({
    Key? key,
  }) : super(key: key);

  List<SocietyEvent> _socEvents(BuildContext context) {
    return [
      SocietyEvent(
          title: "Communi-tea Catchups!",
          description:
              "This event aims to connect, support, and inspire women (including female-identifying and gender diverse people) in the IT community right here at UTS",
          date: "10/08/2021",
          imgPath: "./img/communitea.jpg"),
      SocietyEvent(
          title: "Software Engineering Panel!",
          description:
              "This event has RecordPoint’s leading engineers talking on what software engineering is and what a career in this diverse field might look like",
          date: "12/08/2021",
          imgPath: "./img/softwarepanel.jpg"),
      SocietyEvent(
          title: "The BIG Project!",
          description:
              "This event is a pilot 4-week challenge (running from August to September) where, in groups of 3-4, you will be given prompts to build a working prototype of an app",
          date: "19/08/2021",
          imgPath: "./img/big.jpg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('./img/techsoclogo.png', fit: BoxFit.contain, height: 32,),
        backgroundColor: new Color.fromRGBO(0, 47, 63, 1)
      ),
      body: Container(
        color: new Color.fromRGBO(0, 78, 104, 1),
        child: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
        children: _socEvents(context).map<Widget>((socEvent) {
          return EventCard(
            socEvent: socEvent,
          );
        }).toList(),
      )
      ),
    );
  }
}

class SocietyEvent {
  SocietyEvent({
    required this.title,
    required this.description,
    required this.date,
    required this.imgPath,
  });

  final String title;
  final String description;
  final String date;
  final String imgPath;
}

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.socEvent}) : super(key: key);

  final SocietyEvent socEvent;

  @override
  Widget build(BuildContext context) {
    final Widget imgWidget = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Image(image: AssetImage(socEvent.imgPath), fit: BoxFit.contain)
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(socEvent.title),
          subtitle: Text(socEvent.date),
        ),
      ),
      child: imgWidget,
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: SocietyEventList(),
  ));
}