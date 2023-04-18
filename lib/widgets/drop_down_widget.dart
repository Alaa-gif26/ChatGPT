import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task5_chatgpt/constants/constants.dart';
import 'package:task5_chatgpt/models/models_model.dart';
import 'package:task5_chatgpt/providers/models_provider.dart';
import 'package:task5_chatgpt/services/api_services.dart';
import 'package:task5_chatgpt/widgets/text_widget.dart';

import '../providers/models_provider.dart';
import '../providers/models_provider.dart';

class ModalDropDownWidget extends StatefulWidget {
  const ModalDropDownWidget({super.key});

  @override
  State<ModalDropDownWidget> createState() => _ModalDropDownWidgetState();
}

class _ModalDropDownWidgetState extends State<ModalDropDownWidget> {
  String? currentModel;
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    currentModel = modelsProvider.getCurrentModel;
    
    return FutureBuilder<List<ModelsModel>>(
        future: modelsProvider.getAllModels(),
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
                      modelsProvider.setcurrentModel(value.toString());
                    },
                  ),
                );
        });
  }
}
