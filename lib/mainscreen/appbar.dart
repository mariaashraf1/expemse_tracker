import 'package:flutter/material.dart';
import 'package:software_project/accountscreen/accountScreen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 156,
      backgroundColor:Colors.grey.shade100,
      toolbarHeight: 70,
      leading: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,MaterialPageRoute(builder: (context) => accountPage()));
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                    "asset/image.jpg"),
                radius: 25,
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "User",
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
