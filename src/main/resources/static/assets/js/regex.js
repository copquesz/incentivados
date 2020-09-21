function validaCaracteres(input) {
    var campoLimpo = input.value
        .replace('?', '')
        .replace('/', '')
        .replace('\\', '')
        .replace('#' / '')
        .replace('\'', '')
        .replace('"', '')
        .replace('%', '')
        .replace('#', '');
    $(input).val(campoLimpo);
}