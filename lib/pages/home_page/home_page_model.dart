import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> selectedItems = [];
  void addToSelectedItems(FFUploadedFile item) => selectedItems.add(item);
  void removeFromSelectedItems(FFUploadedFile item) =>
      selectedItems.remove(item);
  void removeAtIndexFromSelectedItems(int index) =>
      selectedItems.removeAt(index);
  void insertAtIndexInSelectedItems(int index, FFUploadedFile item) =>
      selectedItems.insert(index, item);
  void updateSelectedItemsAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      selectedItems[index] = updateFn(selectedItems[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - stitchPanoramaWithDartFFI] action in Button widget.
  FFUploadedFile? stitchedImage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
