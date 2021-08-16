import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Color(0xffEEEEF9),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60.0, left: 30, right: 10.0),
                    child: Image.asset('assets/boarding/Group 7.png'),
                  ),
                  Container(
                    height: size.height + 600.0,
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: Color(0xffEEEEF9),
                    ),
                  ),
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      height: 280.0,
                      decoration: BoxDecoration(
                        color: Color(0xff5C0931),
                      ),
                      child: Image.asset(
                        'assets/boarding/Group 6.png',
                        // fit: BoxFit.cover,
                        height: 50.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 20, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/boarding/Component 1 – 1.png'),
                        Text(
                          'My Flights',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset('assets/boarding/Component 2 – 1.png'),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 200.0, left: 20, right: 20),
                    child: Column(
                      children: [
                        Image.asset("assets/boarding/Group 7.png"),
                        SizedBox(
                          height: 20.0,
                        ),
                        for (int i = 0; i < flightList.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Container(
                              child: Column(
                                children: [
                                  FlightDetailsCard(
                                    arriDay: flightList[i].arriDay,
                                    arriLocation: flightList[i].arriLocation,
                                    arriSortName: flightList[i].arriSortName,
                                    arriTime: flightList[i].arriTime,
                                    departDay: flightList[i].departDay,
                                    departLocation:
                                        flightList[i].departLocation,
                                    departShorName:
                                        flightList[i].departShorName,
                                    departTime: flightList[i].departTime,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Image.asset(
                                    'assets/boarding/Line 1.png',
                                    color: Color(0xff5C0931),
                                    width: size.width,
                                    fit: BoxFit.cover,
                                    height: 1.5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff5C0931),
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 180);

    path.quadraticBezierTo(
        size.width / 18, size.height - 120, size.width / 2, size.height - 100);

    path.quadraticBezierTo(
        size.width, size.height - 80, size.width, size.height);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FlightDetailsCard extends StatelessWidget {
  final String departLocation;
  final String arriLocation;
  final String departShorName;
  final String arriSortName;
  final String departTime;
  final String arriTime;
  final String departDay;
  final String arriDay;
  const FlightDetailsCard(
      {Key? key,
      required this.departLocation,
      required this.arriLocation,
      required this.departShorName,
      required this.arriSortName,
      required this.departTime,
      required this.arriTime,
      required this.departDay,
      required this.arriDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              departLocation ?? 'London',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
            Text(
              departShorName ?? 'LTN',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff5C0931),
                  fontWeight: FontWeight.w700),
            ),
            Text(
              departTime ?? '9:20 pm',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
            Text(
              departTime ?? 'Sun, 15 Aug 2021',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/boarding/Line 1.png',
              color: Color(0xff5C0931),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                'assets/boarding/aeroplane.png',
                color: Color(0xff5C0931),
              ),
            ),
            Image.asset(
              'assets/boarding/Line 1.png',
              color: Color(0xff5C0931),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              arriLocation ?? 'Doha',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
            Text(
              arriSortName ?? 'DOH',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff5C0931),
                  fontWeight: FontWeight.w700),
            ),
            Text(
              arriTime ?? '1:20 am',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
            Text(
              arriDay ?? 'Sun, 16 Aug 2021',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

class FlightDetailsModel {
  final String departLocation;
  final String arriLocation;
  final String departShorName;
  final String arriSortName;
  final String departTime;
  final String arriTime;
  final String departDay;
  final String arriDay;

  FlightDetailsModel({
    required this.departLocation,
    required this.arriLocation,
    required this.departShorName,
    required this.arriSortName,
    required this.departTime,
    required this.arriTime,
    required this.departDay,
    required this.arriDay,
  });
}

List<FlightDetailsModel> flightList = [
  FlightDetailsModel(
      departLocation: 'Sydeny',
      departShorName: 'SYD',
      departTime: '12:15 pm',
      departDay: 'Mon, 20 Aug 2021',
      arriDay: 'Tue, 21 Aug 2021',
      arriLocation: 'Doha',
      arriSortName: 'DOH',
      arriTime: '2:15 am'),
  FlightDetailsModel(
      departLocation: 'Mumbai',
      departShorName: 'BOM',
      departTime: '08:15 pm',
      departDay: 'Mon, 17 Aug 2021',
      arriDay: 'Tue, 17 Aug 2021',
      arriLocation: 'Chennai',
      arriSortName: 'CHE',
      arriTime: '11:15 pm'),
  FlightDetailsModel(
      departLocation: 'Delhi',
      departShorName: 'DEL',
      departTime: '07:15 pm',
      departDay: 'Mon, 19 Aug 2021',
      arriDay: 'Tue, 20 Aug 2021',
      arriLocation: 'London',
      arriSortName: 'LTN',
      arriTime: '2:15 am'),
  FlightDetailsModel(
      departLocation: 'New York',
      departShorName: 'USA',
      departTime: '12:15 pm',
      departDay: 'Mon, 20 Aug 2021',
      arriDay: 'Tue, 23 Aug 2021',
      arriLocation: 'Delhi',
      arriSortName: 'DEL',
      arriTime: '2:15 am'),
  FlightDetailsModel(
      departLocation: 'Arab',
      departShorName: 'ARB',
      departTime: '12:15 pm',
      departDay: 'Mon, 25 Aug 2021',
      arriDay: 'Tue, 26 Aug 2021',
      arriLocation: 'Mumbai',
      arriSortName: 'BOM',
      arriTime: '2:15 am'),
  FlightDetailsModel(
      departLocation: 'Sydeny',
      departShorName: 'SYD',
      departTime: '12:15 pm',
      departDay: 'Mon, 20 Aug 2021',
      arriDay: 'Tue, 21 Aug 2021',
      arriLocation: 'Doha',
      arriSortName: 'DOH',
      arriTime: '2:15 am'),
];
