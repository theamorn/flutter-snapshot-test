import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvatarCircle extends StatelessWidget {
  final double size;
  final bool hidePadding;
  final Icon icon;
  final Image? image;
  final String name;
  final String title;
  final Color? nameColor;
  final Decoration? decoration;

  final bool hasBorder;
  final bool hasLogo;
  final bool hasStar;
  final bool hasCloudCenter;

  final Color? bgColor;
  final double fontSize;

  const AvatarCircle(
      {required this.size,
      required this.icon,
      required this.name,
      this.hidePadding = false,
      this.decoration,
      this.image,
      this.title = "",
      this.nameColor,
      this.fontSize = 14,
      this.hasBorder = false,
      this.hasLogo = false,
      this.hasStar = false,
      this.hasCloudCenter = false,
      this.bgColor});

  BoxBorder? _getBorder() => this.hasBorder
      ? Border.all(color: Colors.white, width: this.size * 0.02)
      : null;

  List<BoxShadow>? _getShadow(double padding) => this.hasBorder
      ? [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(-0, 0),
              blurRadius: padding / 2)
        ]
      : [];

  Widget _buildChildCircle() {
    if (image == null) {
      TextStyle textStyle =
          TextStyle(color: this.nameColor, fontSize: fontSize);

      return Center(
        child: Opacity(
          opacity: this.hasCloudCenter ? 0.1 : 1,
          child: Padding(
            padding: EdgeInsets.all(this.size * 0.14),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                this.name.toUpperCase(),
                maxLines: 1,
                style: textStyle,
              ),
            ),
          ),
        ),
      );
    } else {
      Widget childImage = Container(child: this.icon);
      return ClipRRect(
        borderRadius: BorderRadius.circular(this.size),
        child: childImage,
      );
    }
  }

  Widget _logoCornerBottomRight() {
    if (hasLogo != true) return Container();

    return Positioned(
      bottom: size / 16,
      right: size / 16,
      child: Icon(Icons.plus_one, key: Key('logoAvatar'), size: size / 2.5),
    );
  }

  Widget _buildStar(double padding) {
    final double starSize = this.size / 3;
    final double bottom = padding * 1.5;

    return hasStar
        ? Positioned(
            bottom: bottom,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
              ),
              width: starSize,
              height: starSize,
              child: Icon(
                Icons.star_rate,
                key: Key('starAvatar'),
                color: Colors.white,
              ),
            ),
          )
        : Container();
  }

  Widget _buildCloudCenter() {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: size,
              height: this.size,
              padding: EdgeInsets.only(top: this.size / 10.5),
              child: Text(
                this.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: this.size / 4.7,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            child: Opacity(
              opacity: 1,
              child: Container(
                width: this.size,
                height: this.size,
                child: Center(
                  child: Container(
                    width: this.size / 2,
                    height: this.size / 1.5,
                    padding: EdgeInsets.only(top: this.size / 4),
                    child: Icon(
                      Icons.cloud,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double padding = this.size / 24;
    DecorationImage? decorImg = image == null
        ? null
        : DecorationImage(
            image: image!.image,
            fit: BoxFit.cover,
          );

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all((hidePadding ? 0.0 : padding) * 2),
          width: this.size,
          height: this.size,
          child: Container(
            decoration: BoxDecoration(
              color: this.bgColor,
              image: decorImg,
              border: _getBorder(),
              borderRadius: BorderRadius.all(Radius.circular(this.size)),
              boxShadow: _getShadow(padding),
            ),
            child: _buildChildCircle(),
          ),
        ),
        _buildCloudCenter(),
        _logoCornerBottomRight(),
        _buildStar(padding),
      ],
    );
  }
}
