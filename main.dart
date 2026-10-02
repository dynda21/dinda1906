String productName = 'Pecel Lele';
int stock = 15;
double price = 18000.0;
bool isAvailable = true;
// Nilai dapat diubah
stock = 20;
// stock = 'dua puluh'; // Error! Tipe data tidak boleh berubah.
String itemName = 'Pecel Ayam'; //
// itemName = null // Ditolak oleh kompiler!
String? CustomerNote; // Boleh berisi string atau null
customerNote = 'Kurang crispy'; //
customerNote = 'null; // Sah
String notToPrint = customerNote ?? 'Tidak ada catatan khusus'; //
// Berisiko cash jika customerNote ternyata null: //
print (customerNote!. toUpperCase()); //
final String transactionId = 'TRX-9901';
final DateTime transactionTime = DateTime.now();
// Menuliskan tipe data setelah 'final' bersifat opsional tapi sangat
disarankan:
// final transactionId = 'TRX-9901'; // Valid, tapi implisit 
const double taxRate = 0.11;
const String appCurrency = 'IDR';
late String receiptNumber;
void generateReceipt() {
 receiptNumber = 'REC-${DateTime.now().millisecondsSinceEpoch}';
 print(receiptNumber); // Aman dibaca setelah diinisialisasi}
