import 'package:permission_handler/permission_handler.dart';

enum TipoPermissao { camera, microfone }

enum ResultadoPermissao {
  concedida,
  negada,
  negadaPermanentemente,
  restrita,
}

extension TipoPermissaoTexto on TipoPermissao {
  String get motivo {
    switch (this) {
      case TipoPermissao.camera:
        return 'Usamos a câmera para fotografar o objeto e o lugar onde '
            'você o guardou. As fotos ficam só no seu aparelho.';
      case TipoPermissao.microfone:
        return 'Usamos o microfone para você gravar, por voz, onde guardou '
            'o objeto. O áudio fica só no seu aparelho.';
    }
  }

  String get alternativa {
    switch (this) {
      case TipoPermissao.camera:
        return 'Sem a câmera, você ainda pode registrar o objeto só com '
            'nome e local escrito.';
      case TipoPermissao.microfone:
        return 'Sem o microfone, você ainda pode descrever o local por texto.';
    }
  }
}

class PermissaoService {
  Permission _permissao(TipoPermissao tipo) {
    switch (tipo) {
      case TipoPermissao.camera:
        return Permission.camera;
      case TipoPermissao.microfone:
        return Permission.microphone;
    }
  }

  ResultadoPermissao _traduzir(PermissionStatus status) {
    if (status.isGranted || status.isLimited) {
      return ResultadoPermissao.concedida;
    }
    if (status.isPermanentlyDenied) {
      return ResultadoPermissao.negadaPermanentemente;
    }
    if (status.isRestricted) return ResultadoPermissao.restrita;
    return ResultadoPermissao.negada;
  }


  Future<ResultadoPermissao> verificar(TipoPermissao tipo) async {
    return _traduzir(await _permissao(tipo).status);
  }

  Future<ResultadoPermissao> pedir(TipoPermissao tipo) async {
    final atual = await _permissao(tipo).status;
    if (atual.isGranted || atual.isLimited) {
      return ResultadoPermissao.concedida;
    }
    return _traduzir(await _permissao(tipo).request());
  }

  Future<ResultadoPermissao> pedirCamera() => pedir(TipoPermissao.camera);

  Future<ResultadoPermissao> pedirMicrofone() => pedir(TipoPermissao.microfone);

  Future<bool> abrirConfiguracoes() => openAppSettings();
}