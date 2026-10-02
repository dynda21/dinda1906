void main() {
  String makanan = 'Kwetiaw Goreng';
  int harga = 17000;
  int jumlah = 2;
  bool pakaiTelur = true;

  int total = harga * jumlah;
  int biayaTambahan = 0;

  if (pakaiTelur) {
    biayaTambahan = 3000;
  }

  int totalBayar = total + biayaTambahan;

  print('=== PESANAN KWETIAW ===');
  print('Makanan       : $makanan');
  print('Harga         : Rp $harga');
  print('Jumlah        : $jumlah');
  print('Pakai telur   : $pakaiTelur');
  print('Total harga   : Rp $total');
  print('Biaya telur   : Rp $biayaTambahan');
  print('Total bayar   : Rp $totalBayar');
}
