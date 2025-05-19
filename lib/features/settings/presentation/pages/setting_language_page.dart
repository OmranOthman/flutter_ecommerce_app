import 'package:flutter/material.dart';
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
    Language(name: 'Arabic', code: 'SA'),
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
        title: const Text("Language", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.withOpacity(0.3), height: 1),
        ),
      ),
      body: Column(
        children: [
          TextFieldSearch(
            hintText: 'Search language',
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLanguages.length,
              itemBuilder: (context, index) {
                final language = filteredLanguages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: selectedLanguage?.code == language.code
                          ? BorderSide(color: Colors.blue, width: 2.0)
                          : BorderSide.none,
                    ),
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      leading: _buildFlag(language.code),
                      title: Text(language.name),
                      trailing: selectedLanguage?.code == language.code
                          ? const Icon(Icons.check, color: Colors.blue)
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
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ClipOval(
        child: Image.network(
          'https://flagcdn.com/w40/${countryCode.toLowerCase()}.png',
          width: 36,
          height: 36,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.language),
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
