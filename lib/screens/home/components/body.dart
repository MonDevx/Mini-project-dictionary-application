import 'package:flutter/material.dart';
import 'package:mini_project/helpers/helperdictionary.dart';
import 'package:mini_project/models/eng2th_model.dart';
import 'package:mini_project/models/th2eng_model.dart';
import 'package:mini_project/screens/home/components/cardwordth.dart';
import 'package:mini_project/screens/home/components/seachinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cardwordeng.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Th2eng _wordth;
  Eng2th _worden;
  bool _disablevoice = false;
  bool thoreng = true;

  @override
  void initState() {
    super.initState();
    HelperDictionary.connectDB();
  }

  callSetStateWordTh(Th2eng word) async {
    Set<String> _history = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('history_list') != null) {
      _history = prefs.getStringList('history_list').toSet();
    }
    _history.add(word.getTsearch);
    await prefs.setStringList(
        'history_list', _history.map((e) => e.toString()).toList());
    setState(() {
      _wordth = word;
      thoreng = true;
    });
  }

  callSetStateWordEng(Eng2th word) async {
    Set<String> _history = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('history_list') != null) {
      _history = prefs.getStringList('history_list').toSet();
    }
    _history.add(word.esearch);
    await prefs.setStringList(
        'history_list', _history.map((e) => e.toString()).toList());
    setState(() {
      _worden = word;
      thoreng = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchInput(callSetStateWordTh, callSetStateWordEng),
              Visibility(
                visible: _wordth != null || _worden != null,
                child: thoreng
                    ? CardWordTh(_disablevoice, _wordth)
                    : CardWordEng(_disablevoice, _worden),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
