import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffolKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    onPressed: () => _scaffolKey.currentState.openDrawer(),
                    icon: const Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(
                          widget.user.profileImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
