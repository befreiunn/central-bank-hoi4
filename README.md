# central-bank-hoi4

CBM_Economy_Overhaul (Central Bank & Ministry) için HOI4 mod iskeleti.

## Eklenen MVP içerik

- Aylık makro güncelleme döngüsü (`on_actions` + hidden monthly event).
- Kriz event spam'ini azaltmak için 90 günlük kriz cooldown bayrakları.
- Basit AI politika tepkisi (yüksek riskte sıkılaşma, düşük riskli daralmada destek).
- Scripted effect omurgası:
  - GSYH güncellemesi
  - Borç dinamiği
  - Enflasyon sonuçları
  - Kompozit kriz riski güncellemesi
- Scripted trigger seti (yüksek enflasyon, kritik borç, FX krizi vb.).
- Merkez bankası ve maliye kararları için başlangıç decision seti.
- 4 kriz zinciri giriş eventi:
  - Borç
  - Enflasyon
  - Kur
  - Bankacılık
- İngilizce localization anahtarları.
- `docs/CBM_MVP_PLAN.md` içinde mimari ve sonraki faz planı.

## Dizinler

- `common/on_actions/`
- `common/scripted_effects/`
- `common/scripted_triggers/`
- `common/decisions/`
- `events/`
- `localisation/english/`
- `docs/`
