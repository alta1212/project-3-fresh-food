$( document ).ready(function() {
    $('#file').change(function(){			
        readImgUrlAndPreview(this);
        function readImgUrlAndPreview(input){
           if (input.files) {
                    var reader = new FileReader();
                    reader.onload = function (e) {			            	
                        $('#avt').attr('src', e.target.result);
                }
                  };
                  reader.readAsDataURL(input.files[0]);
             }	
      });
});