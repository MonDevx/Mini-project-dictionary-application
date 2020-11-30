// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

class AppLocalizations {
  AppLocalizations(this.locale) : this.labels = languages[locale];

  final Locale locale;

  static final Map<Locale, AppLocalizations_Labels> languages = {
    Locale.fromSubtags(languageCode: "th"): AppLocalizations_Labels(
      seacrh: AppLocalizations_Labels_Seacrh(
          title: "พจนานุกรม",
          seachInputhintlabel: "กรุณากรอกคำค้นหา",
          tEnglishlabel: "แปลภาษา",
          typewordlabel: "รูปแบบคำ",
          defwordlabel: "คำตรงกันข้าม",
          mwordlabel: "ความหมาย",
          ewordlabel: "ประโยคตัวอย่าง",
          listlabel: "รายการ",
          contentAddSnackBar: "เพิ่มในรายการที่ชอบสำเร็จ",
          headCopyToClipboardHeadSnackBar: "คัดลอก",
          contentCopyToClipboardSnackBar: "คัดลอกไปยังคลิปบอร์ดสำเร็จ"),
      history: AppLocalizations_Labels_History(
        title: "ประวัติการค้นหา",
        titleDialog: "ลบรายการประวัติ",
        contentDialog: "คุณต้องลบรายการประวัติใช่หรือไม่ ?",
        buttonCloseDialog: "ปิด",
        buttonOkDialog: "ลบ",
        contentToalSnackBar: "ลบรายการทั้งหมดออกจากประวัติการค้นหาเสร็จสิ้น",
        contentOneSnackBar: "ลบรายการออกจากประวัติการค้นหาเสร็จสิ้น",
        buttonBackSnackBar: "ย้อนกลับ",
        emptylabel: "ไม่มีรายการประวัติค้นหา",
      ),
      sidebar: AppLocalizations_Labels_Sidebar(
        title: "ค้นหา",
      ),
      favorite: AppLocalizations_Labels_Favorite(
        title: "รายการที่ชอบ",
        titleDialog: "ลบรายการที่ชอบ",
        contentDialog: "คุณต้องลบรายการที่ชอบใช่หรือไม่ ?",
        buttonCloseDialog: "ปิด",
        buttonOkDialog: "ลบ",
        contentToalSnackBar: "ลบรายการทั้งหมดออกจากรายการที่ชอบเสร็จสิ้น",
        contentOneSnackBar: "ลบรายการออกจากรายการที่ชอบเสร็จสิ้น",
        buttonBackSnackBar: "ย้อนกลับ",
        emptylabel: "ไม่มีรายการที่ชอบ",
      ),
      setting: AppLocalizations_Labels_Setting(
          title: "ตั้งค่าระบบ",
          languageslabel: "เปลี่ยนภาษา",
          languagesthlabel: "ไทย",
          languagesenglabel: "อังกฤษ",
          cache: "แคช",
          cachecontentdialog: "คุณต้องการลบข้อมูลแคชทั้งหมดใช่หรือไหม ?",
          cachebutton: "ลบแคชข้อมูล"),
    ),
    Locale.fromSubtags(languageCode: "en"): AppLocalizations_Labels(
      seacrh: AppLocalizations_Labels_Seacrh(
          title: "Dictionary",
          seachInputhintlabel: "Please enter a  search term",
          tEnglishlabel: "Translation",
          typewordlabel: "word pattern",
          defwordlabel: "antonyms",
          mwordlabel: "Meaning",
          ewordlabel: "example sentence",
          listlabel: "list",
          contentAddSnackBar: "Successfully added to favorites",
          headCopyToClipboardHeadSnackBar: "Copy to clip",
          contentCopyToClipboardSnackBar: "Successfully copied to clipboard."),
      history: AppLocalizations_Labels_History(
        title: "Search History",
        titleDialog: "Delete History Item",
        contentDialog: "Do you have to delete the history item?",
        buttonCloseDialog: "Close",
        buttonOkDialog: "yes",
        contentToalSnackBar: "Done delete all entries from search history",
        contentOneSnackBar: "Successfully deleted item from search history",
        buttonBackSnackBar: "Back",
        emptylabel: "No search history entry",
      ),
      sidebar: AppLocalizations_Labels_Sidebar(
        title: "Search",
      ),
      favorite: AppLocalizations_Labels_Favorite(
        title: "Favorite List",
        titleDialog: "Remove Favorites",
        contentDialog: "Do you have to delete your favorites?",
        buttonCloseDialog: "Close",
        buttonOkDialog: "Delete",
        contentToalSnackBar: "Done delete all items from favorites",
        contentOneSnackBar: "Done Remove from Favorites",
        buttonBackSnackBar: "Back",
        emptylabel: "No favorites",
      ),
      setting: AppLocalizations_Labels_Setting(
          title: "System Settings",
          languageslabel: "Change language",
          languagesthlabel: "Thai",
          languagesenglabel: "English",
          cache: "Cache",
          cachecontentdialog: "Do you want to delete all cached data, right?",
          cachebutton: "Clear cache"),
    ),
  };

  final AppLocalizations_Labels labels;

  static AppLocalizations_Labels of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)?.labels;
}

class AppLocalizations_Labels_Setting {
  final String title;
  final String languageslabel;
  final String cache;
  final String cachecontentdialog;
  final String cachebutton;
  final String languagesthlabel;
  final String languagesenglabel;
  AppLocalizations_Labels_Setting(
      {this.title,
      this.languageslabel,
      this.cachecontentdialog,
      this.cache,
      this.cachebutton,
      this.languagesthlabel,
      this.languagesenglabel});
}

class AppLocalizations_Labels_Sidebar {
  final String title;

  AppLocalizations_Labels_Sidebar({this.title});
}

class AppLocalizations_Labels_Favorite {
  final String title;
  final String titleDialog;
  final String contentDialog;
  final String buttonCloseDialog;
  final String buttonOkDialog;
  final String contentToalSnackBar;
  final String contentOneSnackBar;
  final String buttonBackSnackBar;
  final String emptylabel;

  AppLocalizations_Labels_Favorite(
      {this.title,
      this.titleDialog,
      this.contentDialog,
      this.buttonCloseDialog,
      this.buttonOkDialog,
      this.contentToalSnackBar,
      this.contentOneSnackBar,
      this.buttonBackSnackBar,
      this.emptylabel});
}

class AppLocalizations_Labels_History {
  final String title;
  final String titleDialog;
  final String contentDialog;
  final String buttonCloseDialog;
  final String buttonOkDialog;
  final String contentToalSnackBar;
  final String contentOneSnackBar;
  final String buttonBackSnackBar;
  final String emptylabel;

  AppLocalizations_Labels_History(
      {this.title,
      this.titleDialog,
      this.contentDialog,
      this.buttonCloseDialog,
      this.buttonOkDialog,
      this.contentToalSnackBar,
      this.contentOneSnackBar,
      this.buttonBackSnackBar,
      this.emptylabel});
}

class AppLocalizations_Labels_Seacrh {
  const AppLocalizations_Labels_Seacrh(
      {this.title,
      this.seachInputhintlabel,
      this.tEnglishlabel,
      this.typewordlabel,
      this.defwordlabel,
      this.mwordlabel,
      this.ewordlabel,
      this.listlabel,
      this.contentAddSnackBar,
      this.headCopyToClipboardHeadSnackBar,
      this.contentCopyToClipboardSnackBar});
  final String title;
  final String seachInputhintlabel;
  final String tEnglishlabel;
  final String typewordlabel;
  final String defwordlabel;
  final String mwordlabel;
  final String ewordlabel;
  final String listlabel;
  final String contentAddSnackBar;
  final String headCopyToClipboardHeadSnackBar;
  final String contentCopyToClipboardSnackBar;
}

class AppLocalizations_Labels {
  AppLocalizations_Labels(
      {this.seacrh, this.history, this.favorite, this.sidebar, this.setting});
  final AppLocalizations_Labels_Seacrh seacrh;
  final AppLocalizations_Labels_History history;
  final AppLocalizations_Labels_Favorite favorite;
  final AppLocalizations_Labels_Sidebar sidebar;
  final AppLocalizations_Labels_Setting setting;
}
