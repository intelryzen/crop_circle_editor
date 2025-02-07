// Flutter imports:
import 'package:flutter/material.dart';
import 'package:crop_circle_editor/crop_circle_editor.dart';

import '/core/constants/example_constants.dart';
import '/core/mixin/example_helper.dart';
import '/features/design_examples/highly_configurable_example.dart';

/// The design example widget
class DesignExample extends StatefulWidget {
  /// Creates a new [DesignExample] widget.
  const DesignExample({super.key});

  @override
  State<DesignExample> createState() => _DesignExampleState();
}

class _DesignExampleState extends State<DesignExample>
    with ExampleHelperState<DesignExample> {
  final String _urlWhatsApp = 'https://picsum.photos/id/350/1500/3000';
  final String _urlFrostedGlass = 'https://picsum.photos/id/28/1500/3000';
  final String _urlGrounded = 'https://picsum.photos/id/28/1500/3000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Designs'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.grass_outlined),
            title: const Text('Grounded'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.auto_awesome),
            title: const Text('Frosted-Glass'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.tune),
            title: const Text('Custom'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _openExample(
                HighlyConfigurableExample(url: kImageEditorExampleNetworkUrl),
                kImageEditorExampleNetworkUrl,
              );
            },
          ),
        ],
      ),
    );
  }

  void _openExample(Widget example, String url) async {
    LoadingDialog.instance.show(
      context,
      configs: const ProImageEditorConfigs(),
      theme: Theme.of(context),
    );

    await precacheImage(NetworkImage(_urlFrostedGlass), context);

    LoadingDialog.instance.hide();

    if (mounted) {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => example,
        ),
      );
    }
  }
}
