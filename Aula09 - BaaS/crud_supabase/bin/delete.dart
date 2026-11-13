import '../lib/conexao.dart';
import 'dart:io'; // Entrada via teclado

main() async {
    final supabase = conexao();

    try {
        print("Digite o ID do produto a ser excluído: ");

        final id = int.parse(stdin.readLineSync()!);
        final produto = await supabase
        .from("produtos")
        .delete()
        .eq("id", id)
        .select()
        .single();

        print("PRODUTO EXCLUÍDO COM SUCESSO!");
    } catch (erro) {
        print("DEU RUIM $erro");
    } finally {
        await supabase.dispose();
    }
}