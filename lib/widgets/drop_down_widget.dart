import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task5_chatgpt/constants/constants.dart';
import 'package:task5_chatgpt/models/models_model.dart';
import 'package:task5_chatgpt/services/api_services.dart';
import 'package:task5_chatgpt/widgets/text_widget.dart';

class ModalDropDownWidget extends StatefulWidget {
  const ModalDropDownWidget({super.key});

  @override
  State<ModalDropDownWidget> createState() => _ModalDropDownWidgetState();
}

class _ModalDropDownWidgetState extends State<ModalDropDownWidget> {
  String currentModel = "text-davinci-edit-001";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelsModel>>(
        future: ApiService.getModels(),
        builder: (context, Snapshot) {
          if (Snapshot.hasError) {
            return Center(child: TextWidget(label: Snapshot.error.toString()));
          }
          return Snapshot.data == null || Snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                child: DropdownButton(
                    dropdownColor: scaffoldBackgroundColor,
                    iconEnabledColor: Colors.white,
                    items: List<DropdownMenuItem<String?>>.generate(
                       Snapshot.data!.length,
                       (index) => DropdownMenuItem(
                           value: Snapshot.data![index].id,
                           child: TextWidget(
                 label: Snapshot.data![index].id,
                          fontSize: 15,
                           ))),
                    value: currentModel,
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString();
                      });
                    },
                  ),
              );
        });
  }
}


