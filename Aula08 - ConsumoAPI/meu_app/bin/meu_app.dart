import 'package:http/http.dart';

void main() {
  //requestData();
  requestDataAsync();
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/GCorreiaSantos/403d9e5c9b4252cac4ad5f5c6fe24bf5/raw/6f045cc699e6307bacc30d30e82594e0c06b8db3/filmes.json";

  Future<Response> filmes = get(Uri.parse(url));
  print(filmes);

  filmes.then((Response response) {
    //O then continua o código enquanto a requisição não chega
    print(response);
    print(response.body);
  });

  print("Ultimo código");
}

// O Código é lido linha a linha - Sincrono
requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/GCorreiaSantos/403d9e5c9b4252cac4ad5f5c6fe24bf5/raw/6f045cc699e6307bacc30d30e82594e0c06b8db3/filmes.json";

  Response response = await get(Uri.parse(url));

  print(response.body);
  print("Ultimo código");
}
