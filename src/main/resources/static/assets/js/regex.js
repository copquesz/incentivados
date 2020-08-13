function validaCaracteres(input) {
    var campoLimpo = input.value.replace('?','').replace('/', '').replace('\\', '');
    $(input).val(campoLimpo);
}