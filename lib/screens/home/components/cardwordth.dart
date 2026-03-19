import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:mini_project/models/th2eng_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clipboard/clipboard.dart';

class CardWordTh extends StatefulWidget {
  final bool disablevoice;

  final Th2eng word;
  final FlutterTts fluttertts = FlutterTts();
  CardWordTh(this.disablevoice, this.word, {Key key}) : super(key: key);

  @override
  _CardWordThState createState() => _CardWordThState();
}

class _CardWordThState extends State<CardWordTh> {
  List _favoriteList;
  bool _isfavorite = false;
  bool _disablevoice = false;
  @override
  void initState() {
    super.initState();
    _disablevoice = widget.disablevoice;
    onLoadFavorite();
  }

  @override
  void didUpdateWidget(CardWordTh oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.word != oldWidget.word) {
      setState(() {
        onLoadFavorite();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        child: Card(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          copyToClipboard(widget.word?.getTsearch, labels);
                        }),
                    IconButton(
                        color: Colors.white,
                        icon: Icon(_disablevoice
                            ? Icons.volume_off
                            : Icons.volume_up),
                        onPressed: _disablevoice
                            ? null
                            : () {
                                _speak(widget.word?.getTsearch);
                              }),
                    IconButton(
                        color: Colors.white,
                        icon: Icon(_isfavorite
                            ? Icons.star
                            : Icons.star_border_outlined),
                        onPressed: () {
                          arFavorite(widget.word?.getTsearch, labels);
                        })
                  ],
                ),
                Text('${widget.word?.getTsearch}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    )),
                Text(
                    '${labels?.seacrh?.tEnglishlabel} : ${widget.word?.getEentry}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text(
                    '${labels?.seacrh?.typewordlabel} : ${widget.word?.getTcat}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text(
                    '${labels?.seacrh?.defwordlabel} : ${widget.word?.getTant}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text('${labels?.seacrh?.mwordlabel} : ${widget.word?.getTdef}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text(
                    '${labels?.seacrh?.ewordlabel} : ${widget.word?.getTsample}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _speak(String text) async {
    if (text != null && text.isNotEmpty) {
      await widget.fluttertts.setLanguage("th-TH");

      await widget.fluttertts.setSpeechRate(1.0);

      await widget.fluttertts.setVolume(1.0);

      await widget.fluttertts.setPitch(1.0);

      await widget.fluttertts.isLanguageAvailable("th-TH");

      await widget.fluttertts.speak(text);

      widget.fluttertts.setStartHandler(() {
        setState(() {
          _disablevoice = true;
        });
      });

      widget.fluttertts.setCompletionHandler(() {
        setState(() {
          _disablevoice = false;
        });
      });
    }
  }

  Future<void> arFavorite(
      String getTsearch, AppLocalizations_Labels labels) async {
    Set<String> _favorite = {};
    bool isFavorite;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('favorite_list') != null) {
      _favorite = prefs.getStringList('favorite_list').toSet();
    }
    if (_favorite?.toList()?.indexOf(getTsearch) != -1 &&
        _favorite?.toList()?.indexOf(getTsearch) != null) {
      _favorite.remove(getTsearch);
      isFavorite = false;
    } else {
      _favorite.add(getTsearch);
      isFavorite = true;
    }
    Get.snackbar(
      "${labels?.seacrh?.listlabel} $getTsearch",
      isFavorite
          ? labels?.seacrh?.contentAddSnackBar
          : labels?.favorite?.contentOneSnackBar,
      colorText: Colors.white,
      backgroundColor: isFavorite ? Colors.green[400] : Colors.red[400],
      duration: Duration(seconds: 5),
    );
    await prefs.setStringList(
        'favorite_list', _favorite.map((e) => e.toString()).toList());
    setState(() {
      _isfavorite = isFavorite;
    });
  }

  copyToClipboard(String getTsearch, AppLocalizations_Labels labels) {
    FlutterClipboard.copy(getTsearch).then((value) => Get.snackbar(
          "${labels?.seacrh?.headCopyToClipboardHeadSnackBar} ",
          labels?.seacrh?.contentCopyToClipboardSnackBar,
          colorText: Colors.white,
          backgroundColor: Colors.green[400],
          duration: Duration(seconds: 5),
        ));
  }

  Future<void> onLoadFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteList = prefs.getStringList('favorite_list');
    });

    if (_favoriteList?.indexOf(widget.word?.getTsearch) != -1 &&
        _favoriteList?.indexOf(widget.word?.getTsearch) != null) {
      _isfavorite = true;
    } else {
      _isfavorite = false;
    }
  }
}
