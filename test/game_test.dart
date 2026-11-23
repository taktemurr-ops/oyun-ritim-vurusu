import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ritim_vurusu/oyun_ritim_vurusu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ritimVurusuConfig.title.length, 33);
    expect(ritimVurusuConfig.tagline.length, 33);
    for (final s in ritimVurusuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ritimVurusuConfig.gameId, ritimVurusuId);
    expect(ritimVurusuRules.gameId, ritimVurusuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ritimVurusuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ritimVurusuId, optionalMechanics: ritimVurusuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ritimVurusuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
