import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:payuung_pribadi/presentation/widget/text.dart';

class DropWidget extends StatelessWidget {
  const DropWidget({
    super.key,
    this.onSaved,
    required this.items,
    this.onChanged,
    required this.name,
    this.isUpdate = false,
    this.autofocus,
    this.isRequired = true,
  });
  final String name;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final bool? isUpdate;
  final bool? autofocus;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              isRequired == true ? "* " : "",
              style: const TextStyle(color: Colors.red),
            ),
            TextWidget(title: name)
          ],
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField2<String>(
          autofocus: autofocus ?? false,
          style: const TextStyle(fontSize: 12),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(right: 8),
          ),
          hint: const Text('Select', style: TextStyle(fontSize: 12)),
          items: items,
          validator: (value) {
            if (value == null) {
              return 'Please select $name!';
            }
            return null;
          },
          onChanged: onChanged,
          onSaved: onSaved,
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
