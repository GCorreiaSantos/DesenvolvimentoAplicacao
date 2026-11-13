import '../lib/conexao.dart';
import 'dart:io';

main() async {
  final supabase = conexao();

  try {

    print("Digite o ID do produto que deseja alterar: ");
    final id = int.parse(stdin.readLineSync()!);

    // Solicitar nome
    print("Digite o novo nome do produto que deseja alterar: ");
    final nome = stdin.readLineSync();

    // Preço
    print("Digite o preço do produto que deseja alterar: ");
    final preco = double.parse(stdin.readLineSync()!);

    // Quantidade
    print("Digite a quantidade do produto que deseja alterar: ");
    final quantidade = int.parse(stdin.readLineSync()!);

    final produto = await supabase
    // Informa a tabela
    .from("produtos")
    //Método para atualizar
    .update({
      "nome" : nome,
      "preco" : preco,
      "quantidade" : quantidade
    })

    //Identificador
    .eq("id", id)
    // Retorna os valores atualizados
    .select()
    .single();
    
    print(produto);
    print("ATUALIZAÇÃO FEITA COM SUCESSO!");

  } catch (erro) {
    print(erro);
  } finally {
    await supabase.dispose();
  }
}