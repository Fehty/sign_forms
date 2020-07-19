import 'package:flutter/material.dart';
import 'package:sign_forms/main.dart';

class DialogForm extends StatefulWidget {
  @override
  _DialogFormState createState() => _DialogFormState();
}

class _DialogFormState extends State<DialogForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody());
  }

  Widget topSection() {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(left: 22, right: 4, bottom: 8),
          child: Row(children: [
            Text('О приложении',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.black54)),
            Spacer(),
            IconButton(
                icon: Icon(Icons.clear, color: Colors.black54),
                onPressed: () => Navigator.pop(context))
          ])),
      Divider(height: 0, thickness: 2, color: Color.fromRGBO(236, 237, 239, 1))
    ]);
  }

  Widget accountSection() {
    return Padding(
        padding: const EdgeInsets.only(left: 16, top: 18),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Card(
              elevation: 0,
              shape: CircleBorder(
                  side: BorderSide(
                      width: 4, color: Color.fromRGBO(236, 237, 239, 1))),
              child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Image.asset('assets/images/account_image.jpg',
                      width: 37, height: 37))),
          SizedBox(width: 12),
          Text('Zapier',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.black54))
        ]));
  }

  Widget middleSection() {
    return Padding(
        padding: const EdgeInsets.only(left: 22, top: 16, right: 22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 12),
          Text('У приложения есть доступ к:',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.black54, fontWeight: FontWeight.w700)),
          SizedBox(height: 28),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(Icons.account_circle, color: Colors.black54),
            SizedBox(width: 28),
            Flexible(
                child: Text(
                    'Создание, изменение, упорядочивание и удаление всех ваших задач',
                    style: Theme.of(context).textTheme.bodyText1))
          ]),
          SizedBox(height: 28),
          Text('Подробнее об этом приложении:',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.black54, fontWeight: FontWeight.w700)),
          SizedBox(height: 28),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(Icons.access_time, color: Colors.black54),
            SizedBox(width: 28),
            Flexible(
                child: Text('Доступ открыт 11 июля 2020 г.',
                    style: Theme.of(context).textTheme.bodyText1))
          ]),
          SizedBox(height: 8)
        ]));
  }

  Widget mainColumn() {
    return Padding(
        padding: EdgeInsets.only(top: isMobile ? 28 : 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [topSection(), accountSection(), middleSection()]));
  }

  Widget buildBody() {
    Widget mobileLayout = SingleChildScrollView(child: mainColumn());
    Widget pcLayout = SingleChildScrollView(child: mainColumn());

    return isMobile ? mobileLayout : pcLayout;
  }
}
