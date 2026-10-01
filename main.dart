const double pajak = 0.11;

late String nomorNota;

void main() {
  String nama = 'Kopi Susu';
  int harga = 18000;
  int jumlah = 2;

  final total = harga * jumlah;

  nomorNota = '001';

  String? catatan = 'Kurang manis';

  List<String> menu = ['Kopi Susu', 'Kopi Hitam'];

  Set<String> kategori = {'Kopi', 'Non-Kopi'};

  Map<String, dynamic> pesanan = {
    'nama': 'Budi',
    'jumlah': 2
  };

  print('=== KASIR KOPI ===');
  print('Nama: $nama');
  print('Harga: $harga');
  print('Jumlah: $jumlah');
  print('Total: $total');
  print('Pajak: ${total * pajak}');
  print('Nomor Nota: $nomorNota');
  print('Catatan: $catatan');
  print(menu);
  print(kategori);
  print(pesanan);
}
    
