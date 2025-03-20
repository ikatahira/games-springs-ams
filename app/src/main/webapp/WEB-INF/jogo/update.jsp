<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Atualizar Jogo</title>
</head>
<body>
    <h1>Atualizar Jogo</h1>
    <form action="/jogo/update" method="post">
        <input type="hidden" name="id" value="${jogo.id}"/>
        <div class= "form-group">
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" value="${jogo.titulo}"/>
      </div>
      <div class="form-group">  
        <label for="categoria">Categoria:</label>
        <select name="categoria" class="form-select">
            <c:forEach var="c" items="${categorias}">
                <option ${jogo.categoria.id ==c.id ? "selected" : "" value="${c.id}"}>${c.nome}</option>
                   
            </c:forEach>
        </select>
    </div>
<div class="form-group">
        <label for="plataforma">Plataformas:</label><br>
        <c:forEach var="p" items="${plataformas}">
            <div class="custom-control custom-checkbox">
            <input type="checkbox" ${jogo.plataformas.contains(p) ? "checked": ""}
                class="custom-control-input" name="plataformas" value="${p.id}" id="${p.id}"/>
                   
            <label class="custom-control-label" for="${p.id}">${p.nome}</label>    
                </div>
                   </c:forEach>
                </select>
            </div>
       <br/>
        
        <button type="submit" class="btn btn-primary">Atualizar</button>
        <a href="/jogos/list" class="btn btn-primary"> Cancelar</a>
    </form>
</body>
</html>