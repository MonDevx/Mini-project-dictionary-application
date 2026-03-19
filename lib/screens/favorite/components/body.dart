import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:mini_project/helpers/helperdictionary.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:mini_project/models/eng2th_model.dart';
import 'package:mini_project/models/th2eng_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  final List _favorite;
  final Function updatefavorite;
  final FlutterTts fluttertts = FlutterTts();

  Body(this._favorite, this.updatefavorite);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool disablevoice = false;
  Th2eng wordth;
  Eng2th wordeng;
  bool checkwordeng;
  String lang = Get.locale.toString();

  void setfavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_list', widget._favorite);
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

    return widget._favorite?.isEmpty ?? true
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_border, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 12),
                Text(
                  labels?.favorite?.emptylabel ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: widget._favorite.length,
                itemBuilder: (context, index) {
                  final word =
                      widget._favorite[widget._favorite.length - index - 1];

                  return Dismissible(
                    key: Key(word),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red,
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        final deletedItem = widget._favorite.removeAt(index);
                        setfavorite();
                        widget.updatefavorite(widget._favorite);
                        Get.snackbar(
                          "${labels?.favorite?.titleDialog} $word",
                          labels?.favorite?.contentOneSnackBar,
                          colorText: Colors.white,
                          backgroundColor: Colors.green[400],
                          duration: const Duration(seconds: 5),
                          mainButton: TextButton(
                            child: Text(
                              '${labels?.favorite?.buttonBackSnackBar}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () => {
                              setState(() =>
                                  widget._favorite.insert(index, deletedItem)),
                              setfavorite(),
                              widget.updatefavorite(widget._favorite),
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
                            const Spacer(),
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
                                icon: const Icon(Icons.remove_red_eye),
                                onPressed: () async {
                                  checkwordeng = word.contains(
                                      RegExp(r'^[a-z A-Z,.\-]+$'));
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
                                        TextButton(
                                          child: Text(
                                              labels?.favorite?.buttonCloseDialog),
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
