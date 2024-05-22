import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ugb/pages/post.dart';
import 'package:ugb/resources/assets_colors.dart';
import 'package:ugb/resources/assets_strings.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Post? data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: bodyLogin(),
      ),
    ));
  }

  Widget bodyLogin() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(AssetsString.imageLogin),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: buttonLoginRequest(
                    "Request",
                  )),
                ],
              ),
              Text(data == null ? "" : data!.body!)
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonLoginRequest(String title) {
    return ElevatedButton(
        onPressed: () async {
          var dataServer = await requestToServer();
          setState(() {
            data = dataServer;
          });
        },
        child: Text(title));
  }

  Future<Post?> requestToServer() async {
    const url = Api.api_login;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Bearer-Token': 'qwdduihqwukdghuykqw',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Post.fromJson(data);
    }
    return null;
  }
}
