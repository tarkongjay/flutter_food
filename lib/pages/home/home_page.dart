import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/login/login_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _selectedBottomNavIndex = 0;
  bool chenk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  // ไล่เฉดจากสีแดงไปสีน้ำเงิน
                  colors: [
                    Colors.purple.shade200,
                    Colors.purple,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset('assets/images/profile.jpg'),
                        )
                    ),
                  ),
                  Text(
                    'Parcharapon Kongjay',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    'kongjay_p@silpakorn.edu',
                    style: TextStyle(color: Colors.white70, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _subPageIndex == 0 ? _buildDraweritem( Icon(Icons.fastfood, color: Colors.purple,),
                Text('Food',style: TextStyle(color: Colors.purple),)
              ):
              _buildDraweritem( Icon(Icons.fastfood),
                  Text('Food')),
              onTap: () {
                setState(() {
                  _subPageIndex = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: _subPageIndex == 1 ? _buildDraweritem( Icon(Icons.person, color: Colors.purple,),
                  Text('Profile',style: TextStyle(color: Colors.purple),)
              ):
              _buildDraweritem( Icon(Icons.person),
                  Text('Profile')),
                  onTap: () {
            setState(() {
            _subPageIndex = 1;
            });
            Navigator.of(context).pop();
            //Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
            },
            ),
          ],
        ),
      ),
       /* bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),*/
      appBar: _subPageIndex == 0
          ? AppBar(
        title: Text('Food'),
        backgroundColor: Colors.purple,
      )
          : AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: _bulidSubPage(),
      ),
    );
  }

  Widget _bulidSubPage() {
    switch (_subPageIndex) {
      case 0:
        return FoodPage();
      case 1:
        return ProfilePage()
          ;
        break;
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDraweritem(Icon icon,Text title) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.0,
        ),
        title
      ],
    );
  }
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image.asset('assets/images/profile.jpg'),
                      )
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Parcharapon Kongjay',
                  style: TextStyle(color: Colors.black54, fontSize: 25.0),
                ),
              ),
              Text(
                'kongjay_p@silpakorn.edu',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          }
          );

        },
      ),
      body: Container(
         child: _bulidSubPage(),
      ),
    );
  }
  Widget _bulidSubPage() {
    switch (_selectedBottomNavIndex) {
      case 0:
        return FoodListPage();
      case 1:
        return OrderPage()
        ;
        break;
      default:
        return SizedBox.shrink();
    }
  }
}

class FoodListPage extends StatelessWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Opacity(
            opacity: 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FOOD MENU',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Opacity(
            opacity: 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'YOUR ORDER',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




