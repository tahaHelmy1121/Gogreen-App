import 'package:flutter/cupertino.dart';

Widget drewnameproduct({name}) {
  return Container(
    height: 36,
    width: 36,
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: FittedBox(
      fit: BoxFit.cover,
      child: Text(name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  );
}
