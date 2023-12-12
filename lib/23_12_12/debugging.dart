import 'dart:convert';

final String json = '''{
 "collectionChartDataList": [
   {
     "collectionName": "collectionName",
     "collectionSalePrice": []
   },
   {
     "collectionName": "collectionName",
     "collectionSalePrice": [
       {
         "price": 59.75,
         "cvtDatetime": "2023-03-26T08:08:35"
       },
       {
         "price": 60.00,
         "cvtDatetime": "2023-03-26T08:08:45"
       }
     ]
   }
 ]
}''';

void main() {
  Map<String, dynamic> response = jsonDecode(json);

  for (var data01 in response.entries) {
    print(data01.key);
    for (var data02 in data01.value) {
      for (var data03 in data02.entries) {
        print('${data03.key} ${data03.value}');
      }
    }
  }
}
