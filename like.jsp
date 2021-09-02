<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    try{
        int pid=Integer.parseInt(request.getParameter("pid").toString());
        String smail = (String) session.getAttribute("sssemail");
         int likes=0;
        
        Connection con=Dbcon.DbConnection.getConnection();
        Statement stes=con.createStatement();
        System.out.println("email============"+smail);
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from timeline where id="+pid+"");
        if(rs.next())
        {
            String cat=rs.getString("cat");
            System.out.println("cat============"+cat);
            ResultSet rses=stes.executeQuery("select likess from recbase where productcat='"+cat+"' and uname='"+smail+"'");
            if(rses.next())
            {
               likes=rses.getInt(1);
               System.out.println("likessss==========="+likes);
                if(likes==0)
                {
                   likes=1; 
                }
                else
                {
                    likes+=1;
                }
                System.out.println("likerrrrr"+likes);
                PreparedStatement pseq=con.prepareStatement("update recbase set likess='"+likes+"' where productcat='"+cat+"' and uname='"+smail+"'");
                int ex=pseq.executeUpdate();
                System.out.println("iiiiiiiiiiii"+ex);
                if(ex>0)
                {
                     response.sendRedirect("uhome.jsp?msg=likes updated");
                }
            else
            {
            PreparedStatement ps=con.prepareStatement("insert into recbase(productcat,uname,likess) values(?,?,?)");
            ps.setString(1, cat);
            ps.setString(2, smail);
            ps.setInt(3, likes);
            int x=ps.executeUpdate();
            if(x>0)
            {
                response.sendRedirect("uhome.jsp?msg=likes added");
            }
            }
            } else
            {
            PreparedStatement ps=con.prepareStatement("insert into recbase(productcat,uname,likess) values(?,?,?)");
            ps.setString(1, cat);
            ps.setString(2, smail);
            ps.setInt(3, likes);
            int x=ps.executeUpdate();
            if(x>0)
            {
                response.sendRedirect("uhome.jsp?msg=likes added");
            }
            }
        }
        
    }catch(Exception e)
    {
        
        e.printStackTrace();
    }
%>

