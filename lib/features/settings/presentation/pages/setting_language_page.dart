import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/views/widgets/text_field_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingLanguagePage extends StatefulWidget {
  const SettingLanguagePage({super.key});

  @override
  State<SettingLanguagePage> createState() => _SettingLanguagePageState();
}

class _SettingLanguagePageState extends State<SettingLanguagePage> {
  final List<Language> languages = [
    Language(name: 'English', code: 'GB'),
    Language(name: 'Arabic', code: 'OM'),
  ];

  String searchQuery = '';
  Language? selectedLanguage;

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('selected_language_code');
    final languageName = prefs.getString('selected_language_name');

    if (languageCode != null && languageName != null) {
      setState(() {
        selectedLanguage = Language(name: languageName, code: languageCode);
      });
    }
  }

  Future<void> _saveSelectedLanguage(Language language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language_code', language.code);
    await prefs.setString('selected_language_name', language.name);
  }

  @override
  Widget build(BuildContext context) {
    final filteredLanguages = searchQuery.isEmpty
        ? languages
        : languages
        .where((lang) =>
        lang.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Language", style: TextStyle(fontSize: 16.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, size: 20.sp),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1.h,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: TextFieldSearch(
              hintText: 'Search language',
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLanguages.length,
              itemBuilder: (context, index) {
                final language = filteredLanguages[index];
                return Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      side: selectedLanguage?.code == language.code
                          ? BorderSide(color: Colors.blue, width: 2.w)
                          : BorderSide.none,
                    ),
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      leading: _buildFlag(language.code),
                      title: Text(
                        language.name,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      trailing: selectedLanguage?.code == language.code
                          ? Icon(Icons.check, color: Colors.blue, size: 20.sp)
                          : null,
                      onTap: () {
                        setState(() {
                          selectedLanguage = language;
                        });
                        _saveSelectedLanguage(language);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlag(String countryCode) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      child: ClipOval(
        child: Image.network(
          'https://flagcdn.com/w160/${countryCode.toLowerCase()}.png',
          width: 36.w,
          height: 36.h,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.language, size: 20.sp),
        ),
      ),
    );
  }
}

class Language {
  final String name;
  final String code;

  Language({required this.name, required this.code});
}
