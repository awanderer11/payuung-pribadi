import 'package:flutter/material.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

class FieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final IconData? iconData;
  final int? maxLines;
  final bool? readOnly;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? name;
  final String? initialValue;
  final bool? isRequired;
  const FieldWidget({
    super.key,
    this.iconData,
    this.maxLines,
    this.textEditingController,
    this.readOnly,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    this.name,
    this.initialValue,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              isRequired == true ? "* " : "",
              style: const TextStyle(color: Colors.red),
            ),
            TextWidget(title: name ?? ""),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          initialValue: initialValue,
          style: const TextStyle(color: Colors.black, fontSize: 12),
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          minLines: 1,
          controller: textEditingController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: onTap,
              icon: Icon(iconData),
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class FieldTextWidget extends StatelessWidget {
  const FieldTextWidget(
      {super.key,
      this.iconData,
      required this.maxLines,
      required this.textEditingController,
      required this.tittle});
  final TextEditingController textEditingController;
  final IconData? iconData;
  final int maxLines;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget(title: tittle),
            const Text("*", style: TextStyle(color: Colors.red))
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          minLines: maxLines,
          controller: textEditingController,
          decoration: InputDecoration(
            prefix: const SizedBox(
              width: 8,
            ),
            suffixIcon: Icon(iconData),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
