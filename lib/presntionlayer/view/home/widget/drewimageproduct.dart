



     import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../customwidget/constient/colors.dart';

Widget drewImageProduct ({image}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30)
    ),
    child: CachedNetworkImage(
      imageUrl:image,
      height: 120,
      width: 200,
      fit: BoxFit.cover,
      placeholder: (context,
          url) =>
          Shimmer(
              gradient:
              AppColor.appBarGradient,
              child:
              Container(
                color: Colors
                    .grey
                    .shade200,
              )),
      errorWidget: (context,
          url, error) =>
      const Icon(
          Icons.image),
    ),
  );


}