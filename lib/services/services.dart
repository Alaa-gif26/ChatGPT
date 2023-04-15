import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        backgroundColor: scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(18),
            child: Row(
              children: [
                Flexible(
                    child: TextWidget(
                  label: "chosen model:",
                  fontSize: 16,
                ))
              ],
            ),
          );
        });
  }
}
