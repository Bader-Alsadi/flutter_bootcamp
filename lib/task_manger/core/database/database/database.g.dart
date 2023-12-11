// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  TaskUserDao? _taskUserInstance;

  TaskDao? _taskDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Task` (`id` INTEGER, `title` TEXT, `description` TEXT, `isEnd` INTEGER, `beging` TEXT, `end` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TaskUser` (`id` INTEGER, `user_id` INTEGER, `task_id` INTEGER, FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON UPDATE CASCADE ON DELETE CASCADE, FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`) ON UPDATE CASCADE ON DELETE CASCADE, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  TaskUserDao get taskUser {
    return _taskUserInstance ??= _$TaskUserDao(database, changeListener);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(database, 'User',
            (User item) => <String, Object?>{'id': item.id, 'name': item.name}),
        _userUpdateAdapter = UpdateAdapter(database, 'User', ['id'],
            (User item) => <String, Object?>{'id': item.id, 'name': item.name}),
        _userDeletionAdapter = DeletionAdapter(database, 'User', ['id'],
            (User item) => <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> getAllUser() async {
    return _queryAdapter.queryList('select * from user',
        mapper: (Map<String, Object?> row) =>
            User(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<User?> getAllUserbyUserid(int id) async {
    return _queryAdapter.query('select * from user where id=?1',
        mapper: (Map<String, Object?> row) =>
            User(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<User>> getAllUserbytaskId(int id) async {
    return _queryAdapter.queryList(
        'select * from user where id in (select user_id from TaskUser where task_id=?1)',
        mapper: (Map<String, Object?> row) => User(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<int> insertUser(User user) {
    return _userInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateUser(User user) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(User user) {
    return _userDeletionAdapter.deleteAndReturnChangedRows(user);
  }
}

class _$TaskUserDao extends TaskUserDao {
  _$TaskUserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskUserInsertionAdapter = InsertionAdapter(
            database,
            'TaskUser',
            (TaskUser item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.user_id,
                  'task_id': item.task_id
                }),
        _taskUserUpdateAdapter = UpdateAdapter(
            database,
            'TaskUser',
            ['id'],
            (TaskUser item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.user_id,
                  'task_id': item.task_id
                }),
        _taskUserDeletionAdapter = DeletionAdapter(
            database,
            'TaskUser',
            ['id'],
            (TaskUser item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.user_id,
                  'task_id': item.task_id
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskUser> _taskUserInsertionAdapter;

  final UpdateAdapter<TaskUser> _taskUserUpdateAdapter;

  final DeletionAdapter<TaskUser> _taskUserDeletionAdapter;

  @override
  Future<List<TaskUser>> getAllTaskUser(int id) async {
    return _queryAdapter.queryList('select * from TaskUser where task_id =?1',
        mapper: (Map<String, Object?> row) => TaskUser(
            id: row['id'] as int?,
            task_id: row['task_id'] as int?,
            user_id: row['user_id'] as int?),
        arguments: [id]);
  }

  @override
  Future<int> insertTaskUser(TaskUser taskUser) {
    return _taskUserInsertionAdapter.insertAndReturnId(
        taskUser, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTaskUser(TaskUser taskUser) {
    return _taskUserUpdateAdapter.updateAndReturnChangedRows(
        taskUser, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTaskUser(TaskUser taskUser) {
    return _taskUserDeletionAdapter.deleteAndReturnChangedRows(taskUser);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'Task',
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'isEnd': item.isEnd == null ? null : (item.isEnd! ? 1 : 0),
                  'beging': item.beging,
                  'end': item.end
                }),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'Task',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'isEnd': item.isEnd == null ? null : (item.isEnd! ? 1 : 0),
                  'beging': item.beging,
                  'end': item.end
                }),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'Task',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'isEnd': item.isEnd == null ? null : (item.isEnd! ? 1 : 0),
                  'beging': item.beging,
                  'end': item.end
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Future<List<Task>> getAllTask() async {
    return _queryAdapter.queryList('select * from Task',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            beging: row['beging'] as String?,
            end: row['end'] as String?,
            isEnd: row['isEnd'] == null ? null : (row['isEnd'] as int) != 0));
  }

  @override
  Future<List<Task>> getAllTaskbyTaskId(int id) async {
    return _queryAdapter.queryList('select * from Task where id=?1',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            beging: row['beging'] as String?,
            end: row['end'] as String?,
            isEnd: row['isEnd'] == null ? null : (row['isEnd'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<int> insertTask(Task Task) {
    return _taskInsertionAdapter.insertAndReturnId(
        Task, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTask(Task Task) {
    return _taskUpdateAdapter.updateAndReturnChangedRows(
        Task, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTask(Task Task) {
    return _taskDeletionAdapter.deleteAndReturnChangedRows(Task);
  }
}
