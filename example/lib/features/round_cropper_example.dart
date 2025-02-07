// Flutter imports:
import 'package:example/core/constants/example_constants.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:crop_circle_editor/crop_circle_editor.dart';

// Project imports:
import '/core/mixin/example_helper.dart';

/// The example how to use the round cropper
class RoundCropperExample extends StatefulWidget {
  /// Creates a new [RoundCropperExample] widget.
  const RoundCropperExample({super.key});

  @override
  State<RoundCropperExample> createState() => _RoundCropperExampleState();
}

class _RoundCropperExampleState extends State<RoundCropperExample>
    with ExampleHelperState<RoundCropperExample> {
  final _cropRotateEditorKey = GlobalKey<CropCircleEditorState>();

  @override
  void initState() {
    super.initState();
    preCacheImage(assetPath: kImageEditorExampleAssetPath);
  }

  @override
  Widget build(BuildContext context) {
    if (!isPreCached) return const PrepareImageWidget();

    return CropCircleEditor.asset(
      kImageEditorExampleAssetPath,
      key: _cropRotateEditorKey,
      initConfigs: CropRotateEditorInitConfigs(
        theme: Theme.of(context),
        convertToUint8List: true,
        onImageEditingStarted: onImageEditingStarted,
        onImageEditingComplete: onImageEditingComplete,
        onCloseEditor: () => onCloseEditor(enablePop: !isDesktopMode(context)),
        enableCloseButton: !isDesktopMode(context),
        configs: ProImageEditorConfigs(
          designMode: platformDesignMode,
          imageGeneration: const ImageGenerationConfigs(
            outputFormat: OutputFormat.png,
            pngFilter: PngFilter.average,
          ),
          cropRotateEditor: const CropRotateEditorConfigs(
            roundCropper: true,
            canChangeAspectRatio: false,
            initAspectRatio: 1,
          ),
        ),
      ),
    );
  }
}
