import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:votting/core/theme/colors_theme.dart';
import 'package:votting/data/models/list_options_model.dart';

import 'text_form_input.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({
    Key? key,
    required this.onChanged,
    required this.listOptions,
    this.initValue,
    this.validator,
    this.title = 'Selecciona una opción',
  }) : super(key: key);

  final String? title;
  final dynamic initValue;
  final List<ListOptionsModel> listOptions;
  final Function(ListOptionsModel) onChanged;
  final String? Function(ListOptionsModel?)? validator;

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  ListOptionsModel? _selectedValue;
  List<int>? _selecteds;

  @override
  void initState() {
    super.initState();

    if (widget.initValue != null) {
      _selectedValue = widget.listOptions.firstWhere(
        (element) => element.value == widget.initValue,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _dropdownIOS();
      default:
        return _dropdownAndroid();
    }
  }

  Widget _dropdownAndroid() => DropdownButtonFormField<ListOptionsModel>(
        decoration: InputDecoration(
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          border: inputBorder,
          hintStyle: const TextStyle(fontSize: 16),
          hintText: widget.title,
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        items: List.generate(
          widget.listOptions.length,
          (index) => DropdownMenuItem<ListOptionsModel>(
            value: widget.listOptions[index],
            child: Text(
              widget.listOptions[index].label,
            ),
          ),
        ),
        value: _selectedValue,
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
          widget.onChanged.call(value!);
        },
        validator: widget.validator,
      );

  Widget _dropdownIOS() => GestureDetector(
        onTap: () => _showPicker(),
        child: AbsorbPointer(
          child: _dropdownAndroid(),
        ),
      );

  void _showPicker() {
    Picker(
      selecteds: _selecteds,
      headerColor: Theme.of(context).cardColor,
      backgroundColor: Theme.of(context).cardColor,
      adapter: PickerDataAdapter(
        data: List.generate(
          widget.listOptions.length,
          (index) => PickerItem(
            text: Text(
              widget.listOptions[index].label,
            ),
          ),
        ),
      ),
      cancelText: 'Cancelar',
      cancelTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsAppTheme.primaryColor,
      ),
      confirmText: 'Aceptar',
      confirmTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsAppTheme.primaryColor,
      ),
      title: Text(
        widget.title!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onConfirm: (Picker _, List<int> value) {
        setState(() {
          _selecteds = value;
          _selectedValue = widget.listOptions[value[0]];
        });
        widget.onChanged.call(widget.listOptions[value.first]);
      },
    ).showModal(context);
  }
}
