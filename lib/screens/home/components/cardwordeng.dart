import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:mini_project/models/eng2th_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class cardWordEng extends StatefulWidget {
  bool disablevoice;

  final Eng2th word;
  final FlutterTts fluttertts = FlutterTts();
  cardWordEng(this.disablevoice, this.word, {Key key}) : super(key: key);

  @override
  _cardWordEngState createState() => _cardWordEngState();
}

class _cardWordEngState extends State<cardWordEng> {
  List _favoriteList;
  bool _isfavorite = false;
  @override
  void initState() {
    super.initState();
    onLoadFavorite();
  }

  @override
  void didUpdateWidget(cardWordEng oldWidget) {
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
      padding: const EdgeInsets.only(top: 60),
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
                          copyToClipboard(widget.word?.getEsearch, labels);
                        }),
                    IconButton(
                        color: Colors.white,
                        icon: Icon(widget.disablevoice
                            ? Icons.volume_off
                            : Icons.volume_up),
                        onPressed: widget.disablevoice
                            ? null
                            : () {
                                _speak(widget.word?.getEsearch);
                              }),
                    IconButton(
                        color: Colors.white,
                        icon: Icon(_isfavorite
                            ? Icons.star
                            : Icons.star_border_outlined),
                        onPressed: () {
                          arFavorite(widget.word?.getEsearch, labels);
                        })
                  ],
                ),
                Text('${widget.word?.getEsearch}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    )),
                Text(
                    '${labels?.seacrh?.tEnglishlabel} : ${widget.word?.getTentry}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text(
                    '${labels?.seacrh?.typewordlabel} : ${widget.word?.getEcat}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text(
                    '${labels?.seacrh?.defwordlabel} : ${widget.word?.getEsyn}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text('${labels?.seacrh?.mwordlabel} : ${widget.word?.getEthai}',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text('${labels?.seacrh?.ewordlabel} : ${widget.word?.getEant}',
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
      await widget.fluttertts.setLanguage("en-US");

      await widget.fluttertts.setSpeechRate(1.0);

      await widget.fluttertts.setVolume(1.0);

      await widget.fluttertts.setPitch(1.0);

      await widget.fluttertts.isLanguageAvailable("en-US");

      await widget.fluttertts.speak(text);

      widget.fluttertts.setStartHandler(() {
        setState(() {
          widget.disablevoice = true;
        });
      });

      widget.fluttertts.setCompletionHandler(() {
        setState(() {
          widget.disablevoice = false;
        });
      });
    }
  }

  copyToClipboard(String getEsearch, AppLocalizations_Labels labels) {
    FlutterClipboard.copy(getEsearch).then((value) => Get.snackbar(
          "${labels?.seacrh?.headCopyToClipboardHeadSnackBar} ",
          labels?.seacrh?.contentCopyToClipboardSnackBar,
          colorText: Colors.white,
          backgroundColor: Colors.green[400],
          duration: Duration(seconds: 5),
        ));
  }

  Future<void> arFavorite(
      String getTsearch, AppLocalizations_Labels labels) async {
    Set<String> _favorite = new Set();
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

  Future<void> onLoadFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteList = prefs.getStringList('favorite_list');
    });

    if (_favoriteList?.indexOf(widget.word?.getEsearch) != -1 &&
        _favoriteList?.indexOf(widget.word?.getEsearch) != null) {
      _isfavorite = true;
    } else {
      _isfavorite = false;
    }
  }
}
