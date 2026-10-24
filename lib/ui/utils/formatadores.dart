String formatarBytes(int bytes) {
  if (bytes < 1024) return '$bytes B';

  const unidades = ['KB', 'MB', 'GB'];
  var valor = bytes / 1024;
  var i = 0;
  while (valor >= 1024 && i < unidades.length - 1) {
    valor /= 1024;
    i++;
  }

  final texto = valor.toStringAsFixed(valor >= 10 ? 0 : 1).replaceAll('.', ',');
  return '$texto ${unidades[i]}';
}