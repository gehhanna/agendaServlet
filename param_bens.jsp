<%@include file="/include/head.jsp"%>
<%@page import="br.ufrn.sipac.patrimonio.comuns.dominio.*, br.ufrn.sipac.patrimonio.tombamento.dominio.*, br.ufrn.sipac.patrimonio.movimentacao.dominio.*, br.ufrn.sipac.patrimonio.consultas.struts.TipoOrdenacao, br.ufrn.sipac.patrimonio.consultas.struts.OpcaoBusca, br.ufrn.sipac.arq.struts.ConstantesAction, br.ufrn.arq.seguranca.SipacSubsistemas, br.ufrn.sipac.cadastro.dominio.Usuario, br.ufrn.sipac.patrimonio.consultas.struts.TipoRelatorio"%> 
<%@ taglib uri="/tags/ufrn" prefix="ufrn" %>
<%@page import="br.ufrn.arq.parametrizacao.ParametroHelper"%>
<%@page import="br.ufrn.sipac.parametro.dominio.ParametrosPatrimonio"%>
<%@page import="br.ufrn.sipac.requisicoes.material.dominio.DescritorGrupoMaterial"%><script>
	var checkDen = <%= OpcaoBusca.DENOMINACAO_BEM%>;
	var checkFaixaTom = <%= OpcaoBusca.FAIXA_TOMBAMENTO %>;
	var checkTom = <%= OpcaoBusca.TOMBAMENTO %>;
	var checkGrupo = <%= OpcaoBusca.GRUPO_MATERIAL%>;
	var checkSubGrupo = <%= OpcaoBusca.SUB_GRUPO_MATERIAL %>;
	var checkUnidade = <%=OpcaoBusca.UNIDADE%>;
	var checkLocal = <%= OpcaoBusca.LOCALIDADE%>;
	var checkMaterial = <%=OpcaoBusca.MATERIAL%>;
	var checkEstadoBem = <%= OpcaoBusca.ESTADO_BEM %>;
	var checkMotivoIndisponivel = <%=OpcaoBusca.MOTIVO_INDISPONIBILIDADE %>;
	
	<!-- newton.ncs - RDM#43627 
	
	2. documentação:
	b. Incluir na consulta de bens (informações relativas a documentos)
	. Termo de desmembramento
	c. Criar na aba Consulta a opção Termo de Desmembramento. -->	
	var checkTermoDesmembramento = <%= OpcaoBusca.TERMO_DESMEMBRAMENTO %>
	
	var checkTermo = <%= OpcaoBusca.TERMO_RESPONSABILIDADE %>		
	var checkPeriodoTransferencia = <%= OpcaoBusca.PERIODO_TRANSFERENCIA %>
	var checkValor = <%= OpcaoBusca.VALOR_FAIXA %>
	var checkSemGarantia = <%= OpcaoBusca.SEM_GARANTIA %>
	var checkComGarantia = <%= OpcaoBusca.DATA_GARANTIA%>
	var checkMarca  = <%= OpcaoBusca.MARCA %>
	var checkNotaReceb = <%= OpcaoBusca.NOTA_RECEBIMENTO  %>
	var checkGuia = <%= OpcaoBusca.GUIA_MOVIMENTACAO  %>
	var checkAcautelador = <%=OpcaoBusca.ACAUTELADOR %>
	var checkNumCautela = <%=OpcaoBusca.NUM_CAUTELA %>
	var checkPeriodoCautela = <%=OpcaoBusca.PERIODO_CAUTELA %>
	var checkDataFechamento = <%=OpcaoBusca.DATA_FECHAMENTO %>
	var checkPrevista = <%=OpcaoBusca.DATA_PREVISTA %>
	var checkDocumento = <%=OpcaoBusca.DOCUMENTO %>
	var checkProcessoAlienacao = <%=  OpcaoBusca.PROCESSO_ALIENACAO %>
	var checkDataAlienacao = <%= OpcaoBusca.DATA_ALIENACAO %>
	var checkTermoAlienacao = <%= OpcaoBusca.TERMO_ALIENACAO %>
	var checkTipoAlienacao = <%= OpcaoBusca.TIPO_ALIENACAO %>
	var checkUnidadeCompra = <%= OpcaoBusca.UG_DE_COMPRA %>
	var checkNotaFiscal = <%= OpcaoBusca.NOTA_FISCAL %>
	var checkEmpenho = <%= OpcaoBusca.EMPENHO %>
	var checkProcessoCompra = <%=OpcaoBusca.PROCESSO_COMPRA %>
	var checkFornecedor = <%= OpcaoBusca.FORNECEDOR %>
	var checkDataEntrada = <%= OpcaoBusca.DATA_ENTRADA %>
	var checkCentroCusto = <%= OpcaoBusca.CENTRO_CUSTO %>
	var checkTipoEntrada  = <%=OpcaoBusca.TIPO_DE_ENTRADA %>
	var checkDataTombo = <%=OpcaoBusca.DATA_TOMBAMENTO %>
	var checkRespSetor = <%=OpcaoBusca.RESPONSAVEL_SETOR %>
	var checkRespLocalidade = <%=OpcaoBusca.RESPONSAVEL_LOCALIDADE %>
	var checkDataEmpenho = <%=OpcaoBusca.DATA_EMPENHO %>
	var checkNumeroAntigo = <%=OpcaoBusca.NUMERO_ANTIGO %>
	var checkUnidadeFilha = <%=OpcaoBusca.INCLUIR_UNIDADES_FILHAS%>
	var checkPeriodoRecolhimento = <%=OpcaoBusca.PERIODO_RECOLHIMENTO %>
	var checkGestoraRecolhimento = <%=OpcaoBusca.GESTORA_RECOLHIMENTO %>
	var checkStatusBem = <%=OpcaoBusca.STATUS_BEM %>
	var checkFormatoImpressao = <%=OpcaoBusca.FORMATO_IMPRESSAO %>
	var checkAnulado = <%=OpcaoBusca.BENS_ANULADOS%>
	var checkBemTerceiro = <%=OpcaoBusca.BEM_TERCEIROS %>
	var checkTipoAjustes = <%= OpcaoBusca.TIPO_AJUSTES %>
	var checkNumeroAno = <%= OpcaoBusca.NUMERO_ANO %>
	var checkPeriodoAjuste = <%= OpcaoBusca.PERIODO_AJUSTE %>
	var checkUnidadeGestoraPatrimonial = <%= OpcaoBusca.UNIDADE_GESTORA_PATRIMONIAL %>
	var checkbensRecolhidos = <%= OpcaoBusca.BENS_RECOLHIDOS %>	
	var checkTermoBemNaoLocalizado = <%=OpcaoBusca.TERMO_BENS_NAO_LOCALIZADOS %>
	
	 
</script>
<jsp:include page="scriptsConsultaGeralBens.jsp"></jsp:include>
<body onload="marcarTodos(); carregarCorpo();"> 
<h2 class="title"><sipac:linkSubsistema nomeAbreviado="true"/> &gt; <bean:write name="titulo"/> </h2>
<%@include file="/include/erros.jsp"%>
<%@include file="/include/ajax_tags.jsp"%>
<sipac:buscaCombo name="grupos" queryProperty="codigo" jsFunction="buscaCodigoGrupo" beanDesc="Grupo Material"/>
<html:form action="gerarRelatorioBens" method="post" styleId="formulario">
<html:hidden property="tipoRelatorio"/>
<html:hidden property="opcoesBusca"/>
<input id="mostrarTitulo" type="hidden" name="titulo" value="<%=request.getAttribute("titulo")%>"/>
<logic:present name="view">
	<input id="mostraView" type="hidden" name="view" value="<%=request.getAttribute("view")%>"/>
</logic:present>

<div class="descricaoOperacao">
	<%--sprint#6:feature#38829: mensagem ao usuario --%>
	Agora a consulta padrão não considera mais os bens Alienados. Para consultá-los, marque a opção Considerar Bens Alienados
	<br/>
	Dependendo do período selecionado o relatório pode demorar alguns minutos.
	<logic:equal parameter="acao" value="desmembrar">
		<sipac:manual codigo="sipac:patrimonio:bens:tombamento:desmembramento_de_bens"/>
	</logic:equal>
	<logic:equal parameter="acao" value="alterarLocal">
		<sipac:manual codigo="sipac:patrimonio:gerencia:movimentacoes:alterar_local_de_um_bem"/>
	</logic:equal>
	<logic:equal parameter="acao" value="consultar">
		<sipac:manual codigo="sipac:patrimonio:consultas:bens:consulta_geral"/>
	</logic:equal>
	<logic:equal parameter="acao" value="consultaGarantia">
		<sipac:manual codigo="sipac:patrimonio:consultas:bens:garantia_de_um_bem"/>
	</logic:equal>
	<logic:equal parameter="acao" value="consultaHistorico">
		<sipac:manual codigo="sipac:patrimonio:consultas:bens:historico_de_um_bem"/>
	</logic:equal>
	<logic:equal parameter="aba" value="relatorios-menupatrimonio">
		<sipac:manual codigo="sipac:patrimonio:relatorios:bens:relatorio_geral"/>
	</logic:equal>
</div>

<div class="infoAltRem">
	<img src="img_css/buscar.gif" alt="Buscar Unidade" title = "Buscar Unidade" />: Buscar Unidade
	<img src="/sipac/img_css/contratos/incrementar_valor.gif" alt="Expandir Info" title = "Expandir Info" />: Expandir Informações
	<img src="/sipac/img_css/contratos/decrementar_valor.gif" alt="Ocultar Info" title = "Ocultar Info" />: Ocultar Informações
</div>
<%
Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
boolean gestorCentro = usuario.isUserInRole(SipacPapeis.GESTOR_PATRIMONIO_UNIDADE_GESTORA);
boolean gestorGlobal = usuario.isUserInRole(SipacPapeis.GESTOR_PATRIMONIO_GLOBAL);
boolean denominacao = false;
boolean processoAlienacao = false;
boolean dataAlienacao = false;
boolean termoAlienacao = false;
boolean tipoAlienacao = false;
boolean valorFaixa = false;
boolean bensSemGarantia = false;
boolean bensComGarantia = false;


//newton.ncs - RDM#43627 - Em: 31/01/2020
boolean termoDesmembramento = false;

boolean termoResponsabilidade = false;
boolean periodoTransferencia = false;
boolean notaRecebimento = false;
boolean guiaMovimentacao = false;
boolean marca = false;
boolean faixaTombamento = false;
boolean tombamentoBoolean = false;
boolean grupo = false;
boolean unidade = false;
boolean localidade = false;
boolean especificacao = false;
boolean unidadesFilhas = false;
boolean material = false;
boolean subGrupo = false;
boolean estadoBem = false;
boolean motivoIndisponivel = false;
boolean respSetor= false;
boolean respLocalidade= false;
boolean acautelador = false;
boolean numCautela = false;
boolean periodoCautela = false;
boolean dataFechamento = false;
boolean dataPrevista = false;
boolean documento = false;
boolean dataTombamento = false;
boolean dataEntrada = false;
boolean notaFiscal = false;
boolean centroCusto = false;
boolean unidadeCompra = false;
boolean empenho = false;
boolean processoCompra = false;
boolean fornecedor = false;
boolean tipoEntrada = false;
boolean dataEmpenho = false;
boolean numeroAntigo = false;
boolean periodoRecolhimento = false;
boolean gestoraRecolhimento = false;
boolean statusBem = false;
boolean formatoImpressao = false;
boolean bensAnulados = false;
boolean bemTerceiros = false;
boolean tipoAjustes = false;
boolean numeroAno = false;
boolean periodoAjustes = false;
boolean unidadeGestoraPatrimonial = false;
boolean bensRecolhidos = false;
// sprint#5:feature#37160: variavel que guarda o considerar ou nao os alienados
boolean considerarBensAlienados = false;

//feature#43632: variavel que guarda o considerar ou nao os bens não localizados
boolean termoBensNaoLocalizado = false;
%>
<logic:iterate id="opcao" name="relatorioPatrimonioForm" property="opcoesBusca">
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.NUMERO_ANTIGO)%>">
	<%  numeroAntigo = true;%>
</logic:equal>	
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.BENS_ANULADOS)%>">
	<%  bensAnulados = true;%>
</logic:equal>	
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.BEM_TERCEIROS)%>">
	<%  bemTerceiros = true;%>
</logic:equal>	
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.NOTA_RECEBIMENTO)%>">
	<%  notaRecebimento = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.GUIA_MOVIMENTACAO)%>">
	<%  guiaMovimentacao = true;%>
</logic:equal>	
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DATA_TOMBAMENTO)%>">
	<%  dataTombamento = true;%>
</logic:equal>	
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.EMPENHO)%>">
	<%  empenho = true;%>
</logic:equal>	
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.LOCALIDADE)%>">
	<%  localidade = true;%>
</logic:equal>	
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TIPO_DE_ENTRADA)%>">
	<%  tipoEntrada = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.RESPONSAVEL_SETOR)%>">
	<%  respSetor = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.RESPONSAVEL_LOCALIDADE)%>">
	<%  respLocalidade = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.ACAUTELADOR)%>">
	<%  acautelador = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.NUM_CAUTELA)%>">
	<%  numCautela = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.PERIODO_CAUTELA)%>">
	<%  periodoCautela = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DATA_FECHAMENTO)%>">
	<%  dataFechamento = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DATA_PREVISTA)%>">
	<%  dataPrevista = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DOCUMENTO)%>">
	<%  documento = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DATA_ENTRADA)%>">
	<%  dataEntrada = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.NOTA_FISCAL)%>">
	<%  notaFiscal = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.CENTRO_CUSTO)%>">
	<%  centroCusto = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.UG_DE_COMPRA)%>">
	<%  unidadeCompra = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DATA_EMPENHO)%>">
	<%  dataEmpenho = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.PROCESSO_COMPRA)%>">
	<%  processoCompra = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.FORNECEDOR)%>">
	<%  fornecedor = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DATA_ALIENACAO)%>">
	<%  dataAlienacao = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TERMO_ALIENACAO)%>">
	<%  termoAlienacao = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.PROCESSO_ALIENACAO)%>">
	<%  processoAlienacao = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TIPO_ALIENACAO)%>">
	<%  tipoAlienacao = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.VALOR_FAIXA)%>">
	<%  valorFaixa = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.MARCA)%>">
	<%  marca = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.SEM_GARANTIA)%>">
	<%  bensSemGarantia = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DATA_GARANTIA)%>">
	<%  bensComGarantia = true;%>
</logic:equal>

<!-- newton.ncs - RDM#43627 
2. documentação:
b. Incluir na consulta de bens (informações relativas a documentos)
. Termo de desmembramento
c. Criar na aba Consulta a opção Termo de Desmembramento. -->
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TERMO_DESMEMBRAMENTO)%>">
	<%  termoDesmembramento = true;%>
</logic:equal>

<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TERMO_RESPONSABILIDADE)%>">
	<%  termoResponsabilidade = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.PERIODO_TRANSFERENCIA)%>">
	<%  periodoTransferencia = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.ESTADO_BEM)%>">
	<%  estadoBem = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.MOTIVO_INDISPONIBILIDADE)%>">
	<%  motivoIndisponivel = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.DENOMINACAO_BEM)%>">
	<%  denominacao = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.FAIXA_TOMBAMENTO)%>">
	<%  faixaTombamento = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TOMBAMENTO)%>">
	<%  tombamentoBoolean = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.GRUPO_MATERIAL)%>">
	<%  grupo = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.SUB_GRUPO_MATERIAL)%>">
	<%  subGrupo = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.UNIDADE)%>">
	<%  unidade = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.ESPECIFICACAO_BEM)%>">
	<%  especificacao = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.INCLUIR_UNIDADES_FILHAS)%>">
	<%  unidadesFilhas = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.MATERIAL)%>">
	<%  material = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.PERIODO_RECOLHIMENTO)%>">
	<%  periodoRecolhimento = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.GESTORA_RECOLHIMENTO)%>">
	<%  gestoraRecolhimento = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.STATUS_BEM)%>">
	<%  statusBem = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.FORMATO_IMPRESSAO)%>">
	<%  formatoImpressao = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TIPO_AJUSTES)%>">
	<%  tipoAjustes = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.NUMERO_ANO)%>">
	<%  numeroAno = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.PERIODO_AJUSTE)%>">
	<%  periodoAjustes = true;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.UNIDADE_GESTORA_PATRIMONIAL)%>">
	<!-- 
		bruno@stefanini - RM#25412 - 22/11/2018 
		unidadeGestoraPatrimonial = true
	-->
	<%  unidadeGestoraPatrimonial = false;%>
</logic:equal>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.BENS_RECOLHIDOS)%>">
	<%  bensRecolhidos = true;%>
</logic:equal>
<%-- sprint#5:feature#37160 --%>
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.CONSIDERAR_BENS_ALIENADOS)%>">
	<%  considerarBensAlienados = true;%>
</logic:equal>

<!-- newton.ncs - RM#43632 - 08/01/2020 -->
<logic:equal name="opcao" value="<%= String.valueOf(OpcaoBusca.TERMO_BENS_NAO_LOCALIZADOS)%>">
	<%  termoBensNaoLocalizado = true;%>
</logic:equal>

</logic:iterate>
<table width="100%" align="center" class="formulario">
	<caption class="listagem"> Critérios </caption>
	<tr> 
		<td width="100%"> 
			<table class="subFormulario" width="100%">
					<caption>
						<span onclick="mostrarEsconder('infoBem');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoBem_d">&nbsp;&nbsp;&nbsp;</span>
						<span onclick="mostrarEsconder('infoBem');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoBem_i">&nbsp;&nbsp;&nbsp;</span>
						Informações Relativas ao Bem*
						<html:hidden styleId="hidden_infoBem" name="relatorioPatrimonioForm" property="infoBem"/>
					</caption>
					<tr>
						<td>
							<div id="infoBemDiv">
								<table id="infoBem" width="100%" >
									<tr>
				 						<td width="24%"> &nbsp;</td>
									</tr>
									<tr>    
										<td style="white-space: nowrap;">
											<input id="tombamentoCh" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.TOMBAMENTO)%>" <% if (tombamentoBoolean) {%> checked="checked" <% };%>
											 onclick="marcarTodos()" /> 
											<label for="tombamentoCh">Tombamento:</label> 
										</td>
										<td   onclick="desmarcar('faixaTombamento');marcarTodos();Ext.get('tombamentoCh').dom.checked=true;" colspan="2"> 
											<html:text styleId="numTombamento"  onfocus="marcarOpcao(this,checkTom); marcarTodos();"  property="tombamento" size="12" maxlength="12"   onkeyup="return(formatarInteiro(this, event))" />					
							 			</td>
									</tr>
									<tr>
										<td style="white-space: nowrap;">
											<%-- sprint#5:feature#37160: nao pode marcar o considerar bens alienados --%>
											<input id="faixaTombamento" onclick="desmarcar('tombamentoCh');desmarcar('considerarBensAlienadosCh');marcarTodos('faixaTombamento');" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.FAIXA_TOMBAMENTO)%>" <% if (faixaTombamento) {%> checked="checked" <% };%>/> 
											<label for="faixaTombamento">Faixa de Tombamento:</label> 
										</td>
										<td onclick="desmarcar('tombamentoCh');desmarcar('considerarBensAlienadosCh');marcarTodos('faixaTombamento');Ext.get('faixaTombamento').dom.checked=true;" colspan="2">
											<html:text styleId="tombamentoInic" onclick="marcarOpcao(this,checkFaixaTom);desmarcar('tombamentoCh');marcarTodos();" property="tombamentoInicial" size="12" maxlength="12"   onkeyup="return(formatarInteiro(this, event))" /> a 
											<html:text styleId="tombamentoFim" onclick="marcarOpcao(this,checkFaixaTom);desmarcar('tombamentoCh');marcarTodos();"  property="tombamentoFinal"  onkeyup="return(formatarInteiro(this, event))" size="12" maxlength="12"/>
							 			</td>
									</tr>
									<tr>
										<td style="white-space: nowrap;"> 
											<input id="periodoTombamento" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DATA_TOMBAMENTO)%>" <% if (dataTombamento) {%> checked="checked" <% };%>/> 
											<label for="periodoTombamento">Período de Tombamento:</label>
										</td>
										<td onmouseup="Ext.get('periodoTombamento').dom.checked=true;"  onclick="marcarOpcao(this,checkDataTombo);" >
					  						<sipac:calendar property="dataInicio"/> a <sipac:calendar property="dataFim"/>
					  					</td>
									</tr>
									<tr>
										<td style="white-space: nowrap;" >
											<input id="estadoBem" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.ESTADO_BEM)%>" <% if (estadoBem) {%> checked="checked" <% };%>/>
											<label for="estadoBem">Estado do Bem:</label>
										</td>
										<td  onclick="marcarOpcao(this,checkEstadoBem);">
											<html:select styleId="tipo_estado" onclick="Ext.get('estadoBem').dom.checked=true;" property="bem.estado" style="width:200" onchange="javascript:checarMotivo();">
												<html:options collection="tipoEstados" property="key" labelProperty="value" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td style="white-space: nowrap;"> 
											<input id="statusBem" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.STATUS_BEM)%>" <% if (statusBem) {%> checked="checked" <% };%>/> 
											<label for="statusBem">Status do Bem:</label>
										</td>
										<td  onclick="marcarOpcao(this,checkStatusBem);">
											<html:select styleId="tipo_status" onclick="Ext.get('statusBem').dom.checked=true;" property="bem.status" style="width:200">
												<html:options collection="tipoStatus" property="key" labelProperty="value" />
											</html:select>
										</td>
									</tr>
									<tr >
										<td style="white-space: nowrap;">
								 			<input id="grupoMaterial" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.GRUPO_MATERIAL)%>" <% if (grupo) {%> checked="checked" <% };%>/>
				 							<label for="grupoMaterial">${materialMBean.nomeGrupodoMaterial }:</label>
				 						</td>
										<td onclick="marcarOpcao(this, checkGrupo);" colspan="2">
											<!-- 
												lima.bpl@stefanini - 26269 
												<input type="text" name="codigo" size="4" onchange="javascript:procurarDescritoresGrupoInput();" id="style_codigo" onKeyUp="buscaCodigoGrupo(this.form['grupoMaterial.id'], this, this.form['msgPaneGrupo']); return(formatarInteiro(this, event))" >												
											-->
											<input type="text" name="codigo" size="4" value="<%= request.getSession().getAttribute("codigoMaterial") != null ? request.getSession().getAttribute("codigoMaterial") : "" %>" 
												onchange="javascript:procurarDescritoresGrupoInput();" id="style_codigo" onKeyUp="buscaCodigoGrupo(this.form['grupoMaterial.id'], this, this.form['msgPaneGrupo']); return(formatarInteiro(this, event))" >

											<html:select onclick="Ext.get('grupoMaterial').dom.checked=true;" property="grupoMaterial.id" style="width:430px" onchange="javascript:procurarDescritoresGrupo();" styleId="grupo_id" >
												<html:options collection="grupos" property="id" labelProperty="denominacao"/>
											</html:select>
											<input id="mensagemPane" type="text" name="msgPaneGrupo" size="25" disabled="true" class="msgPane" />
										</td>
									</tr>
									<logic:present name="subGrupos">
										<c:if test="${not empty subGrupos}">
											<tr>
												<td style="white-space: nowrap;"> 
													<input id="subGrupoMat" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.SUB_GRUPO_MATERIAL)%>" <% if (subGrupo) {%> checked="checked" <% };%>/>
				 									<label for="subGrupoMat">${materialMBean.nomeSubGrupo }:</label>
				 								</td>
												<td onclick="marcarOpcao(this,checkSubGrupo)" colspan="2" >
													<html:select property="subGrupo.id"  styleId="subGrupo_id" onchange="javascript:procurarDescritoresSubGrupo();" >
														<html:option value="0">-- SELECIONE --</html:option>
														<html:options collection="subGrupos" property="id" labelProperty="denominacao"/> 		
													</html:select>
				
												</td>
											</tr>
										</c:if>
									</logic:present>
									<logic:equal name="relatorioPatrimonioForm" property="bem.estado" value="<%=String.valueOf(TipoEstadoBem.INDISPONIVEL)%>">
										<tr>
											<td style="white-space: nowrap;">
												<input id="motivo" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.MOTIVO_INDISPONIBILIDADE)%>" <% if (motivoIndisponivel) {%> checked="checked" <% };%>/>
												<label for="motivo">Motivo da Indisponibilidade:</label>
									 		</td>
											<td onclick="marcarOpcao(this,checkMotivoIndisponivel)">
												<html:select styleId="motivosIndisponibilidade" property="bem.indisponibilidadeBem.id" style="width:200" >
													<html:options collection="motivoIndisponibilidade" property="id" labelProperty="descricao" />
												</html:select>
											</td>
				
										</tr>			
									</logic:equal>
									<tr>
										<td style="white-space: nowrap;">
											<input id="denomina" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DENOMINACAO_BEM)%>" <% if (denominacao) {%> checked="checked" <% };%>/> 
				 							<label for="denomina">Denominação:</label>
				 						</td>
										<td onclick="marcarOpcao(this, checkDen);" colspan="2">
								 			<html:text property="denominacao" onclick="Ext.get('denomina').dom.checked=true;" size="76"  styleId="denominacao"/>
										</td>
									</tr>
									<tr>
										<td style="white-space: nowrap;"> 
											<input id="material" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.MATERIAL)%>" <% if (material) {%> checked="checked" <% };%> id="materialBusca"/>
				 							<label for="material">Material:</label>
				 						</td>
										<td onmouseup="Ext.get('material').dom.checked=true;" onclick="marcarOpcao(this,checkMaterial);" colspan="2">
											<input id="model" name="model" type="text" size="70" onkeypress="$('materialBusca').checked=true" value="${param['model']}"/>
											<input id="materialBusca.id" name="materialBusca.id" type="hidden" class="contentLink" value="${param['materialBusca.id']}"/>
											<span id="indicator" style="display:none; "><img src="/sipac/img_css/indicator.gif" /></span>
											<ajax:autocomplete
							 	 				source="model"
							  					target="materialBusca.id"
							  					baseUrl="/sipac/autocomplete"
							  					className="autocomplete"
							  					indicator="indicator"
							  					minimumCharacters="3"
							  					parameters="somenteAtivos=false"
							  					parser="new ResponseXmlToHtmlListParser()"/>
										</td>
									</tr>
									<tr>
										<td style="white-space: nowrap;"> 
								 			<input id="marca" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.MARCA)%>" <% if (marca) {%> checked="checked" <% };%> id="materialBusca"/>
											<label for="marca">Marca:</label>
										</td>
					
										<td onmouseup="Ext.get('marca').dom.checked=true;" onclick="marcarOpcao(this, checkMarca)">
											<input id="nome" name="nome" type="text" style="width: 500px;" value="${nome}" />
											<input id="marcaBem.id" name="marcaBem.id" type="hidden" class="contentLink" value="${id}"/>
											<span id="indicator_2" style="display:none; "><img src="/sipac/img_css/indicator.gif" /></span>
											<ajax:autocomplete
								  				source="nome"
								  				target="marcaBem.id"
								  				baseUrl="/sipac/autocompleteMarca"
								  				className="autocomplete"
								  				indicator="indicator_2"
								  				minimumCharacters="2"
								  				parameters=""
								  				parser="new ResponseXmlToHtmlListParser()"/>
										</td>
									</tr>
									<tr>
										<td> 
											<input id="garantia" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DATA_GARANTIA)%>" <% if (bensComGarantia) {%> checked="checked" <% };%>/> 
											<label for="garantia">Fim Garantia:</label>
										</td>
										<td onmouseup="Ext.get('garantia').dom.checked=true;" onclick="marcarOpcao(this,checkComGarantia);" >
											<sipac:calendar property="dataInicialGarantia"/> a <sipac:calendar property="dataFinalGarantia"/>
										</td>
									</tr>
									<tr>
										<td style="white-space: nowrap;" colspan="3"> 
											<input type="checkbox" name="opcoesBusca" id="semGarantia" class="noborder" value="<%= String.valueOf(OpcaoBusca.SEM_GARANTIA)%>" <% if (bensSemGarantia) {%> checked="checked" <% };%>/> 
											<label for="semGarantia">Bens Sem Garantia</label>
										</td>
									</tr>
									<c:set value="<%=DescritorGrupoMaterial.BEM %>" var="destinoBem"></c:set>
									<c:set value="<%=DescritorGrupoMaterial.MATERIAL %>" var="destinoMat"></c:set>
									<c:set value="<%=DescritorGrupoMaterial.AMBOS %>" var="destinoAmbos"></c:set>
									<logic:notEmpty name="relatorioForm"  property="descritoresGrupo">
									<tr>
										<td colspan="3">
											<c:if test="${not empty descritoresGrupo}">
												
												<table class="subFormulario" width="100%">
													<caption> Descritores do ${materialMBean.nomeGrupodoMaterial} </caption>
													<thead>
													<tr>
														<th colspan="2" > &nbsp;</th>
														<th  style="white-space: nowrap; width: 250px;text-align: left;"> Nome</th>
														<!-- 
															bruno@stefanini.com - #24697 - 06/11/2018
															<th style="text-align: left;"> Destino </th>
															<th style="text-align: left;"> Valor </th> 
														-->
														<th style="text-align: left;"></th>
														<th style="text-align: left;"></th>
													</tr>
													</thead>
													<logic:iterate name="relatorioForm"  property="descritoresGrupo" id="descritor" indexId="loop">
														
														<tr>
															<td style="width: 17px;"> </td>
															<td style="white-space: nowrap;width: 10px;" > 
					
																<html:checkbox styleId="check_${loop}"  property="vetorChecar" onclick="javascript:desabilita('hidden_${loop}');"/> 
															</td>
															
															<c:if test="${relatorioForm.vetorChecar[loop]}">
						 										<html:hidden styleId="hidden_${loop}" property="vetorChecar" value="false" disabled="true"/>
							 								</c:if>
						 									<c:if test="${!relatorioForm.vetorChecar[loop]}">
						 										<html:hidden styleId="hidden_${loop}" property="vetorChecar" value="false"/>
															</c:if>
															<td   onmouseup="Ext.get('check_${loop}').dom.checked=true;" style="white-space: nowrap; width: 250px;"> <label for="check_${loop}">${descritor.nome }:</label> </td>
					
															<td>  
																<!-- 
																	 bruno@stefanini.com - #24697 - 06/11/2018 
																	 <c:if test="${descritor.destino == destinoBem}"> Bem</c:if> 
																-->
																<c:if test="${descritor.destino == destinoBem}"></c:if>
																<c:if test="${descritor.destino == destinoMat}"> Material</c:if>
																<c:if test="${descritor.destino == destinoAmbos}"> Ambos</c:if>
															</td>
															<c:if test="${relatorioForm.vetorChecar[loop]}">
																<script type="text/javascript">
																	$('check_${loop}').checked = true;
																</script>
															</c:if>
															<c:if test="${!descritor.lista }">
																<td>
																	<html:hidden value="${descritor.id}" property="idDescritores"/>
																	<c:if test="${!descritor.numerico}">
																		<html:text styleId="valoresDeGrupo" maxlength="${descritor.comprimentoDescritor}" property="valoresGrupo" onclick="javascript:marcar('check_${loop}');javascript:habilitar('hidden_${loop}');"  value="${relatorioForm.valoresGrupo[loop]}"/>
																	</c:if>
																	<c:if test="${descritor.numerico}">
																		<html:text styleId="valoresDeGrupos" maxlength="${descritor.comprimentoDescritor}" onkeyup="return formatarInteiro(this);" onclick="javascript:marcar('check_${loop}');javascript:habilitar('hidden_${loop}');"  property="valoresGrupo" value="${relatorioForm.valoresGrupo[loop]}"/> (Apenas Números)
																	</c:if>
																	<!-- 
																		MARONI@STEFANINI
																		RM#7589 - 14/02/2017
																		Acrescentado tipo data com mascara para consulta de bem.
																 	-->
																	<c:if test="${descritorSub.data}">
																		<html:text maxlength="10" onclick="marcar('check_sub${loop}');javascript:habilitar('hidden_sub${loop}');" onkeypress="mascaraData(this)" property="valoresSub" value="${relatorioForm.valoresSub[loop]}"/>
																	</c:if>
																</td>
															</c:if>
															<c:if test="${descritor.lista}">
																<td style="white-space: nowrap;">
																	<html:hidden value="${descritor.id}" property="idDescritores"/>
																	<html:select styleId="valoresOpcoes" property="valoresGrupo" onclick="javascript:marcar('check_${loop}');javascript:habilitar('hidden_${loop}');" >
																		<html:option value="0">-- SELECIONE --</html:option>
																		<logic:iterate property="descritorOpcoes" name="descritor" id="opcao" indexId="i">
																			<html:option value="${opcao.valor}"/>		
																		</logic:iterate>		
																	</html:select>
																</td>
															</c:if>
														</tr>
													
													</logic:iterate>
												</table>
											</c:if>
										</td>
									</tr>
									</logic:notEmpty>
									<logic:notEmpty name="relatorioForm"  property="descritoresSubGrupo">
									<tr>
										<td colspan="3">
										<c:if test="${not empty descritoresSubGrupo}">
											<table class="subFormulario" width="100%">
											<caption> Descritores do ${materialMBean.nomeSubGrupo} </caption>
											<thead>
													<tr>
														<th colspan="2" > &nbsp;</th>
														<th  style="white-space: nowrap; width: 250px;text-align: left;"> Nome</th>
														<th style="text-align: left;"> Destino </th>
														<th style="text-align: left;"> Valor </th>
													</tr>
											</thead>
											
												<logic:iterate name="relatorioForm"  property="descritoresSubGrupo" id="descritorSub" indexId="loop">
													<tr>
														<td style="width: 17px;"> </td>
														<td style="white-space: nowrap;width: 10px;"  > <html:checkbox styleId="check_sub${loop}"  property="vetorChecarSub" onclick="javascript:desabilita('hidden_sub${loop}');"/> </td>
						 								<c:if test="${relatorioForm.vetorChecarSub[loop]}">
						 									<html:hidden styleId="hidden_sub${loop}" property="vetorChecarSub" value="false" disabled="true"/>
						 								</c:if>
						 								<c:if test="${!relatorioForm.vetorChecarSub[loop]}">
						 									<html:hidden styleId="hidden_sub${loop}" property="vetorChecarSub" value="false"/>
							 							</c:if>
														<td  style="white-space: nowrap; width: 250px;" >  ${descritorSub.nome } :</td>
														
														<td>  
															<c:if test="${descritorSub.destino == destinoBem}"> Bem</c:if>
															<c:if test="${descritorSub.destino == destinoMat}"> Material</c:if>
															<c:if test="${descritorSub.destino == destinoAmbos}"> Ambos</c:if>
														</td>
														
														<c:if test="${relatorioForm.vetorChecarSub[loop]}">
															<script type="text/javascript">
						
																$('check_sub${loop}').checked = true;
															</script>
														</c:if>
														<c:if test="${!descritorSub.lista }">
															<td >
																<html:hidden value="${descritorSub.id}" property="idDescritores"/>
																<c:if test="${descritorSub.alfanumerico}">
																	<html:text maxlength="${descritorSub.comprimentoDescritor}" property="valoresSub" onclick="marcar('check_sub${loop}');javascript:habilitar('hidden_sub${loop}');" value="${relatorioForm.valoresSub[loop]}"/>
																</c:if>
																<c:if test="${descritorSub.numerico}">
																	<html:text maxlength="${descritorSub.comprimentoDescritor}"  onkeyup="return formatarInteiro(this);" onclick="marcar('check_sub${loop}');javascript:habilitar('hidden_sub${loop}');" property="valoresSub" value="${relatorioForm.valoresSub[loop]}"/> (Apenas Números)
																</c:if>
																<!-- 
																	MARONI@STEFANINI
																	RM#7589 - 14/02/2017
																	Acrescentado tipo data com mascara para consulta de bem.
																 -->
																<c:if test="${descritorSub.data}">
																	<html:text maxlength="10" onclick="marcar('check_sub${loop}');javascript:habilitar('hidden_sub${loop}');" onkeypress="mascaraData(this)" property="valoresSub" value="${relatorioForm.valoresSub[loop]}"/>
																</c:if>
															</td>
														</c:if>
														<c:if test="${descritorSub.lista}">
															<td style="white-space: nowrap;">
																<html:hidden value="${descritorSub.id}" property="idDescritores"/>
																<html:select styleId="valoresDeOpcoes" onclick="marcar('check_sub${loop}');javascript:habilitar('hidden_sub${loop}');"  property="valoresSub" >
																	<html:option value="0">-- SELECIONE --</html:option>
																	<logic:iterate property="descritorOpcoes" name="descritorSub" id="opcao" indexId="i">
																		<html:option value="${opcao.valor}"/>		
																	</logic:iterate>		
																</html:select>
															</td>
														</c:if>
												</tr>
											</logic:iterate>
										</table>
									</c:if>
										</td>
									</tr>
								</logic:notEmpty>
								</table>
							</div>
						</td>
					</tr>						
			</table>
			<table class="subFormulario" width="100%">
				<caption>
					<span onclick="mostrarEsconder('infoLocal');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoLocal_d">&nbsp;&nbsp;&nbsp;</span>
					<span onclick="mostrarEsconder('infoLocal');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoLocal_i">&nbsp;&nbsp;&nbsp;</span>
					Informações Relativas à Localização do Bem
					<html:hidden styleId="hidden_infoLocal" name="relatorioPatrimonioForm" property="infoLocal"/>
				</caption>	
		 			<tr>
		 				<td>
		 					<div id="infoLocalDiv">
		 						<table id="infoLocal" width="100%">
			 						<tr>
						 				<td width="24%"> &nbsp;</td>
									</tr>
									<!--  GENIVAL.GFSF - hotfix#29118 - Alteracao para que o autocomplete se comporte conforme o papel - 04/02/2022 -->
									<c:choose>
									  <c:when test="${relatorioForm.tipoRelatorio == 1}">
									    <% if (gestorGlobal) {%>
									    	<tr>
									      <td>
									        <input id="unidadeGestoraPatrimonial" type="checkbox" name="opcoesBusca" class="noborder"
									        	value="<%= String.valueOf(OpcaoBusca.UNIDADE_GESTORA_PATRIMONIAL)%>" <% if (unidadeGestoraPatrimonial) {%> checked="checked" <%}%> 
									            onchange="$('filtrarUniGestora').value = $('unidadeGestoraPatrimonial').checked" />
									        <label for="unidadeGestoraPatrimonial">Unidade Gestora Patrimonial:</label>
									        <input type="hidden" id="filtrarUniGestora" value="<% if (unidadeGestoraPatrimonial) {%>true<%} else {%>false<%}%>"/>
									      </td>
									      <td onmouseup="Ext.get('unidadeGestoraPatrimonial').dom.checked=true;"
									          onclick="marcar('unidadeGestoraPatrimonial');" colspan="2">
									        <html:select
									                     property="unidadeGestoraPatriminial"
									                     styleId="uni_gestora" style="width:180px;"
									                     onclick="marcarOpcao(this, checkUnidadeGestora);">
									          <html:options collection="unidadesGestoras" property="id"
									                        labelProperty="sigla" />
									        </html:select>
									      </td>
									    </tr>
									    <%} else if (gestorCentro) {%>
									    <tr>
									      <td>
									        <input id="unidadeGestoraPatrimonial" type="checkbox" name="opcoesBusca" class="noborder" checked="checked"
									               onclick="return false;" value="<%= String.valueOf(OpcaoBusca.UNIDADE_GESTORA_PATRIMONIAL)%>" />
									        <label for="unidadeGestoraPatrimonial">Unidade Gestora Patrimonial:</label>
									        <input type="hidden" id="filtrarUniGestora" value="true"/>
									      </td>
									      <td colspan="2">
									        <html:select
									                     property="unidadeGestoraPatriminial"
									                     styleId="uni_gestora" style="width:180px;"
									                     onclick="marcarOpcao(this, checkUnidadeGestora);" value="${relatorioForm.unidadeGestora.id}">
														          <html:options collection="unidadesGestoras" property="id"
														                        labelProperty="sigla" />
														        </html:select>
									      </td>
									    </tr>
									    <%} else {%>
									    <input type="hidden" id="filtrarUniGestora" value="false"/>
									    <html:hidden property="unidadeGestoraPatriminial" value="${relatorioForm.unidadeGestora.id}" styleId="uni_gestora" />
									    <% } %>
									  </c:when>
									  <c:when test="${relatorioForm.tipoRelatorio != 1}">
									    <% if (gestorGlobal) {%>
									    <tr>
									      <td>
									        <input id="unidadeGestoraPatrimonial" type="checkbox" name="opcoesBusca" class="noborder"
									               value="<%= String.valueOf(OpcaoBusca.UNIDADE_GESTORA_PATRIMONIAL)%>" <% if (unidadeGestoraPatrimonial) {%> checked="checked" <%}%> 
									               onchange="$('filtrarUniGestora').value = $('unidadeGestoraPatrimonial').checked" />
									        <label for="unidadeGestoraPatrimonial">Unidade Gestora Patrimonial:</label>
									        <input type="hidden" id="filtrarUniGestora" value="<% if (unidadeGestoraPatrimonial) {%>true<%} else {%>false<%}%>"/>
									      </td>
									      <td onmouseup="Ext.get('unidadeGestoraPatrimonial').dom.checked=true;"
									          onclick="marcar('unidadeGestoraPatrimonial');" colspan="2">
									        <html:select
									                     property="unidadeGestoraPatriminial"
									                     styleId="uni_gestora" style="width:180px;"
									                     onclick="marcarOpcao(this, checkUnidadeGestora);">
									          <html:options collection="unidadesGestoras" property="id"
									                        labelProperty="sigla" />
									        </html:select>
									      </td>
									    </tr>
									    <%} else if (gestorCentro) {%>
									    <tr>
									      <td>
									        <input id="unidadeGestoraPatrimonial" type="checkbox" name="opcoesBusca" class="noborder" checked="checked"
									               disabled="disabled" onclick="return false;" value="<%= String.valueOf(OpcaoBusca.UNIDADE_GESTORA_PATRIMONIAL)%>" />
									        <label for="unidadeGestoraPatrimonial">Unidade Gestora Patrimonial:</label>
									        <input type="hidden" id="filtrarUniGestora" value="true"/>
									      </td>
									      <td colspan="2">
									        <html:select
									                     property="unidadeGestora.id"
									                     styleId="uni_gestora" style="width:180px;"
									                     onclick="marcarOpcao(this, checkUnidadeGestora);" disabled="true">
									          <html:options collection="unidadesGestoras" property="id"
									                        labelProperty="sigla" />
									        </html:select>
									      </td>
									    </tr>
									    <%} else {%>
									    <input type="hidden" id="filtrarUniGestora" value="false"/>
									    <html:hidden property="unidadeGestoraPatrimonial" styleId="uni_gestora" value="${consultaGeralBemForm.unidadeGestora.id}" />
									    <% } %>
									  </c:when>
									</c:choose>
									<tr>
										<c:choose><%--RM#17577: se for local deixa travado a unidade responsavel--%>
											<c:when test="${relatorioForm.papelGPL}">										
												<td style="white-space: nowrap;">
													<input id="uniResp" type="checkbox" name="opcoesBusca" class="noborder"  onclick="return false;"
															value="<%= String.valueOf(OpcaoBusca.UNIDADE)%>" checked="checked"
															onchange="$('filtrarUniResp').value = $('uniResp').checked"/>  
													<label for="uniResp">Unidade Responsável:</label>
													<input type="hidden" id="filtrarUniResp" value="true"/>
												</td>												
												<td>
													<html:text property="unidade.nome" size="80" disabled="true"/>
													<!-- newton.ncs - rm#19763 - 28/05/2021 -->
													<html:hidden name="relatorioForm" property="unidade.id" styleId="uni_origem"/>	
												</td>												
											</c:when>
											<c:when test="${relatorioForm.papelGPUG }"><%-- se for GPUG, libera unidade responsavel e bloqueia a gestora--%>
												<td style="white-space: nowrap;">
													<input id="uniResp" type="checkbox" name="opcoesBusca" class="noborder" 
															value="<%= String.valueOf(OpcaoBusca.UNIDADE)%>" <% if (unidade) {%> checked="checked" <% };%>
															onchange="$('filtrarUniResp').value = $('uniResp').checked" />  
													<label for="uniResp">Unidade Responsável:</label>
													<input type="hidden" id="filtrarUniResp" value="<% if (unidade){%>true<%} else {%>false<%};%>"/>
												</td>												
												<td>											
													<html:select property="unidade.id" style="width:85%;" disabled=" true">
														<html:optionsCollection property="unidadesFiltradasGestoraPatrimonial" value="id" label="codigoNomeConcatenado"/>
													</html:select>
													<!-- newton.ncs - rm#19763 - 28/05/2021 -->
													<html:hidden name="relatorioForm" property="unidade.id" styleId="uni_origem"/>
												</td>												
											</c:when>
											<c:otherwise>
												<td style="white-space: nowrap;">
													<input id="uniResp" type="checkbox" name="opcoesBusca" class="noborder" 
															value="<%= String.valueOf(OpcaoBusca.UNIDADE)%>" <% if (unidade) {%> checked="checked" <% };%>
															onchange="$('filtrarUniResp').value = $('uniResp').checked" /> 
													<label for="uniResp">Unidade Responsável:</label>
													<input type="hidden" id="filtrarUniResp" value="<% if (unidade){%>true<%} else {%>false<%};%>"/>
												</td>												
												<td onmouseup="Ext.get('uniResp').dom.checked=true;" onclick="marcarOpcao(this, checkUnidade); marcarOpcao(this, checkUnidadeFilha);
													$('filtrarUniResp').value = $('uniResp').checked" colspan="2">
													<sipac:unidade property="unidade.id" style="width: 400px;" styleId="uni_origem" onclick="limparCampoUnidadeOrigem()" />
													<html:hidden name="relatorioForm" property="unidade.id" styleId="uni_origem"/>
												</td>											
											</c:otherwise>
										</c:choose>								
									</tr>
									
									<!--  GALILEU@DPF: No DPF quem pode mais pode menos -->
									<% if (gestorCentro || gestorGlobal || usuario.isUserInRole(SipacPapeis.GESTOR_PATRIMONIO_LOCAL)) { %>
										<tr>
											<td style="white-space: nowrap;" colspan="3"> <input type="checkbox" class="noborder" id="incluirUnidadesFilhas" name="opcoesBusca" value="<%= String.valueOf(OpcaoBusca.INCLUIR_UNIDADES_FILHAS)%>" <% if (unidadesFilhas) {%> checked="checked" <% };%>/> 
												<label for="incluirUnidadesFilhas">Incluir Unidades Vinculadas à Unidade Responsável</label> 
											</td>
										</tr>
									<% } %>
									<tr>
										<td style="white-space: nowrap;"> 
											<input id="respSetor" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.RESPONSAVEL_SETOR)%>"  <% if (respSetor) {%> checked="checked" <% };%>/>
												<label for="respSetor">Responsável pela Unidade:</label>
											</td>
										<td onmouseup="Ext.get('respSetor').dom.checked=true;" onclick="marcarOpcao(this,checkRespSetor);" colspan="2" nowrap="nowrap">
											<html:hidden styleId="idServidorResp" property="responsavelSetor.id" styleClass="contentLink"/>
											<html:text property="responsavelSetor.pessoa.nome" styleId="nomeServidorResp" size="80"/>
				
											<ajax:autocomplete source="nomeServidorResp" target="idServidorResp"
												baseUrl="/sipac/autocompleteServidor" className="autocomplete"
												indicator="indicatorServResp" minimumCharacters="3" parameters=""
												parser="new ResponseXmlToHtmlListParser()" />
												<span id="indicatorServResp" style="display:none; "> <img src="/sipac/img_css/indicator.gif"  alt="Carregando..." title="Carregando..."/> </span>
										</td>
									</tr>
									<c:if test="${patrimonioMBean.localidadeHabilitada}">
										<tr>
											<td style="white-space: nowrap;"> <input id="localidade" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.LOCALIDADE)%>" <% if (localidade) {%> checked="checked" <% };%>/>
												<label for="localidade">Localidade Responsável:</label>
											</td>
											<!-- GENIVAL.GFSF - hotfix#29228 - alteracao para que o autocomplite se adapte ao perfil - 04/02/2022 -->
											<% if (gestorGlobal || gestorCentro) {%>
												<td onmouseup="Ext.get('localidade').dom.checked=true;" onclick="marcarOpcao(this, checkLocal);"> 
													<input id="modelLocal" name="modelLocal"  type="text" size="85%"  value="${modelLocal}"/>
													<input id="idLocalidade" name="localidade.id" type="hidden" class="contentLink" value="${localidade}"/>
													<input id="idUnidade" type="hidden" value="${relatorioForm.unidade.id}" />
													<span id="indicator1" style="display:none; "><img src="/sipac/img_css/indicator.gif" /></span>
										
													<html:hidden property="localidade.descricao" value="${modelLocal}"/>
													<ajax:autocomplete 
									  				source="modelLocal"
									 	 			target="idLocalidade"
									  				baseUrl="/sipac/autocompleteLocalidade"
									  				className="autocomplete"
									  				indicator="indicator1"
									  				minimumCharacters="3"
									  				
													parameters="envio=true,undResp={uni_origem},undGestora={uni_gestora},filtrarPorUndResp={filtrarUniResp},filtrarPorUndGestora={filtrarUniGestora}"
									  				parser="new ResponseXmlToHtmlListParser()"
									   				/>
												</td>
											<%} else {%>
												<td onmouseup="Ext.get('localidade').dom.checked=true;" onclick="marcarOpcao(this, checkLocal);"> 
													<input id="modelLocal" name="modelLocal"  type="text" size="85%"  value="${modelLocal}"/>
													<input id="idLocalidade" name="localidade.id" type="hidden" class="contentLink" value="${localidade}"/>
													<input id="idUnidade" type="hidden" value="${relatorioForm.unidade.id}" />
													<span id="indicator1" style="display:none; "><img src="/sipac/img_css/indicator.gif" /></span>
										
													<html:hidden property="localidade.descricao" value="${modelLocal}"/>
													<ajax:autocomplete 
									  				source="modelLocal"
									 	 			target="idLocalidade"
									  				baseUrl="/sipac/autocompleteLocalidade"
									  				className="autocomplete"
									  				indicator="indicator1"
									  				minimumCharacters="3"
									  				
													parameters="envio=true,undResp={uni_origem},undGestora={uni_gestora},filtrarPorUndResp=true,filtrarPorUndGestora={filtrarUniGestora}"
									  				parser="new ResponseXmlToHtmlListParser()"
									   				/>
												</td>
											<%} %>
										</tr>
										<tr>
											<td style="white-space: nowrap;"> 
												<input id="respLocalidade" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.RESPONSAVEL_LOCALIDADE)%>"  <% if (respLocalidade) {%> checked="checked" <% };%>/>
												<label for="respLocalidade">Responsável pela Localidade:</label>
												</td>
											<td onmouseup="Ext.get('respLocalidade').dom.checked=true;" onclick="marcarOpcao(this,checkRespLocalidade);" colspan="2" nowrap="nowrap">
												<html:hidden styleId="idLocalidadeResp" property="responsavelLocal.id" styleClass="contentLink"/>
												<html:text property="responsavelLocal.pessoa.nome" styleId="nomeLocalidadeResp" size="80"/>
												<ajax:autocomplete source="nomeLocalidadeResp" target="idLocalidadeResp"
													baseUrl="/sipac/autocompleteServidor" className="autocomplete"
													indicator="indicatorLocalidadeResp" minimumCharacters="3" parameters=""
													parser="new ResponseXmlToHtmlListParser()" />
													<span id="indicatorLocalidadeResp" style="display:none; "> <img src="/sipac/img_css/indicator.gif"  alt="Carregando..." title="Carregando..."/> </span>
											</td>
										</tr>
									</c:if>
			 					</table>
		 					</div>		 					
		 				</td>
		 			</tr>	 			
			</table>
			<table class="subFormulario" width="100%">
				<caption>
					<span onclick="mostrarEsconder('infoDocumentos');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoDocumentos_d">&nbsp;&nbsp;&nbsp;</span>
					<span onclick="mostrarEsconder('infoDocumentos');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoDocumentos_i">&nbsp;&nbsp;&nbsp;</span>
					Informações Relativas a Documentos
					<html:hidden styleId="hidden_infoDocumentos" name="relatorioPatrimonioForm" property="infoDocumentos"/>
				</caption>	
	 			<tr>
	 				<td>
	 					<div id="infoDocumentosDiv">
	 						<table id="infoDocumentos" width="100%">
		 						<tr>
					 				<td width="24%"> &nbsp;</td>
								</tr>							
								<!-- newton.ncs - RDM#43627 
									2. documentação:
									b. Incluir na consulta de bens (informações relativas a documentos)
									. Termo de desmembramento
									c. Criar na aba Consulta a opção Termo de Desmembramento. 
								-->
								<tr>
									<td style="white-space: nowrap;">
										<input id="docTermoDesmembramento" type="checkbox" name="opcoesBusca" value="<%= String.valueOf(OpcaoBusca.TERMO_DESMEMBRAMENTO)%>" <% if (termoDesmembramento) {%> checked="checked" <% };%> />
										<label for="docTermoDesmembramento">Termo Desmembramento:</label>
									</td>
									<td onmouseup="Ext.get('docTermoDesmembramento').dom.checked=true;" onclick="marcarOpcao(this,checkTermoDesmembramento);">
										<html:text styleId="numTermoDesmembramento" property="numeroTermoDesmembramento" size="12" onkeyup="return(formatarInteiro(this, event))"/> / 
										<html:text styleId="anoDoTermoDesmembramento" property="anoTermoDesmembramento" size="4" onkeyup="return(formatarInteiro(this, event))"/>
									</td>
								</tr>
															
								<tr>
									<td style="white-space: nowrap;">
										<input id="bensNaoLocalizados" type="checkbox" name="opcoesBusca" value="<%= String.valueOf(OpcaoBusca.TERMO_BENS_NAO_LOCALIZADOS)%>" <% if (termoBensNaoLocalizado) {%> checked="checked" <% };%> />
										<label for="bensNaoLocalizados">Nº do Termo de Localização/Ano:</label>
									</td>
									<td onmouseup="Ext.get('bensNaoLocalizados').dom.checked=true;" onclick="marcarOpcao(this,checkTermoBemNaoLocalizado);">
										<html:text styleId="numTermoBensNaoLocalizados" property="numeroTermoBensNaoLocalizados" size="12" onkeyup="return(formatarInteiro(this, event))"/> / 
										<html:text styleId="anoDoTermoBensNaoLocalizados" property="anoTermoBensNaoLocalizados" size="4" onkeyup="return(formatarInteiro(this, event))"/>
									</td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">
										<input id="docTermoTombamento" type="checkbox" name="opcoesBusca" value="<%= String.valueOf(OpcaoBusca.TERMO_RESPONSABILIDADE)%>" <% if (termoResponsabilidade) {%> checked="checked" <% };%> />
										<label for="docTermoTombamento">${patrimonioMBean.nomeDocumentoTermoTombamento}:</label>
									</td>
									<td  onmouseup="Ext.get('docTermoTombamento').dom.checked=true;" onclick="marcarOpcao(this,checkTermo);">
										<html:text styleId="numTermo" property="numeroTermo" size="12" onkeyup="return(formatarInteiro(this, event))"/> / 
										<html:text styleId="anoDoTermo" property="anoTermo" size="4" onkeyup="return(formatarInteiro(this, event))"/>
									</td>
								</tr>
								<tr>
									<td> 
										<input id="periodoTransferencia" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.PERIODO_TRANSFERENCIA)%>" <% if (periodoTransferencia) {%> checked="checked" <% };%>/> 
										<label for="periodoTransferencia">Período Transferência:</label>
									</td>
									<td onmouseup="Ext.get('periodoTransferencia').dom.checked=true;" onclick="marcarOpcao(this,checkPeriodoTransferencia);" >
										<sipac:calendar property="dataInicialTransferencia"/> a <sipac:calendar property="dataFinalTransferencia"/>
									</td>
								</tr>
								<c:if test="${patrimonioMBean.notaRecebimentoHabilitado}">	
									<tr>
										<td style="white-space: nowrap;">
											<input id="notaRecebimento" type="checkbox" name="opcoesBusca" value="<%= String.valueOf(OpcaoBusca.NOTA_RECEBIMENTO)%>" <% if (notaRecebimento) {%> checked="checked" <% };%> />
											<label for="notaRecebimento">Nota de Recebimento:</label>
										</td>
										<td onmouseup="Ext.get('notaRecebimento').dom.checked=true;" onclick="marcarOpcao(this,checkNotaReceb);">
											<html:text styleId="numNota" property="numeroNota" size="12" onkeyup="return(formatarInteiro(this, event))"/> / 
											<html:text styleId="anoNotaRecebimento" property="anoNotaReceb" size="4" onkeyup="return(formatarInteiro(this, event))"/>
										</td>
									</tr>
								</c:if>
								<tr>
									<td style="white-space: nowrap;">
										<input id="guiaMovimentacao" type="checkbox" name="opcoesBusca" value="<%= String.valueOf(OpcaoBusca.GUIA_MOVIMENTACAO)%>" <% if (guiaMovimentacao) {%> checked="checked" <% };%> />
										<label for="guiaMovimentacao">Guia de Movimentação/Recolhimento:</label>
									</td>
									<td onmouseup="Ext.get('guiaMovimentacao').dom.checked=true;" onclick="marcarOpcao(this,checkGuia);">
										<html:text styleId="numeroGuia" property="guia.numero" size="12" onkeyup="return(formatarInteiro(this, event))"/> / 
										<html:text styleId="anoGuia" property="guia.ano" size="4" onkeyup="return(formatarInteiro(this, event))"/>
									</td>
								</tr>
		 					</table>
	 					</div>	 					
	 				</td>
	 			</tr>
			</table>
			<table class="subFormulario" width="100%" align="center">
		 		<caption>
		 			<span onclick="mostrarEsconder('infoAquisicao');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoAquisicao_d">&nbsp;&nbsp;&nbsp;</span>
					<span onclick="mostrarEsconder('infoAquisicao');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoAquisicao_i">&nbsp;&nbsp;&nbsp;</span>
		 			Informações Relativas à Aquisição
		 			<html:hidden styleId="hidden_infoAquisicao" name="relatorioPatrimonioForm" property="infoAquisicao"/>
		 		</caption>
		 		<tr>
		 			<td>
		 				<div id="infoAquisicaoDiv">
		 					<table id="infoAquisicao" width="100%">
			 					<tr>
					 				<td width="24%"> &nbsp;</td>
								</tr>
								<tr>
									<td>
										<input id="buscaEmpenho"  type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.EMPENHO)%>" <% if (empenho) {%> checked="checked" <% };%>/>
										<label for="buscaEmpenho">Empenho(Número/Ano - Gestora):</label>
									</td>
									<td onmouseup="Ext.get('buscaEmpenho').dom.checked=true;">
										<html:text styleId="numeroEmpenho" onfocus="forms[0].buscaEmpenho.checked = true;" property="empenho.documento" size="9" onkeyup="formatarInteiro(this, event)"/>
										/
										<html:text styleId="anoEmpenho" onfocus="forms[0].buscaEmpenho.checked = true;" property="empenho.ano" size="5" maxlength="4" onkeyup="formatarInteiro(this, event)"/> 
											
										<html:select styleId="unidadeGestora" property="empenho.unidadeGestora.id" onfocus="forms[0].buscaEmpenho.checked = true;">
											<html:option  value="0">-- SELECIONE --</html:option>
											<html:options collection="unidadesGestoras" property="id" labelProperty="sigla"/>
										</html:select>
									</td>
								</tr>
								<tr>
					 				<td style="white-space: nowrap;"> 
					 	 				<input id="dataDoEmpenho" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DATA_EMPENHO)%>" <% if (dataEmpenho) {%> checked="checked" <% };%>/>
					 					<label for="dataDoEmpenho">Período de Emissão do Empenho:</label>
					 				</td>
					 				<td onmouseup="Ext.get('dataDoEmpenho').dom.checked=true;" onclick="marcarOpcao(this,checkDataEmpenho);" >
					 					<sipac:calendar property="dataInicioEmpenho"/> a <sipac:calendar property="dataFinalEmpenho"/>
					 				</td>
					 			</tr>
					 			<tr> 
					 				<td style="white-space:  nowrap;">
					 	 		 		<input id="checkUnidadeGestoraCompra" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.UG_DE_COMPRA)%>" <% if (unidadeCompra) {%> checked="checked" <% };%>/>
					 	 				<label for="checkUnidadeGestoraCompra">UG de Compra:</label>
					 	 			</td>
					 				<td onmouseup="Ext.get('checkUnidadeGestoraCompra').dom.checked=true;" onclick="marcarOpcao(this,checkUnidadeCompra);">
					 				 	<sipac:unidade  compradora="true" property="unidadeCompra.id" style="width: 400px;" styleId="uni_compra" /> 
					 				</td> 
					 			</tr>												
					 			<tr>
					 				<td style="white-space: nowrap;"> 
					 	 				<input id="checkCentroCusto2" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.CENTRO_CUSTO)%>" <% if (centroCusto) {%> checked="checked" <% };%>/>
					 					<label for="checkCentroCusto2">Centro de Custo:</label>
					 				</td>
					 				<td onmouseup="Ext.get('checkCentroCusto2').dom.checked=true;" onclick="marcarOpcao(this,checkCentroCusto);">
					 				 	<sipac:unidade property="centroCusto.id" style="width: 400px;" styleId="uni_centro" />
					 				</td>
					 			</tr>
						 		<tr> 
					 				<td style="white-space: nowrap;">
					 	 				<input id="checkNotaFisc" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.NOTA_FISCAL)%>" <% if (notaFiscal) {%> checked="checked" <% };%>/>
					 	 				<label for="checkNotaFisc">Nota Fiscal/Série:</label>
					 	 			</td>
					 				<td onmouseup="Ext.get('checkNotaFisc').dom.checked=true;" onclick="marcarOpcao(this,checkNotaFiscal);">
					 					<html:text styleId="numeroNotaFisc" onkeyup="return(formatarInteiro(this, event))" property="numeroNotaFiscal" size="12" maxlength="12"/>
					 	  				<html:text styleId="serieNota" property="notaSerie" size="6" maxlength="6"/>
					 	  			</td>
					 			</tr>
					  			<tr>
					 				<td style="white-space: nowrap;"> 
					 	 				<input id="checkProcCompra" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.PROCESSO_COMPRA)%>" <% if (processoCompra) {%> checked="checked" <% };%>/>
					 	 				<label for="checkProcCompra">Número/Ano  Processo de Compra:</label>
					 	 			</td>
					 				<td onmouseup="Ext.get('checkProcCompra').dom.checked=true;" onclick="marcarOpcao(this,checkProcessoCompra);">
					 					<html:text styleId="procCompra" onkeyup="return(formatarInteiro(this, event))" property="processoCompra" size="12" maxlength="12"/> 
					 					/ <html:text styleId="anoProcessoCompra" onkeyup="return(formatarInteiro(this, event))" property="anoProcCompra" size="4" maxlength="4"/>
					 				</td>
						 		</tr>
					 			<tr>
					 				<td style="white-space: nowrap;">
					 					<input id="checkTipoEntradaBem" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.TIPO_DE_ENTRADA)%>" <% if (tipoEntrada) {%> checked="checked" <% };%>/>
					 					<label for="checkTipoEntradaBem">Tipo de Entrada:</label>
					 				</td>
					 				<td onmouseup="Ext.get('checkTipoEntradaBem').dom.checked=true;" onclick="marcarOpcao(this,checkTipoEntrada);">
					 					<html:select styleId="tiposEntradasBem" property="tipoEntrada" style="width:250">
											<html:option value="0">--SELECIONE--</html:option>
											<html:options collection="tiposEntradaBem" property="id" labelProperty="descricao"/>
										</html:select>
					 	
					 				</td>
					 			</tr>
					 			<tr>
					 				<td style="white-space: nowrap;"> 
					 	 				<input id="dataEntrada" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DATA_ENTRADA)%>" <% if (dataEntrada) {%> checked="checked" <% };%>/>
					 					<label for="dataEntrada">Data de Entrada:</label>
					 				</td>
					 				<td onmouseup="Ext.get('dataEntrada').dom.checked=true;"  onclick="marcarOpcao(this,checkDataEntrada);" >
					 					<sipac:calendar property="dataInicialEntrada"/> a <sipac:calendar property="dataFinalEntrada"/>
					 				</td>
					 			</tr>
						 	<tr>
					 		</tr>
					 		<tr>
					 			<td style="white-space: nowrap;"> 
					 	 			<input id="fornecedores" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.FORNECEDOR)%>" <% if (fornecedor) {%> checked="checked" <% };%>/>
					 				<label for="fornecedores">Fornecedor:</label>
					 			</td>
					 			<td onmouseup="Ext.get('fornecedores').dom.checked=true;"  onclick="marcarOpcao(this,checkFornecedor);">
					 				<input id="modelForn" name="modelForn" type="text" size="85" onkeypress="$(fornecedor).checked=true" value="${param['modelForn']}"/>
									<input id="fornecedor.id" name="fornecedor.id" type="hidden" class="contentLink" value="${param['fornecedor.id']}"/>
									<span id="indicator" style="display:none; "><img src="/sipac/img_css/indicator.gif" /></span>
										<ajax:autocomplete
							 				source="modelForn"
											target="fornecedor.id"
											baseUrl="/sipac/autocompletePessoa"
											className="autocomplete"
											indicator="indicator"
											minimumCharacters="3"
											parameters="tipo=J"
											parser="new ResponseXmlToHtmlListParser()"/>
					 			</td>
							 </tr>
							 <tr>
								<td style="white-space: nowrap;">
									<input id="checkValores" type="checkbox" name="opcoesBusca" value="<%= String.valueOf(OpcaoBusca.VALOR_FAIXA)%>" <% if (valorFaixa) {%> checked="checked" <% };%> />
									<label for="checkValores">Valor do Bem:</label>
								</td>
								<td  onmouseup="Ext.get('checkValores').dom.checked=true;" onclick="marcarOpcao(this,checkValor);">
									<html:text property="valorBemInicio" size="11" styleId="valor" maxlength="12" onkeydown="return formataValor(this, event, 2);"/>
									a
									<html:text property="valorBemFinal" size="11" styleId="valor" maxlength="12" onkeydown="return formataValor(this, event, 2);"/>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="checkDocumentos" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DOCUMENTO)%>" <% if (documento) {%> checked="checked" <% };%>/> 
				 					<label for="checkDocumentos">Documento:</label>
									</td>
									<td onmouseup="Ext.get('checkDocumentos').dom.checked=true;" onclick="marcarOpcao(this, checkDocumento);">
										<html:select styleId="tiposDocumentos" property="documento" style="width:250">
										<html:option value="0">--SELECIONE--</html:option>
										<html:options collection="tipoDocumentos" property="id" labelProperty="descricao"/>
									</html:select>
								</td>
							</tr>
			 				</table>
		 				</div>		 				
		 			</td>
		 		</tr>
		</table>
		<table class="subFormulario" width="100%">
			<caption>
				<span onclick="mostrarEsconder('infoRecolhimento');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoRecolhimento_d">&nbsp;&nbsp;&nbsp;</span>
				<span onclick="mostrarEsconder('infoRecolhimento');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoRecolhimento_i">&nbsp;&nbsp;&nbsp;</span>
				Informações Relativas ao Recolhimento
				<html:hidden styleId="hidden_infoRecolhimento" name="relatorioPatrimonioForm" property="infoRecolhimento"/>
			</caption>
			<tr>
				<td>
					<div id="infoRecolhimentoDiv">
						<table id="infoRecolhimento" width="100%">
							<tr>
								<td width="24%"> &nbsp;</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="checkPeriodoRecolhim" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.PERIODO_RECOLHIMENTO)%>" <% if (periodoRecolhimento) {%> checked="checked" <% };%>/>
									<label for="checkPeriodoRecolhim">Período:</label>
								</td>
								<td onmouseup="Ext.get('checkPeriodoRecolhim').dom.checked=true;" onclick="marcarOpcao(this,checkPeriodoRecolhimento);">
									<sipac:calendar property="dataInicioRecolhimento"/> a <sipac:calendar property="dataFinalRecolhimento"/>
								</td >
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="buscaGestoraRecolhim" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.GESTORA_RECOLHIMENTO)%>" <% if (gestoraRecolhimento) {%> checked="checked" <% };%>/>
									<label for="buscaGestoraRecolhim">Gestora:</label>
								</td>
								<td onmouseup="Ext.get('buscaGestoraRecolhim').dom.checked=true;" onclick="marcarOpcao(this,checkGestoraRecolhimento);">
									<html:select styleId="variasUnidadesGestoras" property="gestoraRecolhimento.id" onfocus="forms[0].buscaGestoraRecolhimento.checked = true;">
										<html:option  value="0">-- SELECIONE --</html:option>
										<html:options collection="unidadesGestoras" property="id" labelProperty="sigla"/>
									</html:select>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;" colspan="3">
									<input id="bensRecolhidos" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.BENS_RECOLHIDOS)%>" <% if (bensRecolhidos) {%> checked="checked" <% };%>/>  
									<label for="bensRecolhidos">Desconsiderar Bens Recolhidos</label>
								</td>
							</tr>
						</table>
					</div>					
				</td>
			</tr>
		</table>
		<table class="subFormulario" width="100%">
			<caption>
				<span onclick="mostrarEsconder('infoAlienacao');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoAlienacao_d">&nbsp;&nbsp;&nbsp;</span>
				<span onclick="mostrarEsconder('infoAlienacao');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoAlienacao_i">&nbsp;&nbsp;&nbsp;</span>
				Informações Relativas à Alienação/Baixa
				<html:hidden styleId="hidden_infoAlienacao" name="relatorioPatrimonioForm" property="infoAlienacao"/>
			</caption>
			<tr>
				<td>
					<div id="infoAlienacaoDiv">
						<table id="infoAlienacao" width="100%">
							<tr>
								<td width="24%"> &nbsp;</td>
							</tr>
				  			<tr>
				 				<td style="white-space: nowrap;"> 
				 	 				<input id="termAlienacao" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.TERMO_ALIENACAO)%>" <% if (termoAlienacao) {%> checked="checked" <% };%>/>
				 	 				<label for="termAlienacao">Termo de Alienação/Baixa:</label>
				 	 			</td>
				 				<td onmouseup="Ext.get('termAlienacao').dom.checked=true;" onclick="marcarOpcao(this,checkTermoAlienacao);">
				 					<html:text styleId="numeroAlienacao" onkeyup="return(formatarInteiro(this, event))" property="numAlienacao" size="12" maxlength="12"/> 
				 					/ <html:text styleId="periodoAlienacao" onkeyup="return(formatarInteiro(this, event))" property="anoAlienacao" size="4" maxlength="4"/>
				 				</td>
					 		</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="dataAliena" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DATA_ALIENACAO)%>" <% if (dataAlienacao) {%> checked="checked" <% };%>/> 
				 					<label for="dataAliena">Período da Alienação/Baixa:</label>
								</td>
								<td onmouseup="Ext.get('dataAliena').dom.checked=true;"   onclick="marcarOpcao(this, checkDataAlienacao);">
									<sipac:calendar property="dataInicioAlienacao"/> a <sipac:calendar property="dataFinalAlienacao"/>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="tipoDeAlienacao" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.TIPO_ALIENACAO)%>"   <% if (tipoAlienacao) {%> checked="checked" <% };%> />
									<label for="tipoDeAlienacao">Tipo da Alienação/Baixa:</label>
								</td>
								<td onmouseup="Ext.get('tipoDeAlienacao').dom.checked=true;" onclick="marcarOpcao(this,checkTipoAlienacao);">
									<html:select styleId="denomTipoAlienacao" property="tipoAl" >
										<html:options collection="tiposAlienacao"  property="id" labelProperty="denominacao" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
										<input id="checkAlienacao" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.PROCESSO_ALIENACAO)%>" <% if (processoAlienacao) {%> checked="checked" <% };%>/>
										<label for="checkAlienacao">Processo de Alienação/Baixa:</label>
									</td>
								<c:if test="${patrimonioMBean.utilizaProtocolo}">
									<td  onmouseup="Ext.get('checkAlienacao').dom.checked=true;"  onclick="marcarOpcao(this,checkProcessoAlienacao);">
										<html:text styleId="radicalProcAlienacao" onkeyup="return(formatarInteiro(this, event))" property="radicalProcAlienacao" size="5" maxlength="5" value="${protocoloMBean.numeroRadicalPadraoProtocolo}"/>.
										<html:text styleId="numProcAlienacao"     onkeyup="return(formatarInteiro(this, event))" property="numeroProcAlienacao"  size="6" maxlength="6"/>/
										<html:text styleId="anoProcessAlienacao"  onkeyup="return(formatarInteiro(this, event))" property="anoProcAlienacao"     size="4" maxlength="4"/>-
										<html:text styleId="dvProcessAlienacao"   onkeyup="return(formatarInteiro(this, event))" property="dvProcAlienacao"      size="2" maxlength="2"/> (radical.número/ano-dv)
									</td >
								</c:if>
								<c:if test="${!patrimonioMBean.utilizaProtocolo}">
									<td onmouseup="Ext.get('checkAlienacao').dom.checked=true;" onclick="marcarOpcao(this,checkProcessoAlienacao);">
										<html:text styleId="numDoProcAlienacao"   onkeyup="return(formatarProtocolo(this,event))" property="novoProcesso"        size="20" maxlength="20"/> 
									</td>
								</c:if>
							</tr>
						</table>
					</div>					
				</td>
			</tr>
		</table>
		<table class="subFormulario" width="100%">
			<caption>
				<span onclick="mostrarEsconder('infoAcautelamento');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoAcautelamento_d">&nbsp;&nbsp;&nbsp;</span>
				<span onclick="mostrarEsconder('infoAcautelamento');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoAcautelamento_i">&nbsp;&nbsp;&nbsp;</span>
				Informações Relativas ao Acautelamento
				<html:hidden styleId="hidden_infoAcautelamento" name="relatorioPatrimonioForm" property="infoAcautelamento"/>
			</caption>
			<tr>
				<td>
					<div id="infoAcautelamentoDiv">
						<table id="infoAcautelamento" width="100%">
							<tr>
		 						<td width="24%"> &nbsp;</td>
							</tr>
							
							<tr>
								<td style="white-space: nowrap;">
	 								<input id="opcaoAcautelador" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.ACAUTELADOR)%>" <% if (acautelador) {%> checked="checked" <% };%> />
	 								<label for="opcaoAcautelador">Detentor:</label>
								</td>
								<td onmouseup="Ext.get('opcaoAcautelador').dom.checked=true;"  onclick="marcarOpcao(this, checkAcautelador);"  >
									<html:hidden styleId="idServidor" property="acautelador.id" styleClass="contentLink"/>
									<html:text property="acautelador.pessoa.nome" styleId="nomeServidor" size="80"/>
		
									<ajax:autocomplete source="nomeServidor" target="idServidor"
										baseUrl="/sipac/autocompleteServidor" className="autocomplete"
										indicator="indicatorServ" minimumCharacters="3" parameters=""
										parser="new ResponseXmlToHtmlListParser()" />
		
										<span id="indicatorServ" style="display:none; "> <img src="/sipac/img_css/indicator.gif"  alt="Carregando..." title="Carregando..."/> </span>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
		 							<input id="opcaoNumCautela" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.NUM_CAUTELA)%>" <% if (numCautela) {%> checked="checked" <% };%>/>
		 							<label for="opcaoNumCautela">Número do Termo:</label>
		 						</td>
		
								<td onmouseup="Ext.get('opcaoNumCautela').dom.checked=true;"  onclick="marcarOpcao(this,checkNumCautela);">
									<html:text styleId="opcaoNumeroCautela" property="numCautela" onkeypress="return formatarInteiro(this);" size="12" maxlength="12"/> /	<html:text styleId="anoDaCautela" property="anoCautela" onkeypress="return formatarInteiro(this);" size="4" maxlength="4"/>
								</td >
							</tr>
							<tr>
								<td style="white-space: nowrap;">
		 							<input id="opcaoPeriodoCautela" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.PERIODO_CAUTELA)%>" <% if (periodoCautela) {%> checked="checked" <% };%>/> 
				 					<label for="opcaoPeriodoCautela">Período de Cautela:</label>
		 						</td>
		 
		 						<td  onmouseup="Ext.get('opcaoPeriodoCautela').dom.checked=true;" onclick="marcarOpcao(this, checkPeriodoCautela);">
		 							<sipac:calendar property="dataInicioCautela"/> a <sipac:calendar property="dataFinalCautela"/>
								</td>
							</tr>
							<tr>
								<td  style="white-space: nowrap;">
		 							<input id="opcaoDataPrevista" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DATA_PREVISTA)%>" <% if (dataPrevista) {%> checked="checked" <% };%>/> 
				 					<label for="opcaoDataPrevista">Data Prevista para Fechamento:</label>
		 						</td>
		 
		 						<td onmouseup="Ext.get('opcaoDataPrevista').dom.checked=true;"    onclick="marcarOpcao(this, checkPrevista);">
		 							<sipac:calendar property="dataPrevista"/>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
		 							<input id="opcaoDataFechamento" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.DATA_FECHAMENTO)%>" <% if (dataFechamento) {%> checked="checked" <% };%>/> 
				 					<label for="opcaoDataFechamento">Data de Fechamento:</label>
		 						</td>
		 						<td onmouseup="Ext.get('opcaoDataFechamento').dom.checked=true;" onclick="marcarOpcao(this, checkDataFechamento);">
		 							<sipac:calendar property="dataFechamento"/>
								</td>
							</tr>
						</table>
					</div>					
				</td>
			</tr>
		</table>
		
		<table class="subFormulario" width="100%">
			<caption>
				<span onclick="mostrarEsconder('infoAjustesValorContabil');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoAjustesValorContabil_d">&nbsp;&nbsp;&nbsp;</span>
				<span onclick="mostrarEsconder('infoAjustesValorContabil');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoAjustesValorContabil_i">&nbsp;&nbsp;&nbsp;</span>
				Informações Relativas a Ajustes de Valor Contábeis
				<html:hidden styleId="hidden_infoAjustesValorContabil" name="relatorioPatrimonioForm" property="infoAjustesValorContabil"/>
			</caption>
			<tr>
				<td>
					<div id="infoAjustesValorContabilDiv">
						<table id="infoAjustesValorContabil" width="100%">
							<tr>
		 						<td width="24%"> &nbsp;</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="tipoAjustes" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.TIPO_AJUSTES)%>"   <% if (tipoAjustes) {%> checked="checked" <% };%> />
									<label for="tipoAjustes">Tipo do Ajuste:</label>
								</td>
								<td onmouseup="Ext.get('tipoAjustes').dom.checked=true;" onclick="marcarOpcao(this,checkTipoAjustes);">
									<html:select styleId="nomeTipoAjuste" property="tipoAjustes">
										<html:option value="0">--SELECIONE--</html:option>
										<html:options collection="tiposAjuste"  property="id" labelProperty="nome" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="numeroAno" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.NUMERO_ANO)%>"   <% if (numeroAno) {%> checked="checked" <% };%> />
									<label for="numeroAno">Número/Ano:</label>
								</td>
								<td onmouseup="Ext.get('numeroAno').dom.checked=true;" onclick="marcarOpcao(this,checkNumeroAno);">
									<html:text styleId="numeroAjustes" onkeyup="return(formatarInteiro(this, event))" property="numeroAjustes" size="6" maxlength="4"/> 
					 					/ <html:text styleId="anoAjustes" onkeyup="return(formatarInteiro(this, event))" property="anoAjustes" size="4" maxlength="4"/>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="periodoAjuste" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.PERIODO_AJUSTE)%>"   <% if (periodoAjustes) {%> checked="checked" <% };%> />
									<label for="periodoAjuste">Período do Ajuste :</label>
								</td>
								<td onmouseup="Ext.get('periodoAjuste').dom.checked=true;"  onclick="marcarOpcao(this,checkPeriodoAjuste);">
									<sipac:calendar property="dataInicioAjustes"/> a <sipac:calendar property="dataFimAjustes"/>
								</td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">
									<input id="unidadeGestoraPatrimonial2" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.UNIDADE_GESTORA_PATRIMONIAL)%>"   <% if (unidadeGestoraPatrimonial) {%> checked="checked" <% };%> />
									<label for="unidadeGestoraPatrimonial2">Unidade Gestora Patrimonial:</label>
								</td>
								<td onmouseup="Ext.get('unidadeGestoraPatrimonial2').dom.checked=true;"  onclick="marcarOpcao(this,checkUnidadeGestoraPatrimonial2);">
									<%-- <input id="modelUndGesPatriminial" name="modelUndGesPatriminial" type="text" size="85" onkeypress="$(unidadeGestoraPatrimonial).checked=true" value="${param['modelUndGesPatriminial']}"/>
									<input id="unidadeGestoraPatrimonial.id" name="unidadeGestoraPatrimonial.id" type="hidden" class="contentLink" value="${param['unidadeGestoraPatrimonial.id']}"/>
									<span id="indicator" style="display:none; "><img src="/sipac/img_css/indicator.gif" /></span>
										<ajax:autocomplete
							 				source="modelUndGesPatriminial"
											target="unidadeGestoraPatrimonial.id"
											baseUrl="/sipac/autocompletePessoa"
											className="autocomplete"
											indicator="indicator"
											minimumCharacters="3"
											parameters="tipo=J"
											parser="new ResponseXmlToHtmlListParser()"/> --%>
									<html:select property="unidadeGestoraPatriminial" styleId="siglaUndGesPatriminial" style="width:180px;" onclick="marcarOpcao(this, checkUnidadeGestoraPatrimonial);">
										<html:option value="0">--SELECIONE--</html:option>
										<html:options collection="unidadesGestoras" property="id" labelProperty="sigla"/>			
									</html:select>
								</td>
							</tr>
						</table>
					</div>					
				</td>
			</tr>
		</table>
		
		<table class="subFormulario" width="100%">
			<caption>
				<span onclick="mostrarEsconder('infoOutras');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/decrementar_valor.gif')" id="img_infoOutras_d">&nbsp;&nbsp;&nbsp;</span>
				<span onclick="mostrarEsconder('infoOutras');" style="cursor: pointer;background-repeat: no-repeat; background-position: center; background-image: url('/sipac/img_css/contratos/incrementar_valor.gif'); display: none;" id="img_infoOutras_i">&nbsp;&nbsp;&nbsp;</span>
				Outras Informações
				<html:hidden styleId="hidden_infoOutras" name="relatorioPatrimonioForm" property="infoOutras"/>
			</caption>
			<tr>
				<td>
					<div id="infoOutrasDiv">
						<table id="infoOutras" width="100%">
							<tr>
					 			<td width="24%"> &nbsp;</td>
							</tr>
							<%-- sprint#5:feature#37160:opacao de considerar ou nao os bens alienados. O padrao e falso --%>
							<%-- sprint#6:feature#38829:mudando a posicao para o primeiro das outras informacoes --%>
							<tr>
								<td style="white-space: nowrap;" colspan="3">
									<input  type="checkbox" name="opcoesBusca" id="considerarBensAlienadosCh"  class="noborder" value="<%=String.valueOf(OpcaoBusca.CONSIDERAR_BENS_ALIENADOS)%>"  <% if (considerarBensAlienados) {%> checked="checked" <% };%>/>    <label for="considerarBensAlienados">Considerar Bens Alienados</label>
								</td>					
							</tr>
							<tr>
								<td style="white-space: nowrap;" colspan="3">
									<input  type="checkbox" name="opcoesBusca" id="bemTerceiros"  class="noborder" value="<%=String.valueOf(OpcaoBusca.BEM_TERCEIROS)%>"  <% if (bemTerceiros) {%> checked="checked" <% };%>/>    <label for="bemTerceiros">Somente Bens de Terceiros</label>
								</td>
					
							</tr>
							
							<tr>
								<td style="white-space: nowrap;" colspan="3">
									<input id="bensAnulados" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.BENS_ANULADOS)%>" <% if (bensAnulados) {%> checked="checked" <% };%>/>  
									<label for="bensAnulados">Considerar Bens Anulados</label>
								</td>
					
							</tr>
							
							<logic:present name="view">
								<logic:equal name="view" value="relatorioBens">
									<tr>
										<td style="white-space: nowrap;" colspan="3"> 
											
											<input id="impressao" type="hidden" name="opcoesBusca" value="<%=String.valueOf(OpcaoBusca.FORMATO_IMPRESSAO)%>" /> 
											
										</td>
									</tr>
								
								</logic:equal>
								<logic:notEqual name="view" value="relatorioBens">
								<tr>
									<td style="white-space: nowrap;" colspan="3"> 
										<input onclick="exibirFormatosArquivo();" id="formatoImpressao" type="checkbox" name="opcoesBusca" class="noborder" value="<%= String.valueOf(OpcaoBusca.FORMATO_IMPRESSAO)%>" <% if (formatoImpressao) {%> checked="checked" <% };%>/> 
										<label for="formatoImpressao">Formato de Impressão</label>
									</td>																
								</tr>
								<%-- FABRICIO@DPF: ADICIONAR A ESCOLHA DOS TIPOS DE ARQUIVOS (PDF OU XLS) NA CONSULTA PARA IMPRESSAO --%>
								<tr>
									<td>
									<div id="formatosArquivoDiv" style="display: none;">
										<table id="formatosArquivo">
											<tr>
												<th>Tipo do Arquivo:</th>
												<td colspan="3">
 													<input type="radio" name="formatoRelatorioDPF" id="PDF" value="<%= String.valueOf(ConstantesPatrimonio.PDF)%>" checked="true">
 													<label for="PDF">PDF</label>
 													<input type="radio" name="formatoRelatorioDPF" id="XLS (Excel)" value="<%= String.valueOf(ConstantesPatrimonio.XLS)%>">
													<label for="XLS">XLS (Excel)</label>
												</td>			
											</tr>
										</table>
									</div>
									</td>
								</tr>
								<%-- FABRICIO@DPF: ALTERACAO TERMINA AQUI --%>
								</logic:notEqual>
							</logic:present>
							<tr>
								<td style="white-space: nowrap;" colspan="3"> 
									<input type="checkbox" name="opcoesBusca" id="especificacao" class="noborder" value="<%= String.valueOf(OpcaoBusca.ESPECIFICACAO_BEM)%>" <% if (especificacao) {%> checked="checked" <% };%>/> 
									<label for="especificacao">Imprimir Especificação</label>
								</td>
							</tr>
							
							<tr >
								
								<td>
									<table>	
										<tr>
											<td style="text-align: right; white-space: nowrap;"> Ordenar por: </td>
											<td style="white-space: nowrap;">
												<html:radio styleId="opcaoDenominacao" property="tipoOrdenacao" value="<%=String.valueOf(TipoOrdenacao.DENOMINACAO)%>" styleClass="noborder"/> Denominação
											</td>
											<td style="white-space: nowrap;">
												<html:radio styleId="opcaoTombamento" property="tipoOrdenacao" value="<%=String.valueOf(TipoOrdenacao.TOMBAMENTO)%>" styleClass="noborder"/> Nº Tombamento
											</td>
								
										</tr>	
							
							
										<tr>
											<td style="text-align: right; white-space: nowrap;"> Agrupar Dados  por: </td>
											<td style="white-space: nowrap;">
												<html:radio styleId="opcaoAgrupar" property="tipoAgrupamento" value="<%=String.valueOf(TipoOrdenacao.GRUPO_MATERIAL)%>" styleClass="noborder"/> ${materialMBean.nomeGrupodoMaterial}
											</td>
											<td style="white-space: nowrap;">
												<html:radio styleId="opcaoAgrupar" property="tipoAgrupamento" value="<%=String.valueOf(TipoOrdenacao.UNIDADE_RESPONSAVEL)%>" styleClass="noborder"/> Unidade Responsável
											</td>
											<td> &nbsp;</td>
										</tr>										
										<%-- FABRICIO@DPF: ADICIONAR O FORMATO XLS DO RELATORIO --%>
										<logic:present name="view">
											<logic:equal name="view" value="relatorioBens">
												<%@include file="/include/opcao_formato_relatorio.jsp" %>
											</logic:equal>
										</logic:present>
										<%-- FABRICIO@DPF: ALTERACAO TERMINA AQUI --%>
									</table>
								</td>
							</tr>
												
						</table>
					</div>					
				</td>
			</tr>
		</table>
	</table>
	
		<!-- Funcionalidade no deve aparecer para Gerar Etiquetas de Patrimnio -->
				<c:if test="${relatorioForm.tipoRelatorio == 1}"> teste
					 <%-- bruno@stefanini.com - #21907 - 16/10/2018 --%>
	                <table class="subFormulario" width="100%">
	                    <caption>
	                        Carregar Arquivos em Lote
	                        <html:hidden styleId="hidden_infoArquivosLote" name="relatorioPatrimonioForm" property="infoArquivosLote"/>
	                    </caption>
	                    <tr>
	                        <td>
	                            <div id="infoArquivosLoteDiv">
	                                <table id="infoArquivosLote" width="100%">
	                                    <th  bgcolor="#FFFFFF" align="left" width="1%" style="width: 1%; text-align: left; white-space: nowrap;">
	                                        Para enviar o arquivo em lote proceda da seguinte forma:
	                                        <ul>
	                                            <li>- Clique sobre Selecionar Arquivo;</li>
	                                            <li>- Selecione o diretório desejado;</li>
	                                            <li>- Selecione o arquivo a ser enviado ao servidor;</li>
	                                            <li>- <strong>APENAS</strong> arquivos no formato <strong>TXT</strong> podem ser anexados;</li>
	                                            <li>- Após selecionar e adicionar o arquivo, clique no botão <strong>PROCESSAR</strong> ao lado do campo;</li>
	                                            <li>- <font color="red">Quantidade máxima de <font size=2><b>100</b></font> números de patrimônio por arquivo enviado;</font></li>
	                                        </ul>
	                                        <c:if test="${relatorioForm.arquivoLoteProcessado}">
	                                            <br/>
	                                            <div style="width: 98%;">
	                                                Resultado processamento arquivo:
	                                                <ul>
	                                                    <li>- Números de tombamentos que foram processados no lote: <b>${relatorioForm.totalTombamentosArquivoLote}</b>;</li>
	                                                    <li>- <font color="red">Números de tombamentos importados com sucesso: <b>${relatorioForm.qtdTombamentosArquivoLoteImportadosSucesso}</b>;</font></li>
	                                                    <li>- Total de linhas do arquivo: <b>${relatorioForm.totalLinhasArquivoLote}</b>;</li>
	                                                </ul>
	                                            </div>
	                                        </c:if>
	                                    </th>
	                                    <td bgcolor="#FFFFFF" align="left">
	                                        <f:view>
	                                            <img id="progressbar" src="./img_css/patrimonio/loading.jpg" style="display:none"/>
	                                            <div id="bip" style="top:-14px; position:relative; left:145px;"></div>
	                                            <html:file name="relatorioForm" property="file" title="Arquivo" accept=".txt"/>
	                                            
	                                            <h:commandButton value="Processar Arquivo" title="Processar Arquivo" alt="Processar Arquivo"
	                                                image="/img_css/patrimonio/upload.png" style="top:12px; position:relative; left:25px;"
	                                                onclick="javascript:loadArquivoLote();"/>
	                                    </f:view>
	                                </td>
	                            </table>
	                        </div>
	                    </td>
	                </tr>
	                </table>
	             </c:if>   
    
	<table width="100%" class="formulario">
		<tfoot>
			<tr styleId="botaoConsultar"><%-- fsilva1@stefanini.com - #15593 - 31/01/2018 - Alleração na apresentação de pesquisa de bem. --%>
				<logic:present name="view">
					<logic:present name="selecao">
						<input id="seleciona" type="hidden" name="selecionar" value="true"/>		
					</logic:present>
					<logic:equal name="alterarLocalBem" value="true">
						<input id="alteraLocal" type="hidden" name="alterarLocal" value="true"/>		
					</logic:equal>
					<logic:equal name="garantiaBem" value="true">
						<input id="consultaGarantiaBem" type="hidden" name="consultarGarantiaBem" value="true"/>		
					</logic:equal>
					<logic:equal name="consultaHistorico" value="true">
						<input id="consultaHistoricoBem" type="hidden" name="consultarHistoricoBem" value="true"/>		
					</logic:equal>
					<logic:equal name="desmembrarBem" value="true">
						<input id="desmembraBens" type="hidden" name="desmembrarBens" value="true"/>		
					</logic:equal>
					<logic:equal name="colecoesBem" value="true">
						<input id="colecao" type="hidden" name="colecoes" value="true"/>		
					</logic:equal>
					<logic:equal name="alterarBem" value="true">
						<input id="alteraBem" type="hidden" name="alterarBem" value="true"/>		
					</logic:equal>
					<logic:equal name="consultaBens" value="true">
						<input id="consulta" type="hidden" name="consultar" value="true"/>		
					</logic:equal>
					<td align="center"><html:submit  value="Consultar"/>
				</logic:present>
				<logic:notPresent name="view">
					<td align="center"><html:submit  value="Gerar Relatório"/>
				</logic:notPresent>
					<sipac:button styleId="botaoCancelar" action="cancelaPatrimonio" param="destino=index" value="Cancelar" confirma="true"/>					
			</tr>
		</tfoot>
	</table>
</html:form>
<logic:present name="bens">
	<a name="botoes"> </a>
	<%@include file="/patrimonio/consultas/consulta_bens_lista.jsp" %>
	<br/>
	<jsp:include page="paginacao_consulta_geral_bens.jsp"></jsp:include>	
</logic:present>
<br>
<c:if test="${empty mensagensAviso}">
<script language="JavaScript">

function limparCampoUnidadeOrigem(){
	document.forms.formulario.elements.codigo_uni_origem.value = "";
	document.getElementById("uni_origem").value = 0;
}

	location.replace("#botoes");
// GALILEU@DPF: Para remover o check do status bem (antes checado por padrao)
//	marcarOpcao(this,checkStatusBem);

/**
 * MARONI@STEFANINI
 * RM#7589 - 14/02/2017
 * Metodo para adicionar mascara ao campo para resolução da demanda.
 */
function mascaraData(val) {
  var pass = val.value;
  var expr = /[0123456789]/;

  for (i = 0; i < pass.length; i++) {
    // charAt -> retorna o caractere posicionado no índice especificado
    var lchar = val.value.charAt(i);
    var nchar = val.value.charAt(i + 1);

    if (i == 0) {
      // search -> retorna um valor inteiro, indicando a posição do inicio da primeira
      // ocorrência de expReg dentro de instStr. Se nenhuma ocorrencia for encontrada o método retornara -1
      // instStr.search(expReg);
      if ((lchar.search(expr) != 0) || (lchar > 3)) {
        val.value = "";
      }

    } else if (i == 1) {

      if (lchar.search(expr) != 0) {
        // substring(indice1,indice2)
        // indice1, indice2 -> será usado para delimitar a string
        var tst1 = val.value.substring(0, (i));
        val.value = tst1;
        continue;
      }

      if ((nchar != '/') && (nchar != '')) {
        var tst1 = val.value.substring(0, (i) + 1);

        if (nchar.search(expr) != 0)
          var tst2 = val.value.substring(i + 2, pass.length);
        else
          var tst2 = val.value.substring(i + 1, pass.length);

        val.value = tst1 + '/' + tst2;
      }

    } else if (i == 4) {

      if (lchar.search(expr) != 0) {
        var tst1 = val.value.substring(0, (i));
        val.value = tst1;
        continue;
      }

      if ((nchar != '/') && (nchar != '')) {
        var tst1 = val.value.substring(0, (i) + 1);

        if (nchar.search(expr) != 0)
          var tst2 = val.value.substring(i + 2, pass.length);
        else
          var tst2 = val.value.substring(i + 1, pass.length);

        val.value = tst1 + '/' + tst2;
      }
    }

    if (i >= 6) {
      if (lchar.search(expr) != 0) {
        var tst1 = val.value.substring(0, (i));
        val.value = tst1;
      }
    }
  }

  if (pass.length > 10)
    val.value = val.value.substring(0, 10);
  return true;
}
	//bruno@stefanini.com - #21907 - 16/10/2018
  // contagem regressiva para o processamento do arquivo. Em media leva 1.14 minutos para que o processamento seja totalmente finalizado. 
  var counter = 83;
  var intervalId = null;
  function action()
  {
    clearInterval( intervalId );
    document.getElementById( 'bip' ).innerHTML = 'Processamento Concluido!';    
  }
  function bip()
  {
    document.getElementById( 'bip' ).innerHTML = counter + ' segundos restantes';
    counter--;
  }

  var eventLocal;
  function registrarEventoTeclado(evt)
  {
      eventLocal = evt;
  }
  document.addEventListener( "keypress", registrarEventoTeclado, true );
  function checkEnter()
  {
      evt = eventLocal;
      if( evt && evt != null && evt != undefined ){
          return ( ( evt.keyCode || evt.which || evt.charCode || 0 ) === 13 );
      }
      return false;
  }
  function loadArquivoLote()
  {
      //bruno@stefanini.com - #21907 - 16/10/2018
      if( checkEnter() ){
          document.getElementById( 'botaoConsultar' ).click();
          return false;
      }
      if( confirm( 'O processamento pode levar alguns minutos. Aguarde a finalizao do mesmo! Continuar?' ) ){
          intervalId = setInterval( bip, 1000 );
          setTimeout( action, counter * 1000 ); 
          document.getElementById( 'progressbar' ).style.display = 'block';
          document.forms[0].action = "<%=request.getContextPath()%>/consultarBensEnviar.do?acao=122";
          return true;
      }
      return false;
  }

</script>
</c:if>
</body>
<%@include file="/include/tail.jsp"%>
