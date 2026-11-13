// Registrar informações no banco de dados
import '../lib/conexao.dart';

main() async {
  final supabase = conexao(); // conexão

  try {
    final produto = await supabase
    // Seleciona a tabela
    .from("produtos")
    // Inserir dados na tela
    .insert({
      'nome' : 'Compuatador',
      'preco' : 150.00,
      'quantidade' : 10
    })
    
    //Retorna o registro
    .select()
    //Registro único
    .single();

    print(produto);
  } catch (erro) {
    print("Ocorreu o seguinte erro: $erro");
  } finally{
    await supabase.dispose();
  }
}