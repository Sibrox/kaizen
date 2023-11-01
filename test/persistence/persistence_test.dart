import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/models/reward/reward.dart';
import 'package:kaizen/models/shop/bloc/shop_bloc.dart';
import 'package:kaizen/models/shop/shop.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:kaizen/utilities/persistence/persistence.dart';

const String kApplicationDocumentsPath = 'applicationDocumentsPath';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Test Persistence", () {
    setUp(() async {
      PathProviderPlatform.instance = FakePathProviderPlatform();
      LocalDataManager.instance = FakeLocalDataManager();
    });

    test('Load Data with empty file', () async {
      await PersistenceManager().loadData();
      expect(PersistenceManager().data, {});
    });

    test('Save bloc data', () {
      final bloc = ShopBloc(
          initialState: const Shop(
              rewards: [Reward(title: "Test", price: 10, rating: 1)]));

      PersistenceManager().saveData("shop", bloc.state.toJson());
      expect(PersistenceManager().data["shop"], bloc.state.toJson());
    });

    test('Read data in Bloc', () async {
      final bloc = ShopBloc(
          initialState: const Shop(
              rewards: [Reward(title: "Test", price: 10, rating: 1)]));

      PersistenceManager().saveData("shop", bloc.state.toJson());
      var loadedShop =
          Shop.fromJson(await PersistenceManager().getDataBloc("shop"));
      expect(bloc.state == loadedShop, true);
    });
  });
}

class FakeLocalDataManager extends Fake implements LocalDataManager {
  @override
  Future<bool> write(String data) async {
    return true;
  }

  @override
  Future<String> read() async {
    return "{}";
  }
}

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return null;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return null;
  }

  @override
  Future<String?> getLibraryPath() async {
    return null;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return kApplicationDocumentsPath;
  }

  @override
  Future<String?> getExternalStoragePath() async {
    return null;
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    return <String>[];
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    return <String>[];
  }

  @override
  Future<String?> getDownloadsPath() async {
    return null;
  }
}

class AllNullFakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return null;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return null;
  }

  @override
  Future<String?> getLibraryPath() async {
    return null;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return null;
  }

  @override
  Future<String?> getExternalStoragePath() async {
    return null;
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    return null;
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    return null;
  }

  @override
  Future<String?> getDownloadsPath() async {
    return null;
  }
}
