import 'package:flutter/material.dart';
import 'package:insta/extetion/color_extetioon.dart';
import 'package:insta/models/social_model.dart';
import 'package:insta/repository/social_link_repository.dart';
import 'package:insta/widget/header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/link_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _openUrl(String value) async {
    await launchUrl(Uri.parse(value));
  }

  Color _color(String value) {
    final color = HexColor.fromHex(value);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<SocialModel>>(
        future: SocialLinkRepository().getJson(),
        builder: (context, snapShot) {
          if (!snapShot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return Scaffold(
            backgroundColor: const Color(0xFFffdc26),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const HeaderWidget(),
                const SizedBox(height: 40),
                Column(
                  children: snapShot.data!
                      .map((e) => LinkBtn(
                            title: e.socialName,
                            icon: e.socialIcon,
                            color: _color(e.socialColors!),
                            onTap: () async {
                              await _openUrl(e.sociallink);
                            },
                          ))
                      .toList(),
                ),
                Expanded(child: Container()),
                Container(
                  height: 40,
                  width: double.maxFinite,
                  color: Colors.black87,
                  child: const Center(
                    child: Text(
                      'Em construção - 2022',
                      style: TextStyle(color: Colors.white38),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}