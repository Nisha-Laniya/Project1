import '../resources/screen_barrel.dart';
import 'package:http/http.dart' as http;

class TransactionScreen extends StatefulWidget {
  static const id = 'tranactionscreen';
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  List<TransactionModel> transactionList = [];

  Future<List<TransactionModel>> getTransactionApi() async {
    final response = await http.get(Uri.parse(
        "https://house-stock-watcher-data.s3-us-west-2.amazonaws.com/data/all_transactions.json"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        transactionList.add(TransactionModel.fromJson(i));
      }
      return transactionList;
    } else {
      return transactionList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Screen'),
        backgroundColor: ColorManager.darkPink,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getTransactionApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color:ColorManager.darkPink,
                  ),
                );
              }
              else {
                return ListView.builder(
                    itemCount: transactionList.length,
                    itemBuilder: (BuildContext context, index) {

                      final Uri url = Uri.parse(transactionList[index].ptrLink.toString());

                      return Padding(
                        padding: const EdgeInsets.all(10).w,
                        child: Card(
                          elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15).w),
                            child: Column(
                          children: [
                            TransactionDetailRow(
                                title: 'Type',
                                value: transactionList[index].type.toString()),
                            TransactionDetailRow(
                                title: 'Amount',
                                value:
                                    transactionList[index].amount.toString()),
                            TransactionDetailRow(
                                title: 'Representative',
                                value: transactionList[index]
                                    .representative
                                    .toString()),
                            TransactionDetailRow(
                                title: 'District',
                                value:
                                    transactionList[index].district.toString()),
                            TransactionDetailRow(
                                title: 'State',
                                value: transactionList[index].state.toString()),
                            // Text(transactionList[index].ptrLink.toString()),
                            Center(
                                child: ElevatedButton(
                                    onPressed: () {
                                      print(url);
                                     launchUrl(url,
                                        mode: LaunchMode.externalApplication
                                     );
                                     },
                                    child: Text('View Pdf'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorManager.darkPink
                                    ),
                                )
                            )
                          ],
                        )),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}