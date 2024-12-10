class DomainException implements Exception {
  String causaException;

  //vai definir a causa da exceção durante a cronstução da exception personalizada
  DomainException(this.causaException);

  @override
  String toString() {
    return causaException;
  }
}
