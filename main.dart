// ---------- 3. const (Compile-Time Constant) ----------
const double taxRate = 0.11; // PPN 11%
const String appCurrency = 'IDR';
const int maxItemLimit = 50;

// ---------- late (Inisialisasi Tertunda) ----------
late String receiptNumber;

void generateReceipt() {
  receiptNumber = 'REC-${DateTime.now().millisecondsSinceEpoch}';
}

// ---------- Immutable Class ----------
class CurrencyFormatter {
  final String symbol;

  // const constructor: objek bisa dibuat saat compile-time
  const CurrencyFormatter({required this.symbol});

  String format(double value) => '$symbol ${value.toStringAsFixed(0)}';
}

// Fungsi ini membuat nilai catatan tidak bisa "ditebak" compiler,
// sehingga demo null safety berjalan seperti kondisi nyata.
String? ambilCatatan(bool adaCatatan) {
  return adaCatatan ? 'Kurang manis' : null;
}

void main() {
  print('=== KASIR KEDAI KOPI ===\n');

  // ---------- 1. Explicit Typing (tanpa var) ----------
  String productName = 'Kopi Susu';
  int stock = 15;
  double price = 18000.0;
  bool isAvailable = true;

  stock = 20; // nilai boleh berubah, tipe data harus tetap int
  // stock = 'dua puluh'; // Error! Tipe data tidak boleh berubah.

  print('Produk    : $productName');
  print('Stok      : $stock');
  print('Harga     : $price');
  print('Tersedia  : $isAvailable\n');

  // ---------- 2. Sound Null Safety ----------
  String itemName = 'Kopi Hitam'; // non-nullable (default)
  // itemName = null; // Ditolak oleh kompiler!

  String? customerNote; // nullable: boleh String atau null
  customerNote = ambilCatatan(true); // hasilnya 'Kurang manis'
  print('Catatan       : $customerNote');
  print('Catatan (UP)  : ${customerNote?.toUpperCase()}');

  customerNote = ambilCatatan(false); // hasilnya null (sah)
  // ?? -> nilai pengganti jika null
  String noteToPrint = customerNote ?? 'Tidak ada catatan khusus';
  // ?. -> hanya dijalankan kalau tidak null
  String? upperNote = customerNote?.toUpperCase();
  print('Setelah null  : $noteToPrint');
  print('Hasil ?.      : $upperNote');
  // customerNote!.toUpperCase(); // BAHAYA: crash karena customerNote = null
  print('Item          : $itemName\n');

  // ---------- 3. final (Runtime Constant) ----------
  final String transactionId = 'TRX-9901';
  final DateTime transactionTime = DateTime.now();
  // transactionId = 'TRX-0000'; // Error! final tidak bisa di-reassign.
  print('ID Transaksi  : $transactionId');
  print('Waktu         : $transactionTime\n');

  // ---------- 4. late ----------
  generateReceipt(); // wajib dipanggil sebelum receiptNumber dibaca
  print('No. Nota      : $receiptNumber\n');

  // ---------- 5. List ----------
  List<String> menu = ['Kopi Susu', 'Kopi Hitam', 'Teh Tarik'];
  List<double> harga = [18000, 12000, 15000];
  menu.add('Matcha Latte');
  harga.add(22000);

  print('--- Daftar Menu ---');
  for (int i = 0; i < menu.length; i++) {
    print('${i + 1}. ${menu[i]} - ${harga[i]}');
  }
  print('Menu pertama (index 0): ${menu[0]}\n');

  // ---------- 6. Set (data unik) ----------
  Set<String> kategori = {'Kopi', 'Non-Kopi'};
  kategori.add('Kopi'); // duplikat diabaikan, tetap tersimpan sekali
  kategori.add('Non-Kopi'); // sama, tidak bertambah
  print('Kategori unik : $kategori\n');

  // ---------- 7. Map (key & value) ----------
  Map<String, dynamic> pesanan = {
    'id': 10,
    'nama': 'Budi',
    'item': 'Kopi Susu',
    'qty': 2,
    'lunas': true,
  };
  print('Pesanan atas nama ${pesanan['nama']}: '
      '${pesanan['qty']}x ${pesanan['item']}\n');

  // ---------- 8. Hitung Total (final + const + num) ----------
  int quantity = pesanan['qty'] as int;
  final double subtotal = price * quantity;
  final double tax = subtotal * taxRate;
  final double total = subtotal + tax;

  num nilai = 10; // num bisa int
  nilai = 10.5; // ...maupun double
  print('num sekarang  : $nilai');

  const CurrencyFormatter formatter = CurrencyFormatter(symbol: 'Rp');
  print('\n--- Struk ($appCurrency) ---');
  print('Subtotal : ${formatter.format(subtotal)}');
  print('PPN 11%  : ${formatter.format(tax)}');
  print('Total    : ${formatter.format(total)}');
  print('Batas item per transaksi: $maxItemLimit\n');

  // ---------- 9. Object & type check ----------
  List<Object> semuaData = ['kopi susu', 20, true];
  for (Object data in semuaData) {
    if (data is String) {
      print('Object (String) -> ${data.toUpperCase()}');
    } else {
      print('Object bukan String -> $data');
    }
  }

  // ---------- 10. dynamic (pakai terbatas) ----------
  dynamic bebas = 'Budi';
  print('dynamic String  -> ${bebas.toUpperCase()}');
  bebas = 100;
  // bebas.toUpperCase(); // lolos compile, tapi runtime error!
  print('dynamic sekarang: $bebas (${bebas.runtimeType})');

  // ---------- 11. bool ----------
  bool sudahLogin = true;
  bool isLoading = false;
  print('\nSudah login: $sudahLogin | Loading: $isLoading');
  print(isLoading ? 'Memuat data...' : 'Data berhasil dimuat');
}