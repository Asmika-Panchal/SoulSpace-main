import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  final String route; // Added route parameter

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      required this.route, // Make route required
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}
