import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          './img/techsoclogo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        backgroundColor: new Color.fromRGBO(0, 47, 63, 1)),
    body: SocietyEventList(),
  )));
}

class SocietyEvent {
  SocietyEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.imgPath,
    required this.link,
  });

  final num id;
  final String title;
  final String description;
  final String date;
  final String imgPath;
  final String link;
}

class SocietyEventList extends StatelessWidget {
  const SocietyEventList({
    Key? key,
  }) : super(key: key);

  List<SocietyEvent> _socEvents(BuildContext context) {
    return [
      SocietyEvent(
          id: 0,
          title: "Communi-tea Catchups!",
          description:
              "This event aims to connect, support, and inspire women (including female-identifying and gender diverse people) in the IT community right here at UTS",
          date: "10/08/2021",
          imgPath: "./img/communitea.jpg",
          link: "https://www.facebook.com/events/521038565871745/"),
      SocietyEvent(
          id: 1,
          title: "Software Engineering Panel!",
          description:
              "This event has RecordPoint’s leading engineers talking on what software engineering is and what a career in this diverse field might look like",
          date: "12/08/2021",
          imgPath: "./img/softwarepanel.jpg",
          link: "https://www.facebook.com/events/247449153864092/"),
      SocietyEvent(
          id: 2,
          title: "The BIG Project!",
          description:
              "This event is a pilot 4-week challenge (running from August to September) where, in groups of 3-4, you will be given prompts to build a working prototype of an app",
          date: "19/08/2021",
          imgPath: "./img/big.jpg",
          link: "https://www.facebook.com/events/4261012500634630/"),
      SocietyEvent(
          id: 3,
          title: "Data Center Virtualization!",
          description:
              "This event provides a great talk from VMware on Data Centre Virtualization!",
          date: "19/08/2021",
          imgPath: "./img/virt.jpg",
          link: "https://www.facebook.com/events/184779963717470/"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            new Color.fromRGBO(0, 76, 101, 0),
            new Color.fromRGBO(6, 95, 125, 1),
          ],
        )),
        child: GridView.count(
          restorationId: 'grid_view_demo_grid_offset',
          crossAxisCount: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          childAspectRatio: (16 / 13),
          children: _socEvents(context).map<Widget>((socEvent) {
            return EventCard(
              socEvent: socEvent,
            );
          }).toList(),
        ));
  }
}

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.socEvent}) : super(key: key);

  final SocietyEvent socEvent;

  void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    final Widget imgWidget = Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Image(image: AssetImage(socEvent.imgPath), fit: BoxFit.contain),
        color: new Color.fromRGBO(0, 47, 63, 1));

    return GridTile(
      header: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: new Color.fromRGBO(0, 47, 63, 1),
          title: Text(socEvent.title),
        ),
      ),
      child: new GestureDetector(
          onTap: () => launchURL(socEvent.link), child: imgWidget),
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
            backgroundColor: new Color.fromRGBO(0, 47, 63, 1),
            subtitle: Text(
              socEvent.date + ' | ' + socEvent.description,
              textScaleFactor: 1,
            ),
            trailing: new FavoriteWidget()
          ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      icon: (_isFavorited
          ? const Icon(Icons.star)
          : const Icon(Icons.star_border)),
      color: Colors.blue[500],
      onPressed: _toggleFavorite,
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
}
