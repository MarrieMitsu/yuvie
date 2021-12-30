import 'package:flutter/material.dart';

import '../../config/routes/application.dart';
import '../../constants/constants.dart';


// movie form screen
class MovieFormScreen extends StatefulWidget {
  final int? id;
  final FormMode formMode;

  const MovieFormScreen({ 
    Key? key,
    this.id,
    required this.formMode,
  }) : super(key: key);

  @override
  _MovieFormScreenState createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {

  String get _getMode {
    switch (widget.formMode) {
      case FormMode.CREATE:
        return '[LOCAL]';
      case FormMode.EDIT:
        return '[REMOTE]';
      default:
        return '[Opps!]';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text('Movie Form Screen'),
              ),
              Expanded(
                child: Text(widget.id.toString()),
              ),
              Expanded(
                child: Text(_getMode),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Application.router.pop(context);
                  },
                  child: Text('Dashboard'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}