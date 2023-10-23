import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared/styles/colors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var langs = ["English".tr(), "Arabic".tr()];
    String langValue =
        EasyLocalization.of(context)!.currentLocale == Locale("en")
            ? "English".tr()
            : "Arabic".tr();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Language".tr(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: MyColors.mainColor)),
            child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                style: TextStyle(
                    color: MyColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                value: langValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: langs.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(items).tr(),
                    ),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  if (newVal == "English".tr()) {
                    EasyLocalization.of(context)!.setLocale(Locale("en"));
                  } else if (newVal == "Arabic".tr()) {
                    EasyLocalization.of(context)!.setLocale(Locale("ar"));
                  }
                  setState(() {
                    langValue = newVal!;
                  });
                }),
          ),
        ),
      ],
    );
  }
}
