function verinotes(idForm,id_text){
 
 var elmt = document.getElementById(idForm).elements[id_text].value;
 var rep=0;
 for(var i=0; i<=30 ; i=i+0.25){
	if (elmt==i || elmt=='/'){
	rep=1;
	break;
	}
 }

if(rep==1) document.getElementById("idForm").elements[id_text].style.backgroundColor='#ffffff';
else document.getElementById("idForm").elements[id_text].style.backgroundColor='red';
 
 }
 
 