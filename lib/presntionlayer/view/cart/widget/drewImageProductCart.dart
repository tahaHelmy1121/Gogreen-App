import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget drewImageProductCart(
    {required BuildContext context,
      var height,
      width,
      required String itemImage}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5)),
    width: width * .25,
    height: height * .20,
    margin: EdgeInsets.all(width * .01),
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.all(width * .01),
      child: CachedNetworkImage(
        alignment: Alignment.center,
        height: height * .22,
        imageUrl: itemImage.toString(),
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer(
          gradient: const LinearGradient(
              colors: [
                Colors.white,
                Colors.black
              ]
          ),
          child: Container(
            color: Colors.grey.shade200,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.image),
      ),
    ),
  );
}