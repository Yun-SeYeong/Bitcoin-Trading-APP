import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            /**
             * Title
             */
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            /**
             * Sync Page
             */
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, "/syncpage");
                },
                child: Text(
                  'Sync Page',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            /**
             * Analytic Page
             */
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {},
                child: Text(
                  'Analytic Page',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            /**
             * Auto Trading Page
             */
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {},
                child: Text(
                  'Auto Trading Page',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            /**
             * Job Log Page
             */
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {},
                child: Text(
                  'Log Page',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
