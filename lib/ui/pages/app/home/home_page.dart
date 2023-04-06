import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/app/app_cubit.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../models/template/template_model.dart';
import '../../../../models/user/user_model.dart';
import '../../../../themes/app_theme.dart';
import '../../../../themes/extensions/custom_designs.dart';
import '../../../views/base_builders/app_builder.dart';
import '../../../views/design/app_shader_mask.dart';
import '../../../views/fields/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppCubit get _cubit => context.read();
  AppLocalizations get _strings => context.strings;
  ColorScheme get _colorScheme => context.colorScheme;
  TextTheme get _textTheme => context.textTheme;
  CustomDesigns get _designs => context.designs;

  final _searchController = TextEditingController();

  void _onMenuTap() {
    Scaffold.of(context).openDrawer();
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      final search = _searchController.text;
      _cubit.onSearch(search);
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return AppBuilder<AppCubit, AppState>(
      withScaffold: false,
      builder: (state) {
        return Column(
          children: [
            _buildTitle(),
            Expanded(
              child: AppShaderMask(
                bottomHeight: 32,
                child: ListView(
                  children: [
                    const SizedBox(height: 8),
                    ...state.searched.map(_buildMember),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: _onMenuTap,
            icon: const Icon(
              Icons.menu_open_rounded,
            ),
          ),
          Expanded(
            child: SearchField(
              controller: _searchController,
              removeIcon: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMember(TemplateModel user) {
    final nickname = user.creatorName;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: _designs.dark.tone500.withOpacity(0.2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _designs.light.tone50,
                ),
                child: _buildTextHead(user.name),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _designs.light.tone50,
                ),
                child: _buildText(nickname),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Column(
            children: [
              Dismissible(
                key: ValueKey(user.id),
                child: _buildSwipeDecor(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTextSwipe('ВГ 1 точка⏪'),
                      _buildTextSwipe('⏩ЧГ 1 точка'),
                    ],
                  ),
                ),
                confirmDismiss: (direction) async {
                  return false;
                },
              ),
              const SizedBox(height: 4),
              Dismissible(
                key: ValueKey('${user.id}1'),
                child: _buildSwipeDecor(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTextSwipe('ВГ 2 точки⏪'),
                      _buildTextSwipe('⏩ЧГ 2 точки'),
                    ],
                  ),
                ),
                confirmDismiss: (direction) async {
                  return false;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: _textTheme.bodyLarge,
    );
  }

  Widget _buildTextHead(String text) {
    return Text(
      text,
      style: _textTheme.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildTextSwipe(String text) {
    return Text(
      text,
      style: _textTheme.bodyLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: _designs.dark.tone800,
      ),
    );
  }

  Widget _buildSwipeDecor(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(24, 16)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0x990400FF),
            Color(0x09B0FEBE),
            Color(0x990400FF),
          ],
        ),
      ),
      child: child,
    );
  }
}
