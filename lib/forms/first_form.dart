import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sign_forms/forms/second_form.dart';
import 'package:sign_forms/widgets/custom_checkbox.dart';

import '../main.dart';

class FirstForm extends StatefulWidget {
  @override
  _FirstFormState createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  double screenWidth;
  bool isPortraitMode;
  bool _checkboxState = true;

  @override
  Widget build(BuildContext context) {
    isPortraitMode = MediaQuery.of(context).orientation == Orientation.portrait;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text('First form')), body: buildBody());
  }

  Widget timeSection() {
    return Row(children: [
      Text('11 июля, 15:06', style: Theme.of(context).textTheme.bodyText2),
      SizedBox(width: 4),
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          color: Color.fromRGBO(25, 115, 231, 1),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text('Новое',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white))))
    ]);
  }

  Widget titleSection() {
    return Column(children: [
      Text('Приложению "Zapier" предоставлен доступ к вашему аккаунту Google',
          style: Theme.of(context).textTheme.headline5),
      SizedBox(height: 18),
      Text(
          'Если вы не предоставляли доступ, возможно, '
          'кто-то посторонний использует ваш аккаунт.',
          style: Theme.of(context).textTheme.bodyText1)
    ]);
  }

  Widget accountSection() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Card(
          elevation: 0,
          shape: CircleBorder(
              side: BorderSide(
                  width: 4, color: Color.fromRGBO(236, 237, 239, 1))),
          child: Padding(
              padding: const EdgeInsets.all(14),
              child: Image.asset('assets/images/account_image.jpg',
                  width: 37, height: 37))),
      SizedBox(width: 14),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Zapier', style: Theme.of(context).textTheme.subtitle1),
        SizedBox(height: 6),
        Text('Доступ к некоторым данным в аккаунте',
            style: Theme.of(context).textTheme.bodyText1)
      ])),
      Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: IconButton(
              iconSize: 30, icon: Icon(Icons.info_outline), onPressed: () {}))
    ]);
  }

  Widget deviceSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Устройство'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(fontWeight: FontWeight.w600)),
      SizedBox(height: 20),
      Text('Windows', style: Theme.of(context).textTheme.subtitle1),
      SizedBox(height: 8),
      Text('AEVUM-PC', style: Theme.of(context).textTheme.bodyText1),
      SizedBox(height: 12),
      Text('Ленинградская обл., Россия',
          style: Theme.of(context).textTheme.bodyText1),
      SizedBox(height: 6),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
            width: 16,
            height: 16,
            child: CustomCheckbox(
                value: _checkboxState,
                onChanged: (bool value) {
                  setState(() => _checkboxState = value);
                })),
        SizedBox(width: 8),
        Text('Это устройство', style: Theme.of(context).textTheme.bodyText1)
      ])
    ]);
  }

  Widget confirmationButtonSection() {
    List<Widget> buttonList = [
      FlatButton(
          splashColor: Color.fromRGBO(211, 106, 98, 0.3),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(width: 1, color: Colors.black12)),
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.clear, size: 22, color: Color.fromRGBO(211, 106, 98, 1)),
            SizedBox(width: 8),
            Text('Нет, защитить аккаунт',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Color.fromRGBO(211, 106, 98, 1),
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 8)
          ])),
      FlatButton(
          splashColor: Color.fromRGBO(91, 143, 216, 0.3),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(width: 1, color: Colors.black12)),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => SecondForm(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.check, size: 22, color: Color.fromRGBO(91, 143, 216, 1)),
            SizedBox(width: 8),
            Text('Да',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Color.fromRGBO(91, 143, 216, 1),
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 8)
          ]))
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Это были вы?', style: Theme.of(context).textTheme.bodyText1),
      SizedBox(height: 12),
      isMobile && screenWidth < 400 && isPortraitMode
          ? Wrap(children: [buttonList[0], SizedBox(width: 8), buttonList[1]])
          : isMobile && screenWidth < 570 && isPortraitMode
              ? Row(children: [
                  buttonList[0],
                  SizedBox(width: 8),
                  Expanded(child: buttonList[1])
                ])
              : isMobile
                  ? Row(children: [
                      Expanded(child: buttonList[0]),
                      SizedBox(width: 8),
                      Expanded(child: buttonList[1])
                    ])
                  : Row(children: [
                      Expanded(child: buttonList[0]),
                      SizedBox(width: 8),
                      Expanded(child: buttonList[1])
                    ])
    ]);
  }

  Widget mainColumn() {
    return Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              timeSection(),
              SizedBox(height: 14),
              titleSection(),
              SizedBox(height: 28),
              accountSection(),
              SizedBox(height: 40),
              deviceSection(),
              SizedBox(height: 40),
              confirmationButtonSection()
            ]));
  }

  Widget buildBody() {
    Widget mobileLayout = SingleChildScrollView(child: mainColumn());
    Widget pcLayout = ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 552),
        child: SingleChildScrollView(
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: mainColumn())));

    return isMobile ? mobileLayout : pcLayout;
  }
}
