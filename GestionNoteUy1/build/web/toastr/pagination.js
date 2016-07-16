/*
 ******* www.devandclick.fr *******

 modeles :
 1 : suivant,precedent
 2 : pagination
 3 : pagination + suivant,precedent
 
 @nbParPage : nombre d'elements par page
 @divSelect : elements a paginer
 @divPager : nom du div ou s'insere la pagination
 @model : Modeles de pagination voir ci-dessus
 */
function pagination(nbParPage,divSelect,divPager,model)
{	
    //Initialisation
    var nbElem = $(divSelect).length;
    var nbPage = Math.ceil(nbElem / nbParPage);
    var pageLoad = 1;
    
    $(divSelect).each(function(index) {
        if (index < nbParPage)
            $(divSelect).eq(index).show();
        else
            $(divSelect).eq(index).hide();
    });
    
    //Reset & verification
    function reset() {
        if (nbPage < 2) $(divPager).hide();
        if (pageLoad == nbPage)
		{
			$(divPager + ' li.suivant').removeClass("waves-effect");
			$(divPager + ' li.suivant').addClass("disabled");
		}
		else
		{
			$(divPager + ' li.suivant').removeClass("disabled");
			$(divPager + ' li.suivant').addClass("waves-effect");
		}
        if (pageLoad == 1)
		{
			$(divPager + ' li.precedent').removeClass("waves-effect");
			$(divPager + ' li.precedent').addClass("disabled");
		}
		else
		{
			$(divPager + ' li.precedent').removeClass("disabled");
			$(divPager + ' li.precedent').addClass("waves-effect");
		}
        $(divPager + ' ul li').removeClass('selected');
        $(divPager + ' ul li').eq(pageLoad -1).addClass('selected');
    }
    
    //Pagination generation
    if (model != 1) {
        $(divPager).html('<ul class="list-inline"></ul>');
		
        for(i = 1; i <= nbPage; i++) 
		{
			if(i==1)
				$(divPager + ' ul').append('<li class="btn btn-primary">' + i + '</li>');
			else
			$(divPager + ' ul').append('<li class="btn btn-primary">' + i + '</li>');
		}
    
        //Changement click page
        $(divPager + ' ul li').click(function() {
            if ($(this).index() != pageLoad) {
                pageLoad = $(this).index();
                $(divSelect).hide();
                
                $(divSelect).each(function(i) {
                    if (i >= ((pageLoad * nbParPage) - nbParPage) && i < (pageLoad * nbParPage)) $(this).show();
                });
				
                $(divPager + ' ul li').removeClass("active");
				$(this).addClass("active");
                reset();
            }
        });
    }
    //Suivant Precedent
    if (model == 1) {
        $(divPager).prepend('<li class="btn btn-primary precedent"><i class="glyphicons chevron-left"</i></li>');
        $(divPager).append('<li class="btn btn-primary suivant"><i class="glyphicons chevron-right"></i></li>');
    } else if (model == 3) {
        $(divPager + ' ul').prepend('<li class="btn btn-primary precedent"><i class="glyphicons chevron-left"></i></li>');
        $(divPager + ' ul').append('<li class="btn btn-primary suivant"><i class="glyphicons chevron-right"></i></li>');
    }
	
	//Evenement click sur suivant
    $(divPager + ' li.suivant').click(function() {
		
        if (pageLoad < nbPage) {
            pageLoad += 1;
            $(divSelect).hide();
            
            $(divSelect).each(function(i) {
                if (i >= ((pageLoad * nbParPage) - nbParPage) && i < (pageLoad * nbParPage)) $(this).show();
            });
            $(divPager + ' ul li').removeClass("active");
			$($(divPager + ' ul li')[pageLoad]).addClass("active");
            reset();
        }
    });
	
	//Evenement click sur precedent
    $(divPager + ' li.precedent').click(function() {
        if (pageLoad -1 >= 1) {
            pageLoad -= 1;
            $(divSelect).hide();
            
            $(divSelect).each(function(i) {
                if (i >= ((pageLoad * nbParPage) - nbParPage) && i < (pageLoad * nbParPage)) $(this).show();
            });
            $(divPager + ' ul li').removeClass("active");
			$($(divPager + ' ul li')[pageLoad]).addClass("active");
            reset();
        }
    });
    
    reset();
}