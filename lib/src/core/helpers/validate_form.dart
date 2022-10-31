import 'package:form_field_validator/form_field_validator.dart';

final validatedEmail = MultiValidator([
  RequiredValidator(errorText: 'El correo es requerido'),
]);

final validatedPassword = MultiValidator([
  RequiredValidator(errorText: 'Contraseña es requerida'),
  MinLengthValidator(8, errorText: 'Minimo 8 caracteres')
]);

final validatedName = MultiValidator([
  RequiredValidator(errorText: 'El nombre es requerido'),
]);

final validatedUsername = MultiValidator([
  RequiredValidator(errorText: 'El usuario es requerido'),
]);
