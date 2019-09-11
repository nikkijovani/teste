<%-- 
    Document   : listar
    Created on : 11/09/2019, 09:03:24
    Author     : aluno
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="br.edu.iff.util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.testando.entidades.*"/>
<jsp:directive.page import="java.util.*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud</title>
    </head>
    <body>
        <h1>Lista dos usuários</h1>
        <%
            Session sessionFe;
            sessionFe = HibernateUtil.getSession();
            Transaction tr = sessionFe.beginTransaction();
            String hql = "from Usuario u";
            List<Usuario> lista = (List)sessionFe.createQuery(hql).list();
            tr.commit();
            //List<Usuario> lista;
            //UsuarioControle.listar();
            request.setAttribute("usuarios", lista );
        %>
        
        <display:table name="usuarios">
            <display:column property="nome" title="Nome completão"/>
        </display:table>
 
    </body>
</html>
