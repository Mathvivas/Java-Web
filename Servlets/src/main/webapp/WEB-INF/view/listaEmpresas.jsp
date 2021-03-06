<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Tomcat não permite o acesso ao diretório WEB-INF -->
<!-- Não se deve acessar o jsp diretamente. O controlador deve redirecionar para o jsp -->
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Empresas</title>
</head>
<body>

	<c:import url="logout-parcial.jsp"/>

	Usuário Logado: ${ usuarioLogado.login }
	
	<br />
	<br />
	<br />

	<c:if test="${ not empty empresa }">
		Empresa ${ empresa } Cadastrada com sucesso!
	</c:if>
		
	Lista de Empresas:	<br />
		
	<ul>
		<c:forEach items="${ empresas }" var="empresa">
				<!-- empresa.getNome() -->
			<li>
				${ empresa.nome } - <fmt:formatDate value="${ empresa.dataAbertura }" 
				pattern="dd/MM/yyyy"/>
				<a href="/gerenciador/entrada?acao=MostrarEmpresa&id=${ empresa.id }">
					Editar</a>
				<a href="/gerenciador/entrada?acao=RemoverEmpresa&id=${ empresa.id }">
					Remover</a>
			</li>	
		</c:forEach>
	</ul>
		
</body>
</html>