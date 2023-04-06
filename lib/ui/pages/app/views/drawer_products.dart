import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/app/app_cubit.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../themes/app_theme.dart';

class DrawerProducts extends StatelessWidget {
  final VoidCallback onLogOut;

  const DrawerProducts({
    super.key,
    required this.onLogOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return DrawerHeader(
                decoration: BoxDecoration(color: context.colorScheme.primary),
                curve: Curves.easeInOutBack,
                duration: const Duration(seconds: 1),
                child: Center(
                  child: Text(
                    state.profile.name,
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              );
            },
          ),
          ListTile(
            tileColor: context.colorScheme.primaryContainer,
            leading: const Icon(Icons.logout),
            title: Text(context.strings.logOut),
            onTap: () {
              Navigator.of(context).pop();
              onLogOut();
            },
          ),
        ],
      ),
    );
  }
}
