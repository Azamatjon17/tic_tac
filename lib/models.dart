import 'dart:math';

makeRandomTrue(List<bool> list) {
  if (list.isNotEmpty) {
    bool isAnyTrue = list.contains(false); // Ro'yxatda true qiymati mavjudligini tekshirish
    if (isAnyTrue) {
      int randomIndex;
      do {
        randomIndex = Random().nextInt(list.length); // Tasodifiy indeks tanlash
      } while (list[randomIndex] == false); // Eski indeksdagi qiymat false bo'lsa qayta indeks tanlash
      list[randomIndex] = true;
      return randomIndex;
      // Tanlangan indeksdagi qiymatni false qilish
    } else {
      print("Ro'yxatda 'true' qiymati yo'q!"); // Ro'yxatda 'true' qiymati yo'qligi xabari
    }
  } else {
    print("Ro'yxat bo'sh!"); // Bo'sh ro'yxat xabari
  }
}
