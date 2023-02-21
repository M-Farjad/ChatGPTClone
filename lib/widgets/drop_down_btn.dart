import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/models/models_model.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DropDownBtn extends StatefulWidget {
  const DropDownBtn({super.key});

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  String currentmodel = "text-davinci-003";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelsModel>>(
      future: ApiServices.getModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: TextWidget(label: snapshot.error.toString()));
        }
        return snapshot.data == null || snapshot.data!.isEmpty
            ? const SizedBox.shrink()
            : FittedBox(
                child: DropdownButton(
                    iconEnabledColor: Colors.white,
                    dropdownColor: scaffoldBackgroundColor,
                    items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                        value: snapshot.data![index].id,
                        child: TextWidget(
                          label: snapshot.data![index].id,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    value: currentmodel,
                    onChanged: (value) {
                      setState(() {
                        currentmodel = value.toString();
                      });
                    }),
              );
      },
    );
  }
}
