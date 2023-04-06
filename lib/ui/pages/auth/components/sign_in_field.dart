import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../views/fields/single_line_field.dart';

class SignInField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  final String? hintText;

  const SignInField({
    super.key,
    this.maxLength,
    required this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SingleLineField(
      controller: controller,
      maxLength: maxLength,
      hintText: hintText,
      textInputType: TextInputType.emailAddress,
      prefixIcon: _buildLeadIcon(),
    );
  }

  Widget _buildLeadIcon() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 18, 8, 18),
      child: SvgPicture.asset(Assets.svg.mail),
    );
  }
}
