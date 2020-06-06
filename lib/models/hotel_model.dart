class  Hotel {
  String imageUrl ;
  String name;
  String address ;
  int price ;

   Hotel (this.imageUrl, this.name, this.address, this.price) ;
}

final List<Hotel> hotels = [

  Hotel(
    'assets/images/hotel2.jpg' , 'hotel 0' , '404 Canary wharf' , 300
  ),

  Hotel(
      'assets/images/hotel4.jpg' , 'hotel 1' , '404  oxford street' , 400
  ),

  Hotel(
      'assets/images/hotel0.jpg' , 'hotel 2' , '404 Nariman point' , 750
  ),

  Hotel(
      'assets/images/hotel1.jpg' , 'hotel 3' , '404 Chandivali Andheri' , 600
  ),

] ;