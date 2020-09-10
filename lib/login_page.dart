import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hizligeliyo/product_list.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    List<Color> _fill = <Color>[
      Colors.grey[200],
      Color(0xFFf8fbf8),
      Colors.white
    ];
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        hintText: 'Email',
        hintStyle: TextStyle(color: Color.fromRGBO(82, 86, 92, 1)),
        contentPadding: EdgeInsets.fromLTRB(
            (MediaQuery.of(context).size.width / 3) + 15, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some  ',
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        hintText: 'Passwo',
        contentPadding: EdgeInsets.fromLTRB(
            (MediaQuery.of(context).size.width / 2.5), 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
      child: ButtonTheme(
        minWidth: 200,
        height: 60,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductList()));
          },
          padding: EdgeInsets.all(15),
          color: Colors.lightBlueAccent,
          child: Text('Giriş yap', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Şifremi unuttum',
        style: TextStyle(color: Color.fromRGBO(82, 86, 92, 1)),
      ),
      onPressed: () {},
    );
    final singUpLabel = FlatButton(
      child: Text(
        'Hesabın yok mu?',
        style: TextStyle(color: Color.fromRGBO(82, 86, 92, 1)),
      ),
      onPressed: () {},
    );
    Widget convexWithThumb(String txt, Color _clr) {
      return Container(
        child: Center(
          child: InkWell(child: email),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF217CAF).withOpacity(0.4),
              spreadRadius: 0.1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],

          //  border: Border.fromBorderSide(BorderSide(style: BorderStyle.solid,width: 3.0,color: Color(0xFFF8F1F1))),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      );
    }

    Widget convexWithThumbPassword(String txt, Color _clr) {
      return Container(
        child: Center(
          child: InkWell(child: password),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          //  border: Border.fromBorderSide(BorderSide(style: BorderStyle.solid,width: 3.0,color: Color(0xFFF8F1F1))),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF217CAF).withOpacity(0.4),
              spreadRadius: 0.1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Image.asset("assets/image 1.png"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hesabına Giriş Yap',
                        style: GoogleFonts.titilliumWeb(
                            color: Color.fromRGBO(82, 86, 92, 1), fontSize: 24))
                  ],
                ),
                SizedBox(height: 48.0),
                convexWithThumb("Synth", Color(0xFF649166)),
                SizedBox(height: 8.0),
                convexWithThumbPassword("Synth", Color(0xFF649166)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    forgotLabel,
                  ],
                ),
                loginButton,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    singUpLabel,
                    Text(
                      'Kaydol',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                Expanded(child: SizedBox(width: 1)),
                Image.asset(
                  'assets/Patterns.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
