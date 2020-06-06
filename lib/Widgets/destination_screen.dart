import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_app/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_travel_ui_app/models/activity_model.dart';

class DestinationScreen extends StatefulWidget {
  Destination destination;
  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  Text _buildStarRating(int rating) {
    String stars = '' ;
    for (int i =0; i < rating ; i++) {
      stars += '* ' ;
    }
    return Text(stars) ;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.locationArrow,
                            size: 10.0, color: Colors.white,),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Icon(
                  Icons.location_on,
                  size: 30.0,
                    color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0) ,
              child: ListView.builder(
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                          height: 160,
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(40.0, 5, 20, 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 130,
                                      child: Text(
                                        activity.name,
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w700,
                                          color: Theme.of(context).primaryColor,),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          '\$${activity.price}',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor,),
                                        ),
                                        Text(
                                          'per pax',
                                          style: TextStyle(fontSize: 14.0,color: Theme.of(context).primaryColor,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  activity.type,
                                  style:
                                      TextStyle(color: Theme.of(context).primaryColor, fontSize: 15),
                                ),
                                _buildStarRating(activity.rating) ,
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: Theme.of(context).accentColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(activity.startTimes[0]),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: Theme.of(context).accentColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(activity.startTimes[1]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0 ,
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(12.0),
                          child: Image(
                            width: 110,
                            image: AssetImage(activity.imageUrl ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
