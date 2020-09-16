import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/mountains.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../bloc/mountain_bloc.dart';
import '../widgets/article_widget.dart';
import '../widgets/mountain_widget.dart';
import '../assets/colors.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[HomePage(), SavePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          color: Colors.white,
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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: GNav(
                gap: 6,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 600),
                tabBackgroundColor: darkBlue,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                    iconColor: darkBlue,
                  ),
                  GButton(
                    icon: Icons.bookmark,
                    text: 'Save',
                    iconColor: darkBlue,
                  ),
                  GButton(
                    icon: Icons.account_circle,
                    text: 'Profile',
                    iconColor: darkBlue,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        TitleSection(title: 'Discover'),
        // TextFormField(),
        SearchInput(),
        WidgetMountain(),
        TitleSection(title: 'Travel Blog'),
        ArticleCarousel(),

        // ListMount(),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 18),
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: shadeBlue),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              autofocus: false,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Where do you wanna go?',
                  contentPadding: const EdgeInsets.all(20.0)),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Center(
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavigationBarItem extends StatefulWidget {
  final IconData icon;
  final int index;
  final String route;
  CustomNavigationBarItem(this.icon, this.index, this.route);

  @override
  _CustomNavigationBarItemState createState() =>
      _CustomNavigationBarItemState();
}

class _CustomNavigationBarItemState extends State<CustomNavigationBarItem> {
  int _selectedItemIndex = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = widget.index;
        });
        Navigator.pushNamed(context, widget.route);
      },
      child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 3,
          child: (widget.index == _selectedItemIndex)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(widget.icon, color: Colors.blueAccent[600]),
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
                      Icon(widget.icon, color: Colors.blueAccent[100])
                    ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class TitleSection extends StatelessWidget {
  final String title;

  TitleSection({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 18, left: 4),
          height: 10,
          width: 112,
          color: shadeBlue,
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: 'google-font',
              fontSize: 28,
              color: darkBlue,
              fontWeight: FontWeight.w900),
        ),
      ]),
    );
  }
}

// Show mountain list with bloc state management
class WidgetMountain extends StatefulWidget {
  @override
  _WidgetMountainState createState() => _WidgetMountainState();
}

class _WidgetMountainState extends State<WidgetMountain> {
  final MountainBloc _mountainBloc = MountainBloc();

  void initState() {
    _mountainBloc.add(MountainEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: BlocProvider<MountainBloc>(
            create: (context) => _mountainBloc,
            child: BlocBuilder<MountainBloc, MountainState>(
                builder: (context, state) {
              if (state is MountainLoading) {
                return Loading();
              } else if (state is MountainFailure) {
                return Center(
                  child: Text('${state.errorMessage}'),
                );
              } else if (state is MountainLoaded) {
                Mountains mountains = state.mountains;
                return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: mountains.listMountains.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      Mountain mountain = mountains.listMountains[index];
                      return CardMountain(mountain);
                    });
                // return Text(mountains.toString());
              } else {
                return Container();
              }
            })));
  }

  @override
  void dispose() {
    super.dispose();
    _mountainBloc.close();
  }
}

//Loading Widget
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }
}

class SavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Save Page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
