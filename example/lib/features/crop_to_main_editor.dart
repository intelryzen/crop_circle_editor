// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:crop_circle_editor/crop_circle_editor.dart';

// Project imports:
import '/core/constants/example_constants.dart';
import '/core/mixin/example_helper.dart';

/// A widget that demonstrates cropping functionality in the main editor.
///
/// The [CropToMainEditorExample] widget is a stateful widget that provides an
/// example of how to implement cropping within a main editor interface, such as
/// an image editor. This can be used to allow users to select and crop a
/// portion of an image or other content.
///
/// The state for this widget is managed by the [_CropToMainEditorExampleState]
/// class.
///
/// Example usage:
/// ```dart
/// CropToMainEditorExample();
/// ```
class CropToMainEditorExample extends StatefulWidget {
  /// Creates a new [CropToMainEditorExample] widget.
  const CropToMainEditorExample({super.key});

  @override
  State<CropToMainEditorExample> createState() =>
      _CropToMainEditorExampleState();
}

/// The state for the [CropToMainEditorExample] widget.
///
/// This class manages the logic and state required for cropping functionality
/// within the [CropToMainEditorExample] widget.
class _CropToMainEditorExampleState extends State<CropToMainEditorExample>
    with ExampleHelperState<CropToMainEditorExample> {
  final ProImageEditorConfigs _editorConfigs = ProImageEditorConfigs(
    designMode: platformDesignMode,
    i18n: I18n(
      done: "적용",
    ),
    cropRotateEditor:  CropRotateEditorConfigs(
      initAspectRatio: 1,
      provideImageInfos: true,
      canChangeAspectRatio: false,
      style: CropRotateEditorStyle(
        helperLineColor: Colors.white,
        cropCornerColor: Colors.white,
      ),
    ),
  );

  final _cropEditorKey = GlobalKey<CropCircleEditorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isPreCached) return const PrepareImageWidget();

    return CropCircleEditor.asset(
      kImageEditorExampleAssetPath,
      key: _cropEditorKey,
      initConfigs: CropRotateEditorInitConfigs(

        theme: Theme.of(context),
        configs: _editorConfigs,
        enablePopWhenDone: true,
        convertToUint8List: true,
        enableCloseButton: !isDesktopMode(context),
        onDone: (transformations, fitToScreenFactor, imageInfos) {},
      ),
    );
  }
}
