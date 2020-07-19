import 'package:flutter/material.dart';
import 'package:sign_forms/constants/text_theme.dart';

class RowMenu extends StatefulWidget {
  @override
  _RowMenuState createState() => _RowMenuState();
}

class _RowMenuState extends State<RowMenu> {
  Widget rowMenu() {
    return SizedBox.expand(
      child: Center(
        child: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          Text('Политика конфиденциальности', style: menuItem),
          SizedBox(width: 24),
          Container(
              width: 4,
              height: 4,
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
          SizedBox(width: 24),
          Text('Условия использования', style: menuItem),
          SizedBox(width: 24),
          Container(
              width: 4,
              height: 4,
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
          SizedBox(width: 24),
          Text('Справка', style: menuItem),
          SizedBox(width: 24)
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: rowMenu());
  }
}
