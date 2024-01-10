import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavouriteStar(),
    ));

class FavouriteStar extends StatefulWidget {
  const FavouriteStar({super.key});

  @override
  State<FavouriteStar> createState() => _FavouriteStar();
}

class _FavouriteStar extends State<FavouriteStar> {
  bool isFavorited = false;
  int favoriteCount = 0;

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 100,
        width: 100,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 0),
                child: IconButton(
                  onPressed: FavouriteStar,
                  icon: (isFavorited
                      ? Icon(Icons.star)
                      : Icon(Icons.star_border)),
                  color: Colors.orange,
                )),
            Text('$favoriteCount'),
            SizedBox(
              height: 20,
            ),
            ActiveStatus(),
          ],
        ),
      ),
    );
  }

  void FavouriteStar() {
    setState(() {
      if (isFavorited) {
        favoriteCount -= 1;
        isFavorited = false;
      } else {
        favoriteCount += 1;
        isFavorited = true;
      }
    });
  }
}

class ActiveStatus extends StatefulWidget {
  const ActiveStatus({super.key});

  @override
  State<ActiveStatus> createState() => _ActiveStatus();
}

class _ActiveStatus extends State<ActiveStatus> {
  bool is_Active = false;
  String active = 'active';
  String inactive = 'inactive';

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (is_Active) {
            is_Active = false;
          } else {
            is_Active = true;
          }
        });
      },
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: (is_Active ? Colors.green : Colors.grey[200]),
                borderRadius: BorderRadius.circular(5.0)),
          ),
          (is_Active ? Text('$active') : Text('$inactive')),
        ],
      ),
    );
  }
}
