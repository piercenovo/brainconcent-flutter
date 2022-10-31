import 'package:flutter/material.dart';

void pushToPage(BuildContext context, String string) {
  Navigator.of(context).pushNamed(
    string,
  );
}

void pushAndReplaceToPage(BuildContext context, String string) {
  Navigator.of(context).pushReplacementNamed(
    string,
  );
}

void popAllAndPush(BuildContext context, String string) {
  Navigator.of(context).pushNamedAndRemoveUntil(
      string,
      ModalRoute.withName(
        '/',
      ));
}
