<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64"%>
<%@ page import="com.Rental.ConnectionDb"%>
<%@ page import="com.Rental.Email"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1em;
        }

        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 0 auto 20px;
            overflow: hidden;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-info {
            text-align: justify;
            margin-left: 100px;
        }

        h1, h2 {
            color: #333;
        }

        p {
            color: #666;
            line-height: 1.6;
        }

        button {
            width: 99px;
            height: 40px;
            border-radius: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to the Profile Page</h1>
    </header>

    <%
        String email = Email.getEmail();
        Connection con = ConnectionDb.connect();

        PreparedStatement pstmt = con.prepareStatement("select * from admininfo where email=?");
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            byte[] imageData = rs.getBytes("file");
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
    %>

    <div class="profile-container">
        <div class="profile-image">
            <img src="data:image/jpeg;base64, <%=base64Image%>" alt="Profile Image">
        </div>

        <div class="profile-info">
            <h3>Name: <%=rs.getString("name")%></h3>
            <h3>Mobile: <%=rs.getString("mobile")%></h3>
            <h3>Location: <%=rs.getString("location")%></h3>
            <h3>City: <%=rs.getString("city")%></h3>
            <h3>Taluka: <%=rs.getString("taluka")%></h3>
            <h2></h2>
            <a href="index2.jsp">
                <button>Back</button>
            </a>
        </div>
    </div>

    <%
            } else {
                out.println("Image Data is null.");
            }
        }
        con.close(); // Close the database connection
    %>
<script src="language.js"></script>
	<script type="text/javascript"
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<div id="google_translate_element"></div>
</body>
</html>