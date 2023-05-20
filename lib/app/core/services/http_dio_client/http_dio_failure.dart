class HttpDioFailure implements Exception {
  final int statusCode;
  final StackTrace? stackTrace;

  const HttpDioFailure({
    required this.statusCode,
    this.stackTrace,
  });

  String get message {
    final hasMessage = messageByStateCode.containsKey(statusCode);
    if (hasMessage) {
      return messageByStateCode[statusCode]!;
    }

    return 'Erro inesperado!';
  }

  StackTrace get stackTraceResult {
    if (stackTrace != null) {
      return stackTrace!;
    }
    return stackTrace!;
  }
}

const Map<int, String> messageByStateCode = {
  401: 'Credênciais inválidas!',
  403: 'Acesso negado!',
  500: 'Erro no servidor!',
  501: 'Erro no servidor!',
  502: 'Erro no servidor!',
  400: 'Dados mal formatado!',
  5000: 'Sem conexão com a internet!',
};
