import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../themes/app_theme.dart';

class SearchField extends StatefulWidget {
  static const double _hightControlButton = 48;

  final TextEditingController controller;
  final bool autoFocus;
  final String? hintText;
  final bool removeIcon;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    required this.controller,
    this.autoFocus = false,
    this.removeIcon = false,
    this.hintText,
    this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  void _onChanged(String value) {
    setState(() {});
    widget.onChanged?.call(value);
  }

  void _onClear() {
    widget.controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(6),
    );

    final text = widget.controller.text;
    return SizedBox(
      height: SearchField._hightControlButton,
      child: TextFormField(
        controller: widget.controller,
        autofocus: widget.autoFocus,
        style: Theme.of(context).textTheme.bodyMedium,
        scrollPadding: EdgeInsets.zero,
        onChanged: _onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          fillColor: context.designs.light.tone300,
          filled: true,
          contentPadding: const EdgeInsets.only(),
          focusedBorder: border,
          disabledBorder: border,
          errorBorder: border,
          enabledBorder: border,
          prefixIcon: SizedBox(
            height: 36,
            width: 36,
            child: Center(child: SvgPicture.asset(Assets.svg.search)),
          ),
          suffixIcon: text.isNotEmpty && widget.removeIcon
              ? GestureDetector(
                  onTap: _onClear,
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : null,
          isDense: true,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
