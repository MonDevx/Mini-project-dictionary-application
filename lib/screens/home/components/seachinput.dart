import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mini_project/helpers/helperdictionary.dart';
import 'package:mini_project/localization/localizations.dart';

class SearchInput extends StatefulWidget {
  final Function callSetStateWordTh;
  final Function callSetStateWordEng;
  SearchInput(this.callSetStateWordTh, this.callSetStateWordEng);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  void _onControllerChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final String pattern = r'^[a-z A-Z,.\-]+$';
    final RegExp regExp = RegExp(pattern);
    String checkthoreng = "";
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _hasText
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _controller.clear(),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintText: labels?.seacrh?.seachInputhintlabel,
        ),
      ),
      suggestionsCallback: (query) async {
        checkthoreng = query;
        if (query.trim().isEmpty) return [];
        return !regExp.hasMatch(query)
            ? await HelperDictionary.getAllWordsLikeTh(query.toLowerCase())
            : await HelperDictionary.getAllWordsLikeEn(query.toLowerCase());
      },
      itemBuilder: (context, words) {
        return ListTile(
          leading: const Icon(Icons.translate),
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
    );
  }
}
