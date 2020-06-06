import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_app/Widgets/destination_screen.dart';
import 'package:flutter_travel_ui_app/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_travel_ui_app/Widgets/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Top Destinations', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, letterSpacing: 1.5,
              color: Theme.of(context).primaryColor),),
              GestureDetector(
                onTap: () => print('See All'),
                  child: Text('See All', style: TextStyle( color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 1.0),))
            ],
          ),
        ),
        
        Container(
          height: 290.0,
         //

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index)  {
              Destination destination = destinations[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DestinationScreen(destination: destination ),
              ),
            ) ,
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 210,

              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                    bottom: 10.0,
                    child: Container(
                      height: 120, width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('${destination.activities.length} activities',
                            style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600,
                              letterSpacing: 1.2, color: Theme.of(context).primaryColor,
                            ),),
                            Text(destination.description,
                            style: TextStyle(color: Colors.blue[200] ),),

                          ],
                        ),
                      ),

                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [ BoxShadow (
                        color: Colors.black26,
                        offset: Offset(0.0,0.2) ,
                      ),

                        ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: destination.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: AssetImage(destination.imageUrl),
                              height:180,
                              width: 180,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ) ,
                        Positioned(
                          left: 10.0,
                          top: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(destination.city,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),),
                              SizedBox(height: 5.0,),
                              Row(
                                children: <Widget>[
                                  Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 12.0, color: Colors.white,
                                  ),
                                  SizedBox(width: 13.0,),

                                  Text(destination.country,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),),
                                ],
                              )
                            ],
                          ),
                        )

                      ],
                    ),

                  )

                ],
              ),
            ),
          ) ;
            },
         ),
        )
      ],
    );
  }
}
