
import 'package:flutter_travel_ui_app/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;

  List<Activity> activities;

  Destination
      ({
  this.imageUrl, this.city, this.country, this.description, this.activities
      }) ;
}

List<Activity> activities=  [
  Activity(
    imageUrl: 'assets/images/Mumbai_activity_gatewayofindia.jpg',
    name: 'GateWay of India',
    type: 'Sightseeing tour/Boat Ride' ,
    startTimes: ['9.00 am', '11.0 am'] ,
    rating: 4,
    price: 210
  ),

  Activity(
    imageUrl: 'assets/images/mumbai_activity_narimanpoint.jpg',
    name: 'Nariman Point',
    type: 'Sightseeing tour',
      startTimes: ['9.00 am', '10.0 am'] ,
    rating: 2,
    price: 500
  ),

  Activity (
    imageUrl: 'assets/images/mumbai_activity_cst.jpg' ,
    name: 'Chhatrapati Shivaji Terminas',
    type : 'Sightseeing tour/Shopping' ,
    startTimes: ['9.00 am', '11.0 am'] ,
    rating: 7,
    price: 100

  )

] ;

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice_activity_2.jpg',
    city: 'Venice' ,
    country: 'Italy',
    description: 'Visit Venice for beautiful water rides' ,
    activities: activities ,
  ),
  Destination(
    imageUrl: 'assets/images/mumbai.jpg',
    city: 'Mumbai' ,
    country: 'India',
    description: 'Visit Mumbai for amazing and unfrogattable adventure' ,
    activities: activities ,
  ),



  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Parice' ,
    country: 'France',
    description: 'Visit Parice to celebrate love' ,
    activities: activities ,
  ),



  Destination(
    imageUrl: 'assets/images/saopaulo.png',
    city: 'Sao Paulo' ,
    country: 'Brazil',
    description: 'Visit Sao Paulo for amazing and unfrogattable adventure' ,
    activities: activities ,
  ),

  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'Newyork City' ,
    country: 'United States',
    description: 'Visit NewYork city for unforgattable experience' ,
    activities: activities ,
  ),

];