import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:phone_login/OTPController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String dialCodeDigits = "+91";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 0,),
            Padding(padding: const EdgeInsets.only(left: 0, right: 0),
              child: Image.asset("images/login.jpg"),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Center(
                child: Text(
                  "A 6-digit OTP will be sent Via SMS"
                  ,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0),

                ),
              ),
            ),
            SizedBox(height: 50,),

            SizedBox(

              width: 400,
              height: 50,

              child: CountryCodePicker(
                onChanged: (country){
                  setState(() {
                    dialCodeDigits = country.dialCode!;
                  });
                },
                initialSelection: "IN",
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: ["+91", "in"],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                    hintText: "Enter Phone Number ",
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(dialCodeDigits),
                    )
                ),
                maxLength: 12,
                keyboardType: TextInputType.number,
                controller: _controller ,
              ),
            ),

            Container(
              margin: EdgeInsets.all(25),
              width: 160.0,
              height: 50.0,


              child: OutlinedButton(
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => OTPControllerScreen(
                    phone: _controller.text,
                    codeDigits: dialCodeDigits,
                  )));

                },
                child: Text('Send OTP'),
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),

                ),

              ),
            ),










          ],
        ),
      ),
    );
  }
}
