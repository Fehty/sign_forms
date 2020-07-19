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
    return Scaffold(
        appBar: AppBar(title: Text('Second form')), body: buildBody());
  }

  Widget topSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Благодарим за подтверждение',
          style: Theme.of(context).textTheme.headline5),
      SizedBox(height: 20),
      Text('Это помогает нам защитить ваш аккаунт.',
          style: Theme.of(context).textTheme.bodyText1)
    ]);
  }

  Widget middleSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(child: Image.asset('assets/images/defender.png')),
      SizedBox(height: 48),
      Text('Совет', style: Theme.of(context).textTheme.bodyText1),
      SizedBox(height: 4),
      Text('Проверьте безопасность аккаунта.',
          style: Theme.of(context).textTheme.bodyText1),
      SizedBox(height: 16),
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
                  const EdgeInsets.only(left: 12, top: 6, bottom: 6, right: 16),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Image.asset('assets/images/small_defender.png'),
                SizedBox(width: 12),
                Text('Пройти Проверку безопасности',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.w500))
              ])))
    ]);
  }

  Widget bottomSection() {
    return Row(children: [
      FlatButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          splashColor: Color.fromRGBO(91, 143, 216, 0.3),
          textColor: Colors.white,
          child: Text('Отмена',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Color.fromRGBO(91, 143, 216, 1),
                  fontWeight: FontWeight.bold))),
      Spacer(),
      FlatButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          splashColor: Color.fromRGBO(91, 143, 216, 0.3),
          color: Color.fromRGBO(25, 115, 232, 1),
          textColor: Colors.white,
          child: Text('Показать все действия',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)))
    ]);
  }

  Widget mainColumn() {
    return Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              topSection(),
              SizedBox(height: 72),
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
