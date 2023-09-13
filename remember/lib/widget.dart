import 'package:flutter/material.dart';
import 'package:remember/home.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen1(),
    );
  }
}

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  Color mainBackgroundColor = Color.fromARGB(255, 0, 131, 253);

  String email = "mmm760778@gmail.com";
  String name = "Mishal Nasser";

  Future<void> changeName() async {
    String updatedName = await showDialog(
      context: context,
      builder: (context) {
        String newName = name;
        return AlertDialog(
          title: Text(
            "Change Name",
          ),
          content: TextField(
            onChanged: (value) {
              newName = value;
            },
            decoration: InputDecoration(
              labelText: "New Name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(newName);
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );

    if (updatedName != null && updatedName.isNotEmpty) {
      setState(() {
        name = updatedName;
      });
    }
  }

  Future<void> changeEmail() async {
    String updatedEmail = await showDialog(
      context: context,
      builder: (context) {
        String newEmail = email;
        return AlertDialog(
          title: Text("Change Email"),
          content: TextField(
            onChanged: (value) {
              newEmail = value;
            },
            decoration: InputDecoration(
              labelText: "New Email",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(newEmail);
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );

    if (updatedEmail != null && updatedEmail.isNotEmpty) {
      setState(() {
        email = updatedEmail;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openEditProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Change Email'),
                onTap: () {
                  Navigator.pop(context);
                  changeEmail();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 0, 131, 253),
                Color.fromARGB(255, 66, 201, 255),
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("image/old.png"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Edit Profile"),
                onTap: () {
                  Navigator.of(context).pop();
                  changeName();
                },
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Change Email"),
                onTap: () {
                  Navigator.of(context).pop();
                  changeEmail();
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Log Out"),
                onTap: () {
                  Navigator.of(context).pop();
                  logOut(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              mainBackgroundColor,
              Color.fromARGB(255, 0, 109, 212),
              Color.fromARGB(255, 0, 238, 255),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: [
                  HomeScreen(),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("image/Kuwait.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 50,
                        child: Text(
                          "Hospital locations in Kuwait",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 380,
                        right: 90,
                        child: InkWell(
                          onTap: () {
                            launch(
                                "https://maps.app.goo.gl/DuRGtSKe1MghZ2DD6?g_st=ic");
                          },
                          child: Icon(
                            Icons.place_outlined,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        right: 5,
                        child: InkWell(
                          onTap: () {
                            launch(
                                "https://maps.app.goo.gl/VRwVbXfUri3FAHc16?g_st=ic");
                          },
                          child: Icon(
                            Icons.place_outlined,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 340,
                        right: 150,
                        child: InkWell(
                          onTap: () {
                            launch(
                                "https://maps.app.goo.gl/XbC952xR2ZtqoFPHA?g_st=ic");
                          },
                          child: Icon(
                            Icons.place_outlined,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 370,
                        right: 43,
                        child: InkWell(
                          onTap: () {
                            launch(
                                "https://maps.app.goo.gl/p5yFD74TNkU2YQVA8?g_st=ic");
                          },
                          child: Icon(
                            Icons.place_outlined,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 346,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            launch(
                                "https://maps.app.goo.gl/8ezzfkCquN7PKjYe9?g_st=ic");
                          },
                          child: Icon(
                            Icons.place_outlined,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Center(
                      child: _buildProfileInformation(),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Center(
                      child: _buildColoredBoxes(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 100,
        iconSize: 40,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_outlined),
            label: '',
          ),
        ],
      ),
    );
  }

  void logOut(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildProfileInformation() {
    return Column(
      children: [
        SizedBox(height: 10),
        Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(255, 33, 144, 235),
                    width: 3.0,
                  ),
                ),
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      "image/old.png",
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Email: $email",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Text(
          "Name: $name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            changeName();
          },
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Change Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            changeEmail();
          },
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Change Email",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 5, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            logOut(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColoredBoxes() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Pharmaceutical",
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              _buildColoredBox(
                Color.fromARGB(255, 255, 255, 255),
                "Aduhelm",
                "KD: Free",
                "image/a.png",
              ),
              _buildColoredBox(
                Color.fromARGB(255, 255, 255, 255),
                "Aspirin",
                "KD: Free",
                "image/d.png",
              ),
              _buildColoredBox(
                Color.fromARGB(255, 255, 255, 255),
                "Losartan",
                "KD: Free",
                "image/f.png",
              ),
              _buildColoredBox(
                Color.fromARGB(255, 255, 255, 255),
                "Panadol",
                "KD: Free",
                "image/g.png",
              ),
              _buildColoredBox(
                Color.fromARGB(255, 248, 248, 248),
                "Sartan",
                "KD: Free",
                "image/h.png",
              ),
              _buildColoredBox(
                Color.fromARGB(255, 245, 245, 245),
                "Sartan",
                "KD: Free",
                "image/s.png",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColoredBox(
      Color color, String text1, String text2, String imagePath) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    text1,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Buy"),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 170,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: 270,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Icon(
                Icons.control_point_duplicate_sharp,
                size: 50,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Text(
                        text1,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        text2,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProductDetails(BuildContext context, String productName,
      String price, String imagePath) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color.fromARGB(255, 0, 131, 253),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  productName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  "Price: $price",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
