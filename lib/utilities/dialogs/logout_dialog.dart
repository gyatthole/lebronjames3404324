import 'package:flutter/material.dart';
import 'generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log out',
    content: "Are you sure?",
    optionsBuilder: () => {'OK': false, 'Log out': true},
  ).then((value) => value ?? false);
}