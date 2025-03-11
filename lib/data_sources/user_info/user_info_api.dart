import 'dart:developer';
import 'package:axeta/data_sources/user_info/i_user_info_api.dart';
import 'package:axeta/entities/user_info_entity.dart';
import 'package:axeta/entities/portfolio_entity.dart';
import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalUserInfoApi implements IUserInfoApi {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user_info.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE user_info (
          id INTEGER PRIMARY KEY,
          fullname TEXT,
          location TEXT,
          language TEXT,
          avatarPath TEXT,
          availability TEXT,
          environment TEXT,
          quote1 TEXT,
          quote2 TEXT
        )''');

        await db.execute('''
        CREATE TABLE experience (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER,
          title TEXT,
          years INTEGER,
          FOREIGN KEY (user_id) REFERENCES user_info (id) ON DELETE CASCADE
        )''');

        await db.execute('''
        CREATE TABLE portfolio (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER,
          title TEXT,
          url TEXT,
          FOREIGN KEY (user_id) REFERENCES user_info (id) ON DELETE CASCADE
        )''');

        await db.insert('user_info', {
          'id': 1,
          'fullname': 'John Smith',
          'location': 'Portland, Oregon, USA',
          'language': '🇷🇺 Russian',
          'avatarPath': null,
          'availability': 'Full-time',
          'environment': 'Github, Mac OSX',
          'quote1': 'The only true wisdom is in knowing you know nothing...',
          'quote2':
              'There is only one good, knowledge, and one evil, ignorance.'
        });

        await db
            .insert('experience', {'user_id': 1, 'title': 'PHP', 'years': 8});
        await db
            .insert('experience', {'user_id': 1, 'title': 'Ruby', 'years': 1});

        final portfolioItems = {
          'Bootstrap 4 Material Design': 'https://pub.dev',
          'Modern JavaScript stack': 'https://google.com',
          'Datepicker for Twitter Bootstrap': 'https://youtube.com',
          'Fast and Reliable Bootstrap Widgets in Angular':
              'https://flutter.dev'
        };

        for (var entry in portfolioItems.entries) {
          await db.insert('portfolio', {
            'user_id': 1,
            'title': entry.key,
            'url': entry.value,
          });
        }
      },
    );
  }

  @override
  Future<UserInfoEntity> fetchUserInfo() async {
    final db = await database;
    final userResult =
        await db.query('user_info', where: 'id = ?', whereArgs: [1]);
    if (userResult.isEmpty) {
      throw Exception(Strings.errorFetchingData);
    }
    final userData = userResult.first;

    final experienceResult =
        await db.query('experience', where: 'user_id = ?', whereArgs: [1]);
    final experienceItems = experienceResult
        .map((e) => ExperienceItem(
              title: e['title'] as String,
              years: e['years'] as int,
            ))
        .toList();

    final portfolioResult =
        await db.query('portfolio', where: 'user_id = ?', whereArgs: [1]);
    final Map<String, String> portfolioItems = {
      for (var e in portfolioResult) e['title'] as String: e['url'] as String
    };

    return UserInfoEntity(
      fullname: userData['fullname'] as String,
      location: userData['location'] as String,
      language: userData['language'] as String,
      avatarPath: userData['avatarPath'] as String?,
      availability: userData['availability'] as String,
      environment: userData['environment'] as String,
      quote1: userData['quote1'] as String,
      quote2: userData['quote2'] as String,
      experienceEntity: ExperienceEntity(items: experienceItems),
      portfolioEntity: PortfolioEntity(urls: portfolioItems),
    );
  }

  @override
  Future<void> updateUserInfo(UserInfoEntity info) async {
    final db = await database;
    await db.insert(
      'user_info',
      {
        'id': 1,
        'fullname': info.fullname,
        'location': info.location,
        'avatarPath': info.avatarPath,
        'availability': info.availability,
        'language': info.language,
        'environment': info.environment,
        'quote1': info.quote1,
        'quote2': info.quote2,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.delete('experience', where: 'user_id = ?', whereArgs: [1]);
    await db.delete('portfolio', where: 'user_id = ?', whereArgs: [1]);

    for (var item in info.experienceEntity.items ?? []) {
      await db.insert(
        'experience',
        {
          'user_id': 1,
          'title': item.title,
          'years': item.years,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (var entry in (info.portfolioEntity.urls ?? {}).entries) {
      await db.insert(
        'portfolio',
        {
          'user_id': 1,
          'title': entry.key,
          'url': entry.value,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,

      );
    }
  }
}
