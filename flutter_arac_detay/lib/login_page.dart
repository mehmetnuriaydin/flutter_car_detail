import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(228, 56, 0, 108),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * .25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/topImage.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Merhaba,\nHoşgeldin',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      customSizedBox(),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: customInputDecoration("Kullanıcı Adı"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Kullanıcı Adınızı Giriniz!!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (usrName) {
                          username = usrName!;
                        },
                      ),
                      customSizedBox(),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: customInputDecoration("Şifre"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Şifrenizi Giriniz!!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (pswrd) {
                          password = pswrd!;
                        },
                      ),
                      customSizedBox(),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Şifremi Unuttum",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 164, 61, 95))),
                        ),
                      ),
                      customSizedBox(),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (username == "admin" && password == "admin") {
                                Navigator.pushNamed(context, "/homepage");
                              } else {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Hata"),
                                        content:
                                            Text("Giriş Bilgileriniz Hatalı"),
                                        actions: <Widget>[
                                          MaterialButton(
                                            child: Text("Geri Dön"),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          )
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 60),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromARGB(153, 151, 110, 189)),
                            height: 50,
                            width: 150,
                            child: Center(
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      customSizedBox(),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Hesap Oluştur",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 164, 61, 95))),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
        height: 30,
      );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintStyle: TextStyle(color: Colors.grey),
      hintText: hintText,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
