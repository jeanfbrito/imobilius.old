/*$(function(){
$(".fancybox")
    .attr('rel', 'gallery')
    .fancybox({
        beforeShow: function () {
            if (this.title) {
                // New line
                //this.title += '<br />';
                
                // Add tweet button
                //this.title += '<a href="https://twitter.com/share" class="twitter-share-button" data-count="none" data-url="' + this.href + '">Tweet</a> ';
                this.title += '  <a href="#" class="btn btn-small pull-right"><i class="icon-pencil"></i> Editar descrição</a>';
                
            }
        },
        afterShow: function() {
            // Render tweet button
            twttr.widgets.load();
        },
        helpers : {
            title : {
                type: 'inside'
            }
        }  
    });*/

function deactivate_all() {
    $('#sortable li').unbind('click');
    $( "#sortable" ).sortable({ disabled: true });
}

function select_cover(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $('.ribbon-outer').remove();
        $(this).prepend('<div class="ribbon-outer"> <div class="ribbon-inner">Capa</div> </div>');
        return false;
    });
}

function select_delete(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $(this).find('.fa-icon-remove').toggle();
        return false;
    });
}

function resort_images() {
    deactivate_all();
    $( "#sortable" ).sortable({ 
        tolerance: "pointer",
        disabled: false,
        start: function(event, ui){
            $(ui.item).height($('#sortable li').height());
            $(ui.placeholder).height($('#sortable li').height());           
           }
    });
    $( "#sortable" ).disableSelection();
}

function select_website_images(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $(this).find('.fa-icon-globe').toggle();
        return false;
    });
}

function select_mobile_images(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $(this).find('.fa-icon-tablet').toggle();
        return false;
    });
}