import 'package:supabase/supabase.dart';
import 'package:dotenv/dotenv.dart';

// Função capaz de fazer a conexão entre o Dart e o Supabase
SupabaseClient conexao() {

  final env = DotEnv()..load();
  final url = env['SUPABASE_URL'] ?? ''; // ?? '' significa que não pode ser nula
  final chave = env['SUPABASE_PUBLISHABLE_KEY'] ?? '';

  if(url.isEmpty || chave.isEmpty) {
    throw StateError("Preencha a URL e a Chave");
  }

  return SupabaseClient(url, chave);

}