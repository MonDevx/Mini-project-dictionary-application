import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:mini_project/helpers/helperdictionary.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:mini_project/models/eng2th_model.dart';
import 'package:mini_project/models/th2eng_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  final List _history;
  final Function updateHistory;
  final FlutterTts fluttertts = FlutterTts();

  Body(this._history, this.updateHistory);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool disablevoice = false;
  Th2eng wordth;
  Eng2th wordeng;
  bool checkwordeng;
  String lang = Get.locale.toString();
  void setHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('history_list', widget._history);
  }

  Future _speak(String text) async {
    if (text != null && text.isNotEmpty) {
      await widget.fluttertts.setLanguage(lang == "th" ? "th-TH" : "en-US");

      await widget.fluttertts.setSpeechRate(1.0);

      await widget.fluttertts.setVolume(1.0);

      await widget.fluttertts.setPitch(1.0);

      await widget.fluttertts
          .isLanguageAvailable(lang == "th" ? "th-TH" : "en-US");

      await widget.fluttertts.speak(text);

      widget.fluttertts.setStartHandler(() {
        setState(() {
          disablevoice = true;
        });
      });

      widget.fluttertts.setCompletionHandler(() {
        setState(() {
          disablevoice = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return widget._history?.isEmpty?? true
        ? Center(child: Text(labels?.history?.emptylabel))
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: widget._history.length,
                itemBuilder: (context, index) {
                  final word = widget._history[index];

                  return Dismissible(
                    key: Key(word),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red,
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        final deletedItem = widget._history.removeAt(index);
                        setHistory();
                        widget.updateHistory(widget._history);
                        Get.snackbar(
                          "${labels?.history?.titleDialog} $word",
                          labels?.history?.contentOneSnackBar,
                          colorText: Colors.white,
                          backgroundColor: Colors.green[400],
                          duration: Duration(seconds: 5),
                          mainButton: FlatButton(
                            child: Text(
                              '${labels?.history?.buttonBackSnackBar}',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => {
                              setState(() =>
                                  widget._history.insert(index, deletedItem)),
                              setHistory(),
                              widget.updateHistory(widget._history),
                              Get.back()
                            },
                          ),
                        );
                      });
                    },
                    child: Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(word),
                            Spacer(),
                            IconButton(
                                icon: Icon(disablevoice
                                    ? Icons.volume_off
                                    : Icons.volume_up),
                                onPressed: disablevoice
                                    ? null
                                    : () async {
                                        _speak(word);
                                      }),
                            IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () async {
                                  checkwordeng = word.contains(
                                      new RegExp(r'^[a-z A-Z,.\-]+$'));
                                  if (checkwordeng) {
                                    wordeng =
                                        await HelperDictionary.getWordEng(word);
                                  } else {
                                    wordth =
                                        await HelperDictionary.getWordTh(word);
                                  }
                                  Get.dialog(AlertDialog(
                                      scrollable: true,
                                      title: Text("$word"),
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${labels?.seacrh?.tEnglishlabel} : ${!checkwordeng ? wordth.getEentry : wordeng?.getTentry}',
                                          ),
                                          Text(
                                            '${labels?.seacrh?.typewordlabel} : ${!checkwordeng ? wordth.getTcat : wordeng?.getEcat}',
                                          ),
                                          Text(
                                            '${labels?.seacrh?.defwordlabel} : ${!checkwordeng ? wordth.getTant : wordeng?.getEsyn}',
                                          ),
                                          Text(
                                            '${labels?.seacrh?.mwordlabel} : ${!checkwordeng ? wordth.getTdef : wordeng?.getEthai}',
                                          ),
                                          Text(
                                            '${labels?.seacrh?.ewordlabel} : ${!checkwordeng ? wordth.getTsample : wordeng?.getEant}',
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                          child: Text(labels
                                              ?.favorite?.buttonCloseDialog),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ]));
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
  }
}
