import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funda_assignment/src/extensions/build_context_extensions.dart';
import 'package:funda_assignment/src/presentation/widgets/detail_page_app_bar.dart';
import 'package:funda_assignment/src/presentation/widgets/detail_page_main_actions.dart';
import 'package:funda_assignment/src/presentation/widgets/detail_page_object_description.dart';
import 'package:funda_assignment/src/presentation/widgets/detail_page_object_info.dart';
import 'package:funda_assignment/src/providers/object_detail_provider.dart';
import 'package:provider/provider.dart';

/// Shows the details of an object retrieved from the Funda partner api.
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  /// Route key that kan be used when setting up routing and navigating to
  /// this page.
  static const route = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

Widget get _loadingSpinner => const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

Widget _buildErrorMessage(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(context.l10n.tryAgain),
      ),
    ),
  );
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ObjectDetailProvider>();

    if (state.loading) return _loadingSpinner;
    if (state.hasError) return _buildErrorMessage(context);

    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailPageAppBar(),
          DetailPageMainActions(),
          DetailPageObjectInfo(),
          DetailPageObjectDescription(),
        ],
      ),
    );
  }
}
