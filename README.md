# 🛒 DWShop - Advanced Illegal Market Script
### 🌟 MTA:SA Roleplay Sunucuları İçin Modern ve Şık İllegal Market Sistemi

**DWShop**, sunucunuza premium bir hava katacak, tamamen özel **DX arayüzü** ile tasarlanmış, optimize edilmiş ve güvenli bir illegal market scriptidir. Oyuncularınızın illegal ihtiyaçlarını karşılamaları için en şık ve pratik yol!

![Preview](https://via.placeholder.com/800x400?text=DWShop+Preview)

---

## 🔥 Özellikler

- **💎 Modern DX Arayüz:** Sıradan GUI'ler yerine, performansı etkilemeyen şık ve tamamen özelleştirilebilir DX çizim panele sahiptir.
- **🛍️ Geniş Ürün Yelpazesi:** Zırhlar, sağlık eşyaları, maskeler ve silahlar gibi illegal ürünlerin satışına hazır.
- **🖱️ Kolay Etkileşim:** Oyuncular NPC'ye sağ tıklayarak marketi anında açabilir.
- **🛡️ Güvenli İşlem:** Sunucu taraflı (server-side) kontroller ile para ve eşya manipülasyonuna karşı tam koruma.
- **🔫 Silah Entegrasyonu:** Özel silah seri numarası sistemi ile entegre çalışır (Owl/Valhalla altyapıları ile uyumlu).
- **💸 Dinamik Ekonomi:** Fiyatlar ve eşyalar kolayca yapılandırılabilir.
- **📦 Stok Görselleri:** Her ürün için özel ikon desteği.

---

## 🛠️ Kurulum

1. **İndirin:** Bu projeyi indirin ve `larqe-dwshop` klasörünü sunucunuzun `mods/deathmatch/resources` dizinine atın.
2. **Yükleyin:** Sunucu konsolundan veya `F8` panelinden scripti başlatın:
   ```bash
   refresh
   start larqe-dwshop
   ```
3. **Keyfini Çıkarın:** Marketi test etmek için script içerisindeki koordinatlara gidin!

---

## ⚙️ Yapılandırma

Market içeriğini ve fiyatları değiştirmek çok kolay!
`script/larqe.lua` dosyasını açın ve `items` tablosunu düzenleyin:

```lua
local items = {
    -- { id = EşyaID, cost = Fiyat, img = "ResimYolu", extra = Opsiyonel },
    { id = 598, cost = 5000, img = "img/agirzirh.png",      extra = nil },
    { id = 115, cost = 100,  img = "img/knife.png",         extra = 4 }, -- Silah örneği
}
```

NPC konumunu değiştirmek için yine `script/larqe.lua` içerisindeki şu satırı düzenleyebilirsiniz:
```lua
local ped = createPed(34, -381.8994, -1438.7363, 25.7266, 263)
```

---

## 📋 Gereksinimler

Bu script, `global` resource'unun (`exports.global:takeMoney`, `exports.global:giveItem`) bulunduğu roleplay altyapıları (OwlGaming, Valhalla vb.) için hazırlanmıştır. Farklı bir altyapı kullanıyorsanız `events.lua` içerisindeki export kısımlarını kendi sisteminize göre düzenlemeniz gerekebilir.

---

## 📞 İletişim & Destek

Herhangi bir sorun yaşarsanız veya geliştirme önerileriniz varsa iletişime geçmekten çekinmeyin!

**Geliştirici:** Larqe  
**Versiyon:** 1.0.0

---
*Bu script Larqe tarafından özenle kodlanmıştır.*
