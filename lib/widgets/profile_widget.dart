// ignore_for_file: use_key_in_widget_constructors

import 'package:feed_tab_spotlas/models/author.dart';
import 'package:feed_tab_spotlas/models/place.dart';
import 'package:feed_tab_spotlas/widgets/profile_pic_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_UI_provider.dart';

///widget used to display profile information for Place and Author.
///can be re-used in other areas of app.

class ProfileWidget extends StatelessWidget {
  final String? profilePicUrl; //profile pic Url.
  final Color? profilePicBorderColor;
  final String topHeading;
  final String bottomHeading;
  final Decoration? decoration;
  final Widget profilePicPlaceHolder;

  ProfileWidget.fromAuthor({
    required Author author,
    this.profilePicBorderColor = Colors.pink,
    this.decoration,
    this.profilePicPlaceHolder = const Icon(Icons.person),
  })  : profilePicUrl = author.authorPhotoUrl,
        topHeading = author.authorUsername,
        bottomHeading = author.authorFullName;

  static final headingShadows = [
    Shadow(
      blurRadius: 10,
      color: Colors.black.withOpacity(0.75),
      offset: const Offset(3, 3),
    ),
  ];

  ProfileWidget.fromPlace({
    required Place place,
    this.profilePicBorderColor = Colors.white,
    this.decoration,
    this.profilePicPlaceHolder = const Icon(Icons.restaurant),
  })  : profilePicUrl = place.placeLogoUrl ?? "",
        topHeading = place.placeName,
        bottomHeading =
            "${place.categoryDisplayName} · ${place.placeLocationName}";

  @override
  Widget build(BuildContext context) {
    final PostUIProvider postUIProvider =
        Provider.of<PostUIProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(
        left: postUIProvider.S,
        bottom: postUIProvider.S,
        top: postUIProvider.S,
      ),
      child: DecoratedBox(
        decoration: decoration ?? const BoxDecoration(),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: postUIProvider.S,
              ),
              child: ProfilePicAvatar(
                innerRadius: postUIProvider.iconSize,
                photoUrl: profilePicUrl,
                borderColor: profilePicBorderColor,
                placeHolder: profilePicPlaceHolder,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: postUIProvider.XXXXXL,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topHeading,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: headingShadows,
                    ),
                  ),
                  SizedBox(
                    height: postUIProvider.XXXS,
                  ),
                  Text(
                    bottomHeading,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      shadows: headingShadows,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
