import 'package:flutter/material.dart';
import 'package:story_ui/card_scroll_widget.dart';
import 'package:story_ui/custom_icons.dart';
import 'package:story_ui/data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF1b1e44), Color(0xFF2d3447)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              CustomIcons.menu,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Trending',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 46.0,
                            fontFamily: 'Calibre-Semibold',
                            letterSpacing: 1.0)),
                    IconButton(
                      icon: Icon(
                        CustomIcons.option,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFff6e6e),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text(
                            'Animated',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '25+ Stories',
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Favorite',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: 'Calibre-Semibold',
                          letterSpacing: 1.0),
                    ),
                    IconButton(
                      icon: Icon(
                        CustomIcons.option,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text(
                            'Latest',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Text(
                      '9+ Stories',
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/image_02.jpg',
                          width: 296.0, height: 222.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
