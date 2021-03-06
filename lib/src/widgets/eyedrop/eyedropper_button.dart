import 'package:flutter/material.dart';

import 'eye_dropper_layer.dart';

class EyedropperButton extends StatelessWidget {
  final IconData icon;
  final ValueChanged<Color> onColor;

  const EyedropperButton({Key key, this.icon = Icons.colorize, this.onColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(Icons.colorize),
        color: Colors.blueGrey,
        onPressed: () => _onEyeDropperRequest(context),
      ),
    );
  }

  void _onEyeDropperRequest(BuildContext context) {
    try {
      EyeDrop.of(context).capture(context, onColor);
    } catch (err) {
      print('ERROR !!! _buildPickerOverlay $err');
    }
  }
}
