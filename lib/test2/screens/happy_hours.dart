import 'package:flutter/material.dart';
import 'package:test_flutter/styles/commons.dart';
import 'package:test_flutter/test2/models/gif.dart';
import 'package:test_flutter/test2/repository/happy_repository.dart';

class HappyHours extends StatefulWidget {
  const HappyHours({Key? key}) : super(key: key);

  @override
  State<HappyHours> createState() => _HappyHoursState();
}

class _HappyHoursState extends State<HappyHours> {

  final HappyRepository _happyHours = HappyRepository();
  late List<Gif> listGifs = [];
  late bool isLogin = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listGifs = await _happyHours.getGifs();
    setState(() {
      listGifs = listGifs;
      isLogin = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Commons.backgroundColor,
      body: Column(
        children: [
          buildHeadder(size),
          buildTitle(size),
          buildButtons(size),
          const SizedBox(height: 20),
          Container(
            height: size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: isLogin
              ? const Center(child: CircularProgressIndicator(),)
              :buildListCard(size),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined, color: Colors.black,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black,),
            label: 'Favorite',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }

  ListView buildListCard(Size size) {
    List<Widget> list = [Padding(
      padding: EdgeInsets.only(left: size.width * 0.02, top: size.height * 0.001, right: size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Happy Hours',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          Expanded(child: SizedBox(width: size.width*0.5,)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundColor: Commons.backgroundColor,
              child: Icon(Icons.delete_outline_outlined, color: Colors.black87,),
            ),
          )
        ],
      ),
    ),
      ];
    
    for(var gif in listGifs){
      list.add(const SizedBox(height: 20));
      list.add(buildCard(gif));
    }
    
    return ListView(children: list);
  }

  Container buildCard(Gif gif) {
    return Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Commons.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(gif.url),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 70),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(2, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.favorite, color: Colors.deepOrangeAccent,),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(child: Text(gif.title,style: Commons.textCard,))
                  ],
                ),
              );
  }

  Padding buildButtons(Size size) {
    return Padding(
          padding: EdgeInsets.only(left: size.width * 0.01, top: size.height * 0.05, right: size.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0.01,
                      blurRadius: 1,
                      offset: const Offset(3, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  child: const Text('All', style: Commons.textButtons,),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                          )
                      )
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0.01,
                      blurRadius: 1,
                      offset: const Offset(3, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  child: const Text('Happy Hours', style: Commons.textButtonsFocus,),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                          )
                      )
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0.01,
                      blurRadius: 1,
                      offset: const Offset(3, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  child: const Text('Drinks', style: Commons.textButtons,),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                          )
                      )
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0.01,
                      blurRadius: 1,
                      offset: const Offset(3, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  child: const Text('Beer', style: Commons.textButtons,),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                          )
                      )
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        );
  }

  Padding buildHeadder(Size size) {
    return Padding(
          padding: EdgeInsets.only(left: size.width * 0.01, top: size.height * 0.05, right: size.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: size.width * 0.01),
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 80,
                ),
              ),
              Expanded(child: SizedBox(width: size.width*0.5,)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add_alert_outlined, color: Colors.black87,),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.settings, color: Colors.black87,),
                ),
              ),
            ],
          ),
        );
  }

  Padding buildTitle(Size size) {
    return Padding(
          padding: EdgeInsets.only(left: size.width * 0.01, top: size.height * 0.05, right: size.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Expanded(child: SizedBox(width: size.width*0.5,)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add, color: Colors.black87,),
                ),
              )
            ],
          ),
        );
  }
}