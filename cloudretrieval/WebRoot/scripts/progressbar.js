//progressbar.js

(function($) {    
    //Main Method
    $.fn.reportprogress = function(val,maxVal) {            
        var max=100;
        if(maxVal)
            max=maxVal;
        return this.each(
            function(){        
                var div=$(this);
                var innerdiv=div.find(".progress");
                if(innerdiv.length!=1){                        
                    innerdiv=$("<DIV class='progress'></DIV>");                    
                    div.append("<DIV class='text'>&nbsp;</DIV>");
                    $("<span class='text'>&nbsp;</span>").css("width",div.width()).appendTo(innerdiv);                    
                    div.append(innerdiv);                    
                }
                var width=Math.round(val/max*100);
                innerdiv.css("width",width+"%");    
                div.find(".text").html(width+" %");
            }
        );
    };
})(jQuery);