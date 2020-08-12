var limite_bytes = 20971520 // 20MB

function validaImg($input, id) {
  var extPermitidas = ['jpg',, 'jpeg', 'png', 'bmp'];
  var extArquivo = $input.value.split('.').pop();
  var seletor = $(id);

  if($input.files[0].size > limite_bytes){
    $('#arquivo-recusado-tamanho').modal('show');
    $(seletor).val('');
  }

  if(typeof extPermitidas.find(function(ext){ return extArquivo.toLowerCase() == ext.toLowerCase(); }) == 'undefined') {
    $('#arquivo-recusado-img').modal('show');
    $(seletor).val('');
  }
}

function validaPdf($input, id) {
  var extPermitidas = ['pdf'];
  var extArquivo = $input.value.split('.').pop();
  var seletor = $(id);

  console.log(seletor);

  if($input.files[0].size > limite_bytes){
    $('#arquivo-recusado-tamanho').modal('show');
    $(seletor).val('');
  }

  if(typeof extPermitidas.find(function(ext){ return extArquivo.toLowerCase() == ext.toLowerCase(); }) == 'undefined') {
    $('#arquivo-recusado-pdf').modal('show');    
    $(seletor).val('');
  }
}

function validaImgPdf($input, id) {
  var extPermitidas = ['jpg',, 'jpeg', 'png', 'bmp', 'pdf'];
  var extArquivo = $input.value.split('.').pop();
  var seletor = $(id);

  if($input.files[0].size > limite_bytes){
    $('#arquivo-recusado-tamanho').modal('show');
    $(seletor).val('');
  }

  if(typeof extPermitidas.find(function(ext){ return extArquivo.toLowerCase() == ext.toLowerCase(); }) == 'undefined') {
    $('#arquivo-recusado-all').modal('show');  
    $(seletor).val('');
  }
}