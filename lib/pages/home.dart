import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/mountains.dart';

import '../bloc/mountain_bloc.dart';
import '../widgets/main_widget.dart';
import '../widgets/article_widget.dart';
import '../widgets/mountain_widget.dart';
import '../assets/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        title: "Poentjak App",
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;
  final MountainBloc _mountainBloc = MountainBloc();

  void initState() {
    _mountainBloc.add(MountainEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0, backgroundColor: Colors.white, title: CustomAppBar()),
        bottomNavigationBar: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  0, // Move to right 10  horizontally
                  15.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Row(
            children: <Widget>[
//                  Icon(Icons.home),
              customNavigationBarItem(Icons.home, 0, '/'),
              customNavigationBarItem(Icons.search, 1, '/search'),
              customNavigationBarItem(Icons.favorite, 2, '/favorite'),
            ],
          ),
        ),
        body: BlocProvider<MountainBloc>(
          create: (context) => _mountainBloc,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              titleSection('Unique Facts'),
              ArticleCarousel(),
              titleSection('Arround You'),
              WidgetMountain(),
              // ListMount(),
            ],
          ),
        ));
  }

  Widget customNavigationBarItem(IconData icon, int index, String route) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
        Navigator.pushNamed(context, route);
      },
      child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 3,
          child: (index == _selectedItemIndex)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon, color: Colors.blueAccent[600]),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: 12,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent[100],
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Icon(icon, color: Colors.blueAccent[100])
                    ])),
    );
  }

  Widget titleSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 18, left: 4),
          height: 10,
          width: 132,
          color: shadeBlue,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 28, color: darkBlue, fontWeight: FontWeight.w900),
        ),
      ]),
    );
  }
}

class WidgetMountain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child:
        BlocBuilder<MountainBloc, MountainState>(builder: (context, state) {
      if (state is MountainLoading) {
        return WidgetCircularLoading();
      } else if (state is MountainFailure) {
        return Center(
          child: Text('${state.errorMessage}'),
        );
      } else if (state is MountainLoaded) {
        Mountains mountains = state.mountains;
        Mountain mountain = mountains.mountains[0];
        return Text(mountain.nameMt);
      }
    }));
  }
}

class WidgetCircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blueAccent[100],
      child: Center(
        child: Container(
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
