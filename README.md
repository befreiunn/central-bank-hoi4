# central-bank-hoi4

CBM_Economy_Overhaul (Central Bank & Ministry) için HOI4 mod iskeleti.

## Eklenen MVP içerik

- Aylık makro güncelleme döngüsü (`on_actions` + hidden monthly event).
- Ülke bazlı başlangıç profilleri (majörler + örnek bölgesel güçler için farklı başlangıç).
- Kriz event spam'ini azaltmak için 90 günlük kriz cooldown bayrakları.
- Basit AI politika tepkisi (yüksek riskte sıkılaşma, düşük riskli daralmada destek).
- Scripted effect omurgası:
  - GSYH güncellemesi
  - Borç dinamiği
  - Enflasyon sonuçları
  - Harcama kalitesi / kapasite / kayıt dışılık kanalı
  - Savaş stresi kanalı
  - Kompozit kriz riski güncellemesi
  - Riske bağlı national spirit uygulaması
- Scripted trigger seti (yüksek enflasyon, kritik borç, FX krizi vb.).
- Merkez bankası ve maliye kararları için başlangıç decision seti.
- Kriz yönetimi ve reform paketleri için ek decision seti.
- Merkez bankası rejimleri (bağımsız/siyasi/peg/savaş finansmanı) + maliye kompozisyon kararları.
- Ekonomi dashboard decision/event ekranı (dinamik makro breakdown metinleri ile).
- 90 günlük pulse içinde gerçek ülke sırası (`cbm_global_gdp_rank`) + majör odaklı global GDP cache değişkenleri.
- 4 kriz zinciri giriş eventi:
  - Borç
  - Enflasyon
  - Kur
  - Bankacılık
- İngilizce localization anahtarları.
- `tools/validate_cbm.sh` ile temel bütünlük doğrulaması.
- `docs/CBM_MVP_PLAN.md` içinde mimari ve sonraki faz planı.

## Dizinler

- `common/on_actions/`
- `common/scripted_effects/`
- `common/scripted_triggers/`
- `common/decisions/`
- `common/ideas/`
- `events/`
- `localisation/english/`
- `docs/`

## Hızlı doğrulama

```bash
./tools/validate_cbm.sh
```
