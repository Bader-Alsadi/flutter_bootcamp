// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

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

  AreaDao? _areaDaoInstance;

  CategoryDao? _categoryDaoInstance;

  InquiryDao? _inquiryDaoInstance;

  LocationDao? _locationDaoInstance;

  RatingDao? _ratingDaoInstance;

  ServiceDao? _serviceDaoInstance;

  ServiceProviderDao? _serviceProviderDaoInstance;

  UserDao? _userDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Area` (`id` INTEGER, `area_name` TEXT NOT NULL, `create_at` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Category` (`id` INTEGER, `category_name` TEXT NOT NULL, `create_at` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Inquiry` (`id` INTEGER, `Inquiry_name` TEXT NOT NULL, `replay` TEXT, `is_read` INTEGER NOT NULL, `user_id` INTEGER NOT NULL, `Service_provider_id` INTEGER NOT NULL, `create_at` TEXT, FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, FOREIGN KEY (`Service_provider_id`) REFERENCES `ServiceProvider` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Location` (`id` INTEGER, `descripction` TEXT NOT NULL, `user_id` INTEGER NOT NULL, `create_at` TEXT, FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Rating` (`id` INTEGER, `rate` INTEGER NOT NULL, `user_id` INTEGER NOT NULL, `Service_id` INTEGER NOT NULL, `create_at` TEXT, FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`Service_id`) REFERENCES `Service` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Service` (`id` INTEGER, `Service_name` TEXT NOT NULL, `description` TEXT NOT NULL, `Service_provider_id` INTEGER NOT NULL, `create_at` TEXT, FOREIGN KEY (`Service_provider_id`) REFERENCES `ServiceProvider` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ServiceProvider` (`id` INTEGER, `Category_id` INTEGER NOT NULL, `detilas` TEXT, `create_at` TEXT, `user_id` INTEGER NOT NULL, FOREIGN KEY (`Category_id`) REFERENCES `Category` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON UPDATE CASCADE ON DELETE SET NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER, `user_name` TEXT NOT NULL, `cell_phone` TEXT NOT NULL, `email` TEXT, `user_image` BLOB, `area_id` INTEGER NOT NULL, `create_at` TEXT, FOREIGN KEY (`area_id`) REFERENCES `Area` (`id`) ON UPDATE NO ACTION ON DELETE SET NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AreaDao get areaDao {
    return _areaDaoInstance ??= _$AreaDao(database, changeListener);
  }

  @override
  CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$CategoryDao(database, changeListener);
  }

  @override
  InquiryDao get inquiryDao {
    return _inquiryDaoInstance ??= _$InquiryDao(database, changeListener);
  }

  @override
  LocationDao get locationDao {
    return _locationDaoInstance ??= _$LocationDao(database, changeListener);
  }

  @override
  RatingDao get ratingDao {
    return _ratingDaoInstance ??= _$RatingDao(database, changeListener);
  }

  @override
  ServiceDao get serviceDao {
    return _serviceDaoInstance ??= _$ServiceDao(database, changeListener);
  }

  @override
  ServiceProviderDao get serviceProviderDao {
    return _serviceProviderDaoInstance ??=
        _$ServiceProviderDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$AreaDao extends AreaDao {
  _$AreaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _areaInsertionAdapter = InsertionAdapter(
            database,
            'Area',
            (Area item) => <String, Object?>{
                  'id': item.id,
                  'area_name': item.area_name,
                  'create_at': item.create_at
                }),
        _areaUpdateAdapter = UpdateAdapter(
            database,
            'Area',
            ['id'],
            (Area item) => <String, Object?>{
                  'id': item.id,
                  'area_name': item.area_name,
                  'create_at': item.create_at
                }),
        _areaDeletionAdapter = DeletionAdapter(
            database,
            'Area',
            ['id'],
            (Area item) => <String, Object?>{
                  'id': item.id,
                  'area_name': item.area_name,
                  'create_at': item.create_at
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Area> _areaInsertionAdapter;

  final UpdateAdapter<Area> _areaUpdateAdapter;

  final DeletionAdapter<Area> _areaDeletionAdapter;

  @override
  Future<List<Area>> getAllArea() async {
    return _queryAdapter.queryList('select * from Area',
        mapper: (Map<String, Object?> row) =>
            Area(id: row['id'] as int?, area_name: row['area_name'] as String));
  }

  @override
  Future<Area?> getAreabyid(int id) async {
    return _queryAdapter.query('select * from Area where id = ?1',
        mapper: (Map<String, Object?> row) =>
            Area(id: row['id'] as int?, area_name: row['area_name'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Area>> getAreaByname(String keyword) async {
    return _queryAdapter.queryList('select * from Area where area_name =?1',
        mapper: (Map<String, Object?> row) =>
            Area(id: row['id'] as int?, area_name: row['area_name'] as String),
        arguments: [keyword]);
  }

  @override
  Future<int?> deleteAreaByid(int id) async {
    return _queryAdapter.query('delete from Area where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertArea(Area area) {
    return _areaInsertionAdapter.insertAndReturnId(
        area, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateArea(Area area) {
    return _areaUpdateAdapter.updateAndReturnChangedRows(
        area, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteArea(Area area) {
    return _areaDeletionAdapter.deleteAndReturnChangedRows(area);
  }
}

class _$CategoryDao extends CategoryDao {
  _$CategoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _categoryInsertionAdapter = InsertionAdapter(
            database,
            'Category',
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'category_name': item.category_name,
                  'create_at': item.create_at
                }),
        _categoryUpdateAdapter = UpdateAdapter(
            database,
            'Category',
            ['id'],
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'category_name': item.category_name,
                  'create_at': item.create_at
                }),
        _categoryDeletionAdapter = DeletionAdapter(
            database,
            'Category',
            ['id'],
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'category_name': item.category_name,
                  'create_at': item.create_at
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Category> _categoryInsertionAdapter;

  final UpdateAdapter<Category> _categoryUpdateAdapter;

  final DeletionAdapter<Category> _categoryDeletionAdapter;

  @override
  Future<List<Category>> getAllcategory() async {
    return _queryAdapter.queryList('select * from Category',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as int?,
            category_name: row['category_name'] as String));
  }

  @override
  Future<Category?> getcategorybyid(int id) async {
    return _queryAdapter.query('select * from Category where id = ?1',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as int?,
            category_name: row['category_name'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Category>> getcategoryByname(String keyword) async {
    return _queryAdapter.queryList(
        'select * from Category where category_name =?1',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as int?,
            category_name: row['category_name'] as String),
        arguments: [keyword]);
  }

  @override
  Future<int?> deletecategoryByid(int id) async {
    return _queryAdapter.query('delete from Category where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertcategory(Category category) {
    return _categoryInsertionAdapter.insertAndReturnId(
        category, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatecategory(Category category) {
    return _categoryUpdateAdapter.updateAndReturnChangedRows(
        category, OnConflictStrategy.abort);
  }

  @override
  Future<int> deletecategory(Category category) {
    return _categoryDeletionAdapter.deleteAndReturnChangedRows(category);
  }
}

class _$InquiryDao extends InquiryDao {
  _$InquiryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _inquiryInsertionAdapter = InsertionAdapter(
            database,
            'Inquiry',
            (Inquiry item) => <String, Object?>{
                  'id': item.id,
                  'Inquiry_name': item.Inquiry_name,
                  'replay': item.replay,
                  'is_read': item.is_read ? 1 : 0,
                  'user_id': item.user_id,
                  'Service_provider_id': item.Service_provider_id,
                  'create_at': item.create_at
                }),
        _inquiryUpdateAdapter = UpdateAdapter(
            database,
            'Inquiry',
            ['id'],
            (Inquiry item) => <String, Object?>{
                  'id': item.id,
                  'Inquiry_name': item.Inquiry_name,
                  'replay': item.replay,
                  'is_read': item.is_read ? 1 : 0,
                  'user_id': item.user_id,
                  'Service_provider_id': item.Service_provider_id,
                  'create_at': item.create_at
                }),
        _inquiryDeletionAdapter = DeletionAdapter(
            database,
            'Inquiry',
            ['id'],
            (Inquiry item) => <String, Object?>{
                  'id': item.id,
                  'Inquiry_name': item.Inquiry_name,
                  'replay': item.replay,
                  'is_read': item.is_read ? 1 : 0,
                  'user_id': item.user_id,
                  'Service_provider_id': item.Service_provider_id,
                  'create_at': item.create_at
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Inquiry> _inquiryInsertionAdapter;

  final UpdateAdapter<Inquiry> _inquiryUpdateAdapter;

  final DeletionAdapter<Inquiry> _inquiryDeletionAdapter;

  @override
  Future<List<Inquiry>> getAllInquiry() async {
    return _queryAdapter.queryList('select * from Inquiry',
        mapper: (Map<String, Object?> row) => Inquiry(
            id: row['id'] as int?,
            replay: row['replay'] as String?,
            Inquiry_name: row['Inquiry_name'] as String,
            is_read: (row['is_read'] as int) != 0,
            Service_provider_id: row['Service_provider_id'] as int,
            user_id: row['user_id'] as int));
  }

  @override
  Future<Inquiry?> getInquirybyid(int id) async {
    return _queryAdapter.query(
        'select * from Inquiry where Service_provider_id = ?1',
        mapper: (Map<String, Object?> row) => Inquiry(
            id: row['id'] as int?,
            replay: row['replay'] as String?,
            Inquiry_name: row['Inquiry_name'] as String,
            is_read: (row['is_read'] as int) != 0,
            Service_provider_id: row['Service_provider_id'] as int,
            user_id: row['user_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Inquiry>> getInquiryByname(String keyword) async {
    return _queryAdapter.queryList(
        'select * from Inquiry where Inquiry_name =?1',
        mapper: (Map<String, Object?> row) => Inquiry(
            id: row['id'] as int?,
            replay: row['replay'] as String?,
            Inquiry_name: row['Inquiry_name'] as String,
            is_read: (row['is_read'] as int) != 0,
            Service_provider_id: row['Service_provider_id'] as int,
            user_id: row['user_id'] as int),
        arguments: [keyword]);
  }

  @override
  Future<int?> deleteInquiryByid(int id) async {
    return _queryAdapter.query('delete from Inquiry where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertInquiry(Inquiry inquiry) {
    return _inquiryInsertionAdapter.insertAndReturnId(
        inquiry, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateInquiry(Inquiry inquiry) {
    return _inquiryUpdateAdapter.updateAndReturnChangedRows(
        inquiry, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteInquiry(Inquiry inquiry) {
    return _inquiryDeletionAdapter.deleteAndReturnChangedRows(inquiry);
  }
}

class _$LocationDao extends LocationDao {
  _$LocationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _locationInsertionAdapter = InsertionAdapter(
            database,
            'Location',
            (Location item) => <String, Object?>{
                  'id': item.id,
                  'descripction': item.descripction,
                  'user_id': item.user_id,
                  'create_at': item.create_at
                }),
        _locationUpdateAdapter = UpdateAdapter(
            database,
            'Location',
            ['id'],
            (Location item) => <String, Object?>{
                  'id': item.id,
                  'descripction': item.descripction,
                  'user_id': item.user_id,
                  'create_at': item.create_at
                }),
        _locationDeletionAdapter = DeletionAdapter(
            database,
            'Location',
            ['id'],
            (Location item) => <String, Object?>{
                  'id': item.id,
                  'descripction': item.descripction,
                  'user_id': item.user_id,
                  'create_at': item.create_at
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Location> _locationInsertionAdapter;

  final UpdateAdapter<Location> _locationUpdateAdapter;

  final DeletionAdapter<Location> _locationDeletionAdapter;

  @override
  Future<List<Location>> getAllLocation() async {
    return _queryAdapter.queryList('select * from Location',
        mapper: (Map<String, Object?> row) => Location(
            id: row['id'] as int?,
            descripction: row['descripction'] as String,
            user_id: row['user_id'] as int));
  }

  @override
  Future<Location?> getLocationbyid(int id) async {
    return _queryAdapter.query('select * from Location where user_id = ?1',
        mapper: (Map<String, Object?> row) => Location(
            id: row['id'] as int?,
            descripction: row['descripction'] as String,
            user_id: row['user_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Location>> getLocationByname(String keyword) async {
    return _queryAdapter.queryList(
        'select * from Location where Location_name =?1',
        mapper: (Map<String, Object?> row) => Location(
            id: row['id'] as int?,
            descripction: row['descripction'] as String,
            user_id: row['user_id'] as int),
        arguments: [keyword]);
  }

  @override
  Future<int?> deleteLocationByid(int id) async {
    return _queryAdapter.query('delete from Location where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertLocation(Location location) {
    return _locationInsertionAdapter.insertAndReturnId(
        location, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateLocation(Location location) {
    return _locationUpdateAdapter.updateAndReturnChangedRows(
        location, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteLocation(Location location) {
    return _locationDeletionAdapter.deleteAndReturnChangedRows(location);
  }
}

class _$RatingDao extends RatingDao {
  _$RatingDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _ratingInsertionAdapter = InsertionAdapter(
            database,
            'Rating',
            (Rating item) => <String, Object?>{
                  'id': item.id,
                  'rate': item.rate,
                  'user_id': item.user_id,
                  'Service_id': item.Service_id,
                  'create_at': item.create_at
                }),
        _ratingUpdateAdapter = UpdateAdapter(
            database,
            'Rating',
            ['id'],
            (Rating item) => <String, Object?>{
                  'id': item.id,
                  'rate': item.rate,
                  'user_id': item.user_id,
                  'Service_id': item.Service_id,
                  'create_at': item.create_at
                }),
        _ratingDeletionAdapter = DeletionAdapter(
            database,
            'Rating',
            ['id'],
            (Rating item) => <String, Object?>{
                  'id': item.id,
                  'rate': item.rate,
                  'user_id': item.user_id,
                  'Service_id': item.Service_id,
                  'create_at': item.create_at
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Rating> _ratingInsertionAdapter;

  final UpdateAdapter<Rating> _ratingUpdateAdapter;

  final DeletionAdapter<Rating> _ratingDeletionAdapter;

  @override
  Future<List<Rating>> getAllRating() async {
    return _queryAdapter.queryList('select * from Rating',
        mapper: (Map<String, Object?> row) => Rating(
            id: row['id'] as int?,
            rate: row['rate'] as int,
            Service_id: row['Service_id'] as int,
            user_id: row['user_id'] as int));
  }

  @override
  Future<Rating?> getRatingbyid(int id) async {
    return _queryAdapter.query('select * from Rating where Service_id = ?1',
        mapper: (Map<String, Object?> row) => Rating(
            id: row['id'] as int?,
            rate: row['rate'] as int,
            Service_id: row['Service_id'] as int,
            user_id: row['user_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Rating>> getRatingByname(String keyword) async {
    return _queryAdapter.queryList('select * from Rating where Rating_name =?1',
        mapper: (Map<String, Object?> row) => Rating(
            id: row['id'] as int?,
            rate: row['rate'] as int,
            Service_id: row['Service_id'] as int,
            user_id: row['user_id'] as int),
        arguments: [keyword]);
  }

  @override
  Future<int?> deleteRatingByid(int id) async {
    return _queryAdapter.query('delete from Rating where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertRating(Rating rating) {
    return _ratingInsertionAdapter.insertAndReturnId(
        rating, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateRating(Rating rating) {
    return _ratingUpdateAdapter.updateAndReturnChangedRows(
        rating, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteRating(Rating rating) {
    return _ratingDeletionAdapter.deleteAndReturnChangedRows(rating);
  }
}

class _$ServiceDao extends ServiceDao {
  _$ServiceDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _serviceInsertionAdapter = InsertionAdapter(
            database,
            'Service',
            (Service item) => <String, Object?>{
                  'id': item.id,
                  'Service_name': item.Service_name,
                  'description': item.description,
                  'Service_provider_id': item.Service_provider_id,
                  'create_at': item.create_at
                }),
        _serviceUpdateAdapter = UpdateAdapter(
            database,
            'Service',
            ['id'],
            (Service item) => <String, Object?>{
                  'id': item.id,
                  'Service_name': item.Service_name,
                  'description': item.description,
                  'Service_provider_id': item.Service_provider_id,
                  'create_at': item.create_at
                }),
        _serviceDeletionAdapter = DeletionAdapter(
            database,
            'Service',
            ['id'],
            (Service item) => <String, Object?>{
                  'id': item.id,
                  'Service_name': item.Service_name,
                  'description': item.description,
                  'Service_provider_id': item.Service_provider_id,
                  'create_at': item.create_at
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Service> _serviceInsertionAdapter;

  final UpdateAdapter<Service> _serviceUpdateAdapter;

  final DeletionAdapter<Service> _serviceDeletionAdapter;

  @override
  Future<List<Service>> getAllService() async {
    return _queryAdapter.queryList('select * from Service',
        mapper: (Map<String, Object?> row) => Service(
            id: row['id'] as int?,
            Service_name: row['Service_name'] as String,
            description: row['description'] as String,
            Service_provider_id: row['Service_provider_id'] as int));
  }

  @override
  Future<Service?> getServicebyid(int id) async {
    return _queryAdapter.query(
        'select * from Service where Service_provider_id = ?1',
        mapper: (Map<String, Object?> row) => Service(
            id: row['id'] as int?,
            Service_name: row['Service_name'] as String,
            description: row['description'] as String,
            Service_provider_id: row['Service_provider_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Service>> getServiceByname(String keyword) async {
    return _queryAdapter.queryList(
        'select * from Service where Service_name =?1',
        mapper: (Map<String, Object?> row) => Service(
            id: row['id'] as int?,
            Service_name: row['Service_name'] as String,
            description: row['description'] as String,
            Service_provider_id: row['Service_provider_id'] as int),
        arguments: [keyword]);
  }

  @override
  Future<int?> deleteServiceByid(int id) async {
    return _queryAdapter.query('delete from Service where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertService(Service service) {
    return _serviceInsertionAdapter.insertAndReturnId(
        service, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateService(Service service) {
    return _serviceUpdateAdapter.updateAndReturnChangedRows(
        service, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteService(Service service) {
    return _serviceDeletionAdapter.deleteAndReturnChangedRows(service);
  }
}

class _$ServiceProviderDao extends ServiceProviderDao {
  _$ServiceProviderDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _serviceProviderInsertionAdapter = InsertionAdapter(
            database,
            'ServiceProvider',
            (ServiceProvider item) => <String, Object?>{
                  'id': item.id,
                  'Category_id': item.Category_id,
                  'detilas': item.detilas,
                  'create_at': item.create_at,
                  'user_id': item.user_id
                }),
        _serviceProviderUpdateAdapter = UpdateAdapter(
            database,
            'ServiceProvider',
            ['id'],
            (ServiceProvider item) => <String, Object?>{
                  'id': item.id,
                  'Category_id': item.Category_id,
                  'detilas': item.detilas,
                  'create_at': item.create_at,
                  'user_id': item.user_id
                }),
        _serviceProviderDeletionAdapter = DeletionAdapter(
            database,
            'ServiceProvider',
            ['id'],
            (ServiceProvider item) => <String, Object?>{
                  'id': item.id,
                  'Category_id': item.Category_id,
                  'detilas': item.detilas,
                  'create_at': item.create_at,
                  'user_id': item.user_id
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ServiceProvider> _serviceProviderInsertionAdapter;

  final UpdateAdapter<ServiceProvider> _serviceProviderUpdateAdapter;

  final DeletionAdapter<ServiceProvider> _serviceProviderDeletionAdapter;

  @override
  Future<List<ServiceProvider>> getAllServiceProvider() async {
    return _queryAdapter.queryList(
        'select * from ServiceProvider SP join User U on SP.user_id = U.id join  Category C on SP.Category_id = C.id',
        mapper: (Map<String, Object?> row) => ServiceProvider(
            id: row['id'] as int?,
            user_id: row['user_id'] as int,
            Category_id: row['Category_id'] as int,
            detilas: row['detilas'] as String?));
  }

  @override
  Future<ServiceProvider?> getServiceProviderbyid(int id) async {
    return _queryAdapter.query(
        'select * from ServiceProvider SP join User U  onSP.user_id = U.id join  Category C on SP.Category_id = C.id  where id = ?1',
        mapper: (Map<String, Object?> row) => ServiceProvider(id: row['id'] as int?, user_id: row['user_id'] as int, Category_id: row['Category_id'] as int, detilas: row['detilas'] as String?),
        arguments: [id]);
  }

  @override
  Future<ServiceProvider?> getServiceProviderbyCateid(int id) async {
    return _queryAdapter.query(
        'select * from ServiceProvider SP join User U on SP.user_id = U.id join  Category C on SP.Category_id = C.id  where Category_id = ?1',
        mapper: (Map<String, Object?> row) => ServiceProvider(id: row['id'] as int?, user_id: row['user_id'] as int, Category_id: row['Category_id'] as int, detilas: row['detilas'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<ServiceProvider>> getServiceProviderByname(String keyword) async {
    return _queryAdapter.queryList(
        'select * from ServiceProvider where ServiceProvider_name =?1',
        mapper: (Map<String, Object?> row) => ServiceProvider(
            id: row['id'] as int?,
            user_id: row['user_id'] as int,
            Category_id: row['Category_id'] as int,
            detilas: row['detilas'] as String?),
        arguments: [keyword]);
  }

  @override
  Future<int?> deleteServiceProviderByid(int id) async {
    return _queryAdapter.query('delete from ServiceProvider where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertServiceProvider(ServiceProvider serviceProvider) {
    return _serviceProviderInsertionAdapter.insertAndReturnId(
        serviceProvider, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateServiceProvider(ServiceProvider serviceProvider) {
    return _serviceProviderUpdateAdapter.updateAndReturnChangedRows(
        serviceProvider, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteServiceProvider(ServiceProvider serviceProvider) {
    return _serviceProviderDeletionAdapter
        .deleteAndReturnChangedRows(serviceProvider);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'user_name': item.user_name,
                  'cell_phone': item.cell_phone,
                  'email': item.email,
                  'user_image': item.user_image,
                  'area_id': item.area_id,
                  'create_at': item.create_at
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'user_name': item.user_name,
                  'cell_phone': item.cell_phone,
                  'email': item.email,
                  'user_image': item.user_image,
                  'area_id': item.area_id,
                  'create_at': item.create_at
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'user_name': item.user_name,
                  'cell_phone': item.cell_phone,
                  'email': item.email,
                  'user_image': item.user_image,
                  'area_id': item.area_id,
                  'create_at': item.create_at
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> getAllUser() async {
    return _queryAdapter.queryList('select * from User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            user_name: row['user_name'] as String,
            cell_phone: row['cell_phone'] as String,
            email: row['email'] as String?,
            user_image: row['user_image'] as Uint8List?,
            area_id: row['area_id'] as int));
  }

  @override
  Future<User?> getUserbyid(int id) async {
    return _queryAdapter.query(
        'select * from User U join Location L on U.id=L.user_id  where U.id = ?1',
        mapper: (Map<String, Object?> row) => User(id: row['id'] as int?, user_name: row['user_name'] as String, cell_phone: row['cell_phone'] as String, email: row['email'] as String?, user_image: row['user_image'] as Uint8List?, area_id: row['area_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<User>> getUserByname(String keyword) async {
    return _queryAdapter.queryList('select * from User where cell_phone =?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            user_name: row['user_name'] as String,
            cell_phone: row['cell_phone'] as String,
            email: row['email'] as String?,
            user_image: row['user_image'] as Uint8List?,
            area_id: row['area_id'] as int),
        arguments: [keyword]);
  }

  @override
  Future<int?> deleteUserByid(int id) async {
    return _queryAdapter.query('delete from User where id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
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
