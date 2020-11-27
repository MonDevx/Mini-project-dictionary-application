

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mini_project/helpers/helperdictionary.dart';
import 'package:mini_project/localization/localizations.dart';

class seachInput extends StatefulWidget {
  final Function callSetStateWordTh;
  final Function callSetStateWordEng;
  seachInput(this.callSetStateWordTh, this.callSetStateWordEng);

  @override
  _seachInputState createState() => _seachInputState();
}

class _seachInputState extends State<seachInput> {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final String patttern = r'^[a-z A-Z,.\-]+$';
    final RegExp regExp = new RegExp(patttern);
    String checkthoreng = "";
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(25.0)),
          hintText: labels?.seacrh?.seachInputhintlabel,
        )),
        suggestionsCallback: (pattern) async {
          checkthoreng = pattern;

          return !regExp.hasMatch(pattern)
              ? await HelperDictionary.getAllWordsLikeTh(pattern.toLowerCase())
              : await HelperDictionary.getAllWordsLikeEn(pattern.toLowerCase());
        },
        itemBuilder: (context, words) {
          return ListTile(
            leading: Icon(Icons.translate),
            title: Text(!regExp.hasMatch(checkthoreng)
                ? words.getTsearch
                : words.getEsearch),
          );
        },
        onSuggestionSelected: (words) {
          !regExp.hasMatch(checkthoreng)
              ? widget.callSetStateWordTh(words)
              : widget.callSetStateWordEng(words);
        },
      ),
    );
  }
}
