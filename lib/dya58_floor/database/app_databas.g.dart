// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_databas.dart';

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

  StudentDao? _studentDaoInstance;

  DepartmentDao? _departmentDaoInstance;

  CourseDao? _courseDaoInstance;

  RegCourseDao? _regCourseDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
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
            'CREATE TABLE IF NOT EXISTS `StidentX` (`id` INTEGER, `full_name` TEXT, `phone_no` TEXT, `email` TEXT, `active` INTEGER, `depratmentId` INTEGER, FOREIGN KEY (`depratmentId`) REFERENCES `Department` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Department` (`id` INTEGER, `Deparment_name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Course` (`id` INTEGER, `name` TEXT, `hours` INTEGER, `depratmentId` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RegCourse` (`StudentId` INTEGER, `CourseId` INTEGER, FOREIGN KEY (`StudentId`) REFERENCES `StidentX` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`CourseId`) REFERENCES `Course` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`StudentId`, `CourseId`))');
        await database.execute(
            'CREATE UNIQUE INDEX `index_StidentX_phone_no_email` ON `StidentX` (`phone_no`, `email`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }

  @override
  DepartmentDao get departmentDao {
    return _departmentDaoInstance ??= _$DepartmentDao(database, changeListener);
  }

  @override
  CourseDao get courseDao {
    return _courseDaoInstance ??= _$CourseDao(database, changeListener);
  }

  @override
  RegCourseDao get regCourseDao {
    return _regCourseDaoInstance ??= _$RegCourseDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'StidentX',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'full_name': item.name,
                  'phone_no': item.phoneNo,
                  'email': item.email,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'depratmentId': item.depratmentId
                }),
        _studentUpdateAdapter = UpdateAdapter(
            database,
            'StidentX',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'full_name': item.name,
                  'phone_no': item.phoneNo,
                  'email': item.email,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'depratmentId': item.depratmentId
                }),
        _studentDeletionAdapter = DeletionAdapter(
            database,
            'StidentX',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'full_name': item.name,
                  'phone_no': item.phoneNo,
                  'email': item.email,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'depratmentId': item.depratmentId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  final UpdateAdapter<Student> _studentUpdateAdapter;

  final DeletionAdapter<Student> _studentDeletionAdapter;

  @override
  Future<List<Student>> getAllStudent() async {
    return _queryAdapter.queryList('select * from StidentX',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String?,
            phoneNo: row['phone_no'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            email: row['email'] as String?,
            depratmentId: row['depratmentId'] as int?));
  }

  @override
  Future<List<Student>> getAllStudentbyDebId() async {
    return _queryAdapter.queryList(
        'select * from StidentX join Department on StidentX.depratmentId=Department.id',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String?,
            phoneNo: row['phone_no'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            email: row['email'] as String?,
            depratmentId: row['depratmentId'] as int?));
  }

  @override
  Future<Student?> getOneStrudent(int id) async {
    return _queryAdapter.query(
        'select * from StidentX join Department on StidentX.depratmentId=Department.id where StidentX.id= ?1',
        mapper: (Map<String, Object?> row) => Student(id: row['id'] as int?, name: row['full_name'] as String?, phoneNo: row['phone_no'] as String?, active: row['active'] == null ? null : (row['active'] as int) != 0, email: row['email'] as String?, depratmentId: row['depratmentId'] as int?),
        arguments: [id]);
  }

  @override
  Future<List<Student>> getAllCoursebyStudentid(int CourseId) async {
    return _queryAdapter.queryList(
        'select * from StidentX where id in (select StudentId from RegCourse where CourseId= ?1)',
        mapper: (Map<String, Object?> row) => Student(id: row['id'] as int?, name: row['full_name'] as String?, phoneNo: row['phone_no'] as String?, active: row['active'] == null ? null : (row['active'] as int) != 0, email: row['email'] as String?, depratmentId: row['depratmentId'] as int?),
        arguments: [CourseId]);
  }

  @override
  Future<int?> deleteStudentById(int id) async {
    return _queryAdapter.query('delete from StidentX where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deleteAllStudent() async {
    return _queryAdapter.query('delete from StidentX',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Student>> searshByname(String word) async {
    return _queryAdapter.queryList(
        'select * from StidentX where full_name like ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['full_name'] as String?,
            phoneNo: row['phone_no'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            email: row['email'] as String?,
            depratmentId: row['depratmentId'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addStudent(Student s) {
    return _studentInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> AddStudentList(List<Student> s) {
    return _studentInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateStudent(Student s) {
    return _studentUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateStudentList(List<Student> s) {
    return _studentUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteStudent(Student s) {
    return _studentDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteStudentList(List<Student> s) {
    return _studentDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}

class _$DepartmentDao extends DepartmentDao {
  _$DepartmentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _departmentInsertionAdapter = InsertionAdapter(
            database,
            'Department',
            (Department item) =>
                <String, Object?>{'id': item.id, 'Deparment_name': item.name}),
        _departmentUpdateAdapter = UpdateAdapter(
            database,
            'Department',
            ['id'],
            (Department item) =>
                <String, Object?>{'id': item.id, 'Deparment_name': item.name}),
        _departmentDeletionAdapter = DeletionAdapter(
            database,
            'Department',
            ['id'],
            (Department item) =>
                <String, Object?>{'id': item.id, 'Deparment_name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Department> _departmentInsertionAdapter;

  final UpdateAdapter<Department> _departmentUpdateAdapter;

  final DeletionAdapter<Department> _departmentDeletionAdapter;

  @override
  Future<List<Department>> getAllDepartment() async {
    return _queryAdapter.queryList('select * from Department',
        mapper: (Map<String, Object?> row) => Department(
            id: row['id'] as int?, name: row['Deparment_name'] as String?));
  }

  @override
  Future<Department?> getOneStrudent(int id) async {
    return _queryAdapter.query('select * from Department where id= ?1',
        mapper: (Map<String, Object?> row) => Department(
            id: row['id'] as int?, name: row['Deparment_name'] as String?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteDepartmentById(int id) async {
    return _queryAdapter.query('delete from Department where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deleteAllDepartment() async {
    return _queryAdapter.query('delete from Department',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Department>> searshByname(String word) async {
    return _queryAdapter.queryList(
        'select * from Department where name like ?1',
        mapper: (Map<String, Object?> row) => Department(
            id: row['id'] as int?, name: row['Deparment_name'] as String?),
        arguments: [word]);
  }

  @override
  Future<int> addDepartment(Department s) {
    return _departmentInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> AddDepartmentList(List<Department> s) {
    return _departmentInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateDepartment(Department s) {
    return _departmentUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateDepartmentList(List<Department> s) {
    return _departmentUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteDepartment(Department s) {
    return _departmentDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteDepartmentList(List<Department> s) {
    return _departmentDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}

class _$CourseDao extends CourseDao {
  _$CourseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _courseInsertionAdapter = InsertionAdapter(
            database,
            'Course',
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'hours': item.hours,
                  'depratmentId': item.depratmentId
                }),
        _courseUpdateAdapter = UpdateAdapter(
            database,
            'Course',
            ['id'],
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'hours': item.hours,
                  'depratmentId': item.depratmentId
                }),
        _courseDeletionAdapter = DeletionAdapter(
            database,
            'Course',
            ['id'],
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'hours': item.hours,
                  'depratmentId': item.depratmentId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Course> _courseInsertionAdapter;

  final UpdateAdapter<Course> _courseUpdateAdapter;

  final DeletionAdapter<Course> _courseDeletionAdapter;

  @override
  Future<List<Course>> getAllCourse() async {
    return _queryAdapter.queryList('select * from Course',
        mapper: (Map<String, Object?> row) => Course(
            id: row['id'] as int?,
            name: row['name'] as String?,
            hours: row['hours'] as int?,
            depratmentId: row['depratmentId'] as int?));
  }

  @override
  Future<List<Course>> getAllCoursebyStudentid(int StudentId) async {
    return _queryAdapter.queryList(
        'select * from Course where id in (select CourseId from RegCourse where StudentId= ?1)',
        mapper: (Map<String, Object?> row) => Course(id: row['id'] as int?, name: row['name'] as String?, hours: row['hours'] as int?, depratmentId: row['depratmentId'] as int?),
        arguments: [StudentId]);
  }

  @override
  Future<List<Course>> getAllCoursebyDebID(
    int depratmentId,
    int StudentId,
  ) async {
    return _queryAdapter.queryList(
        'select * from Course where depratmentId=?1 and Course.id not in (select CourseId from RegCourse where StudentId= ?2)',
        mapper: (Map<String, Object?> row) => Course(id: row['id'] as int?, name: row['name'] as String?, hours: row['hours'] as int?, depratmentId: row['depratmentId'] as int?),
        arguments: [depratmentId, StudentId]);
  }

  @override
  Future<Course?> getOneStrudent(int id) async {
    return _queryAdapter.query('select * from Course where id= ?1',
        mapper: (Map<String, Object?> row) => Course(
            id: row['id'] as int?,
            name: row['name'] as String?,
            hours: row['hours'] as int?,
            depratmentId: row['depratmentId'] as int?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteCourseById(int id) async {
    return _queryAdapter.query('delete from Course where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deleteAllCourse() async {
    return _queryAdapter.query('delete from Course',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Course>> searshByname(String word) async {
    return _queryAdapter.queryList('select * from Course where name like ?1',
        mapper: (Map<String, Object?> row) => Course(
            id: row['id'] as int?,
            name: row['name'] as String?,
            hours: row['hours'] as int?,
            depratmentId: row['depratmentId'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addCourse(Course s) {
    return _courseInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> AddCourseList(List<Course> s) {
    return _courseInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateCourse(Course s) {
    return _courseUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateCourseList(List<Course> s) {
    return _courseUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteCourse(Course s) {
    return _courseDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteCourseList(List<Course> s) {
    return _courseDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}

class _$RegCourseDao extends RegCourseDao {
  _$RegCourseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _regCourseInsertionAdapter = InsertionAdapter(
            database,
            'RegCourse',
            (RegCourse item) => <String, Object?>{
                  'StudentId': item.StudentId,
                  'CourseId': item.CourseId
                }),
        _regCourseUpdateAdapter = UpdateAdapter(
            database,
            'RegCourse',
            ['StudentId', 'CourseId'],
            (RegCourse item) => <String, Object?>{
                  'StudentId': item.StudentId,
                  'CourseId': item.CourseId
                }),
        _regCourseDeletionAdapter = DeletionAdapter(
            database,
            'RegCourse',
            ['StudentId', 'CourseId'],
            (RegCourse item) => <String, Object?>{
                  'StudentId': item.StudentId,
                  'CourseId': item.CourseId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RegCourse> _regCourseInsertionAdapter;

  final UpdateAdapter<RegCourse> _regCourseUpdateAdapter;

  final DeletionAdapter<RegCourse> _regCourseDeletionAdapter;

  @override
  Future<List<RegCourse>> getAllRegCourse() async {
    return _queryAdapter.queryList('select * from RegCourse',
        mapper: (Map<String, Object?> row) => RegCourse(
            StudentId: row['StudentId'] as int?,
            CourseId: row['CourseId'] as int?));
  }

  @override
  Future<RegCourse?> getOneStrudent(int id) async {
    return _queryAdapter.query('select * from RegCourse where id= ?1',
        mapper: (Map<String, Object?> row) => RegCourse(
            StudentId: row['StudentId'] as int?,
            CourseId: row['CourseId'] as int?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteRegCourseById(int id) async {
    return _queryAdapter.query('delete from RegCourse where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deleteAllRegCourse() async {
    return _queryAdapter.query('delete from RegCourse',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RegCourse>> searshByname(String word) async {
    return _queryAdapter.queryList('select * from RegCourse where name like ?1',
        mapper: (Map<String, Object?> row) => RegCourse(
            StudentId: row['StudentId'] as int?,
            CourseId: row['CourseId'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addRegCourse(RegCourse s) {
    return _regCourseInsertionAdapter.insertAndReturnId(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> AddRegCourseList(List<RegCourse> s) {
    return _regCourseInsertionAdapter.insertListAndReturnIds(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateRegCourse(RegCourse s) {
    return _regCourseUpdateAdapter.updateAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateRegCourseList(List<RegCourse> s) {
    return _regCourseUpdateAdapter.updateListAndReturnChangedRows(
        s, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteRegCourse(RegCourse s) {
    return _regCourseDeletionAdapter.deleteAndReturnChangedRows(s);
  }

  @override
  Future<int> deleteRegCourseList(List<RegCourse> s) {
    return _regCourseDeletionAdapter.deleteListAndReturnChangedRows(s);
  }
}
