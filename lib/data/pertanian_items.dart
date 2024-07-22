class PertanianItem {
  final String imageAsset;
  final String title;
  final String description;
  final String manfaat;
  final String caraMenanam;
  final String hamaPenyakit;
  final String panenPascaPanen;

  PertanianItem({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.manfaat,
    required this.caraMenanam,
    required this.hamaPenyakit,
    required this.panenPascaPanen,
  });
}

// Daftar Tanaman (List)
final List<PertanianItem> daftarTanaman = [
  PertanianItem(
    imageAsset: 'lib/assets/images/buah.jpg',
    title: 'Buah',
    description: 'Buah-buahan segar untuk kesehatan.',
    manfaat: 'Menjaga kesehatan tubuh.',
    caraMenanam: 'Tanam di tempat yang terkena sinar matahari langsung.',
    hamaPenyakit: 'Hama buah, penyakit jamur.',
    panenPascaPanen: 'Panen saat buah sudah matang, simpan di tempat sejuk.',
  ),
  PertanianItem(
    imageAsset: 'lib/assets/images/jagung.jpg',
    title: 'Jagung',
    description: 'Jagung adalah salah satu tanaman pangan penting.',
    manfaat: 'Sumber karbohidrat yang baik.',
    caraMenanam: 'Tanam di tanah yang gembur dan subur.',
    hamaPenyakit: 'Ulat, hama kutu daun.',
    panenPascaPanen:
        'Panen saat biji sudah mengeras, jemur untuk mengeringkan.',
  ),
  PertanianItem(
    imageAsset: 'lib/assets/images/padi.jpg',
    title: 'Padi',
    description: 'Padi adalah tanaman utama penghasil beras.',
    manfaat: 'Sumber makanan pokok.',
    caraMenanam: 'Tanam di sawah dengan irigasi yang baik.',
    hamaPenyakit: 'Hama wereng, penyakit blast.',
    panenPascaPanen:
        'Panen saat bulir sudah menguning, jemur untuk mengeringkan.',
  ),
  PertanianItem(
    imageAsset: 'lib/assets/images/sayuran.jpg',
    title: 'Sayuran',
    description: 'Sayuran hijau untuk kebutuhan serat.',
    manfaat: 'Menjaga kesehatan pencernaan.',
    caraMenanam: 'Tanam di tanah yang subur, siram secara teratur.',
    hamaPenyakit: 'Hama ulat, penyakit layu bakteri.',
    panenPascaPanen: 'Panen saat sayuran sudah segar, simpan di tempat sejuk.',
  ),
];
