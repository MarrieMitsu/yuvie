import 'package:flutter/material.dart';

import '../../config/routes/application.dart';
import '../../constants/constants.dart';


// detail movie screen
class DetailMovieScreen extends StatefulWidget {
  final int id;
  final MovieSource movieSource;

  const DetailMovieScreen({
    Key? key,
    required this.id,
    required this.movieSource,
  }) : super(key: key);

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {

  String get _getSource {
    switch (widget.movieSource) {
      case MovieSource.LOCAL:
        return '[LOCAL]';
      case MovieSource.REMOTE:
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
                child: Text('Detail Movie Screen'),
              ),
              Expanded(
                child: Text(widget.id.toString()),
              ),
              Expanded(
                child: Text(_getSource),
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