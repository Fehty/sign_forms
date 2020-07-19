import 'package:flutter/material.dart';

import '../main.dart';

class SecondForm extends StatefulWidget {
  @override
  _SecondFormState createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  double screenWidth;
  bool isPortraitMode;

  @override
  Widget build(BuildContext context) {
    isPortraitMode = MediaQuery.of(context).orientation == Orientation.portrait;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(body: buildBody());
  }

  Widget topSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Благодарим за подтверждение',
          style: Theme.of(context).textTheme.headline5),
      SizedBox(height: 24),
      Text('Это помогает нам защитить ваш аккаунт.',
          style: Theme.of(context).textTheme.bodyText1)
    ]);
  }

  Widget middleSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//      Center(child: SvgPicture.asset('assets/icons/defender.png')),
      Center(child: Image.asset('assets/icons/defender.png')),
      Text('Совет', style: Theme
          .of(context)
          .textTheme
          .bodyText1),
      SizedBox(height: 4),
      Text('Проверьте безопасность аккаунта.',
          style: Theme
              .of(context)
              .textTheme
              .bodyText1),
      SizedBox(height: 12),
      FlatButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(
                  width: 2, color: Color.fromRGBO(236, 237, 239, 1))),
          splashColor: Color.fromRGBO(91, 143, 216, 0.3),
          textColor: Colors.white,
          child: Padding(
              padding:
              const EdgeInsets.only(left: 14, top: 6, bottom: 6, right: 16),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
//                SvgPicture.asset('assets/icons/small_defender.svg'),
                Image.asset('assets/icons/small_defender.png'),
                SizedBox(width: 12),
                Flexible(
                  child: Text('Пройти Проверку безопасности',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1),
                )
              ])))
    ]);
  }

  Widget bottomSection() {
    List<Widget> buttonList = [
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          splashColor: Color.fromRGBO(91, 143, 216, 0.3),
          textColor: Colors.white,
          child: Text('Отмена',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(
                  color: Color.fromRGBO(91, 143, 216, 1),
                  fontWeight: FontWeight.bold))),
      FlatButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          splashColor: Color.fromRGBO(91, 143, 216, 0.3),
          color: Color.fromRGBO(25, 115, 232, 1),
          textColor: Colors.white,
          child: Text('Показать все действия',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)))
    ];
    return isMobile && screenWidth < 400 && isPortraitMode
        ? Wrap(children: [buttonList[0], SizedBox(width: 8), buttonList[1]])
        : isMobile && screenWidth < 570 && isPortraitMode
        ? Row(children: [buttonList[0], Spacer(), buttonList[1]])
        : isMobile
        ? Row(children: [buttonList[0], Spacer(), buttonList[1]])
        : Row(children: [buttonList[0], Spacer(), buttonList[1]]);
  }

  Widget mainColumn() {
    return Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              topSection(),
              middleSection(),
              SizedBox(height: 28),
              bottomSection()
            ]));
  }

  Widget buildBody() {
    Widget mobileLayout = SingleChildScrollView(child: mainColumn());
    Widget pcLayout = ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 552),
        child: SingleChildScrollView(
            child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: mainColumn())));
    return isMobile ? mobileLayout : pcLayout;
  }
}
