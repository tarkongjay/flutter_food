import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // ไล่เฉดจากสีแดงไปสีน้ำเงิน
            colors: [
              Colors.white,
              Colors.purple.shade100,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: Icon(
                              Icons.lock_outline,
                              size: 100.0,
                            ),
                          ),
                          Text(
                            'LOGIN',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'Enter PIN to login',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          input.length > 0
                              ? Icon(
                            Icons.circle,
                            size: 30.0,
                            color: Colors.purple,
                          )
                              : Opacity(
                            opacity: 0.5,
                            child: Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.purple,
                            ),
                          ),
                          input.length > 1
                              ? Icon(
                            Icons.circle,
                            size: 30.0,
                            color: Colors.purple,
                          )
                              : Opacity(
                            opacity: 0.5,
                            child: Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.purple,
                            ),
                          ),
                          input.length > 2
                              ? Icon(
                            Icons.circle,
                            size: 30.0,
                            color: Colors.purple,
                          )
                              : Opacity(
                            opacity: 0.5,
                            child: Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.purple,
                            ),
                          ),
                          input.length > 3
                              ? Icon(
                            Icons.circle,
                            size: 30.0,
                            color: Colors.purple,
                          )
                              : Opacity(
                            opacity: 0.5,
                            child: Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.purple,
                            ),
                          ),
                          input.length > 4
                              ? Icon(
                            Icons.circle,
                            size: 30.0,
                            color: Colors.purple,
                          )
                              : Opacity(
                            opacity: 0.5,
                            child: Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.purple,
                            ),
                          ),
                          input.length > 5
                              ? Icon(
                                  Icons.circle,
                                  size: 30.0,
                                  color: Colors.purple,
                                )
                              : Opacity(
                                  opacity: 0.5,
                                  child: Icon(
                                    Icons.circle,
                                    size: 30.0,
                                    color: Colors.purple,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          for (int i = 1; i < 4; ++i)
                            LoginButtom(
                              number: i,
                              onClick: _handleClickButtom,
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 4; i < 7; ++i)
                            LoginButtom(
                              number: i,
                              onClick: _handleClickButtom,
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 7; i < 10; ++i)
                            LoginButtom(
                              number: i,
                              onClick: _handleClickButtom,
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton0(),
                          LoginButtom(
                            number: 0,
                            onClick: _handleClickButtom,
                          ),
                          LoginButtom(
                            number: -1,
                            onClick: _handleClickButtom,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButtom(int num) {
    print('$num');
    setState(() {
      if (num == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else if(input.length <6) {
        input = input + '$num';
      }if(input.length >5 && input !='123456'){
        _showMaterial();
        input = '';
      }
      if(input == '123456'){
        Navigator.pushReplacementNamed(context, HomePage.routeName);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
               input = '';
      }
    });
  }

  Widget _buildButton0() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
      ),
    );
  }

  void _showMaterial() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
          content:
          Text('Invalid PIN. Please try again.'),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LoginButtom extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButtom({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        onClick(number);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: number == -2
              ? null
              : BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3.0, color: Colors.grey),
                  color: Colors.white),
          child: Center(
            child: number < 0
                ? (number == -1
                    ? Icon(
                        Icons.backspace_outlined,
                        size: 30.0,
                      )
                    : SizedBox.shrink())
                : Text(
                    '$number',
                    style: Theme.of(context).textTheme.headline6,
                  ),
          ),
        ),
      ),
    );
  }
}
