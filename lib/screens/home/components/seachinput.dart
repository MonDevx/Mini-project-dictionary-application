import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:mini_project/helpers/helperdictionary.dart';
import 'package:mini_project/localization/localizations.dart';

class seachInput extends StatefulWidget {
  final Function onClick;
  seachInput(this.onClick, {Key key}) : super(key: key);

  @override
  _seachInputState createState() => _seachInputState();
}

class _seachInputState extends State<seachInput> {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    String lang = Get.locale.toString();
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0)),
              hintText: labels?.seacrh?.seachInputhintlabel,
            )),
        suggestionsCallback: (pattern) async {
          return lang == 'th'
              ? HelperDictionary.getAllWordsLikeTh(pattern.toLowerCase())
              : HelperDictionary.getAllWordsLikeEn(pattern.toLowerCase());
        },
        itemBuilder: (context, words) {
          return ListTile(
            leading: Icon(Icons.translate),
            title:
                Text(lang == 'th' ? words.getTsearch : words.getEsearch),
          );
        },
        onSuggestionSelected: (words) {
          widget.onClick(words);
        },
      ),
    );
  }
}
