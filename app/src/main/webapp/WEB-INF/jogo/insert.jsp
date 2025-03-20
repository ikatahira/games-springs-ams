<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Inserir Jogo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Inserir Jogo</h1>
        <form action="/jogo/insert" method="post">
            <div class="mb-3">
                <label for="titulo" class="form-label">Título:</label>
                <input type="text" id="titulo" name="titulo" class="form-control"/>
            </div>

            <div class="mb-3">
                <label for="categoria" class="form-label">Categoria:</label>
                <select name="categoria" class="form-select" required>
                    <c:forEach var="categoria" items="${categorias}">
                        <option value="${categoria.id}">${categoria.nome}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="plataforma" class="form-label">Plataformas:</label><br>
                <c:forEach var="plataforma" items="${plataformas}">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="plataforma${plataforma.id}" name="plataformas" value="${plataforma.id}">
                        <label class="form-check-label" for="plataforma${plataforma.id}">${plataforma.nome}</label><br>
                    </div>
                </c:forEach>
            </div>
            
            <button type="submit" class="btn btn-primary">Inserir</button>
            <a href="/jogo/list" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
