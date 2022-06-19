/**
 *  Confirmação de exclusão de um contato
 	@author George Hanna.
 */
 
 function confirmar(idcon){
	let resposta = confirm("Confirma a exclusão deste contato?") // confirme vai abrir uma caixa de dialogo no browser.
	if (resposta === true){
		//alert(idcon)
		window.location.href = "delete?idcon" = + idcon // redirecionamento "delete" - encaminha o paramentro idcon a ser deletado para o servlet.
	}
}