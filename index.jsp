<%@ page import="java.net.InetAddress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String hostname = "Unknown";
    String ipAddress = "Unknown";
    try {
        InetAddress localHost = InetAddress.getLocalHost();
        hostname = localHost.getHostName();
        ipAddress = localHost.getHostAddress();
    } catch (Exception e) {
        hostname = "Error retrieving host: " + e.getMessage();
    }
    String tomcatServer = application.getServerInfo();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Server Identity</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background-color: #0f172a;
            color: #f8fafc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #1e293b;
            padding: 2rem 2.5rem;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
            border: 1px solid #334155;
            min-width: 400px;
        }
        h2 {
            margin-top: 0;
            color: #38bdf8;
            border-bottom: 1px solid #334155;
            padding-bottom: 0.75rem;
        }
        .row {
            display: flex;
            justify-content: space-between;
            padding: 0.65rem 0;
            border-bottom: 1px solid #334155;
        }
        .label {
            color: #94a3b8;
            font-weight: 500;
        }
        .value {
            font-family: monospace;
            color: #f1f5f9;
            background: #0f172a;
            padding: 2px 8px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Target Server Status</h2>
        <div class="row">
            <span class="label">Server Hostname:</span>
            <span class="value"><%= hostname %></span>
        </div>
        <div class="row">
            <span class="label">Server IP:</span>
            <span class="value"><%= ipAddress %></span>
        </div>
        <div class="row">
            <span class="label">Tomcat Engine:</span>
            <span class="value"><%= tomcatServer %></span>
        </div>
        <div class="row">
            <span class="label">Deployed Branch:</span>
            <span class="value">${git.branch}</span>
        </div>
        <div class="row">
            <span class="label">Build Identifier:</span>
            <span class="value">${build.id}</span>
        </div>
    </div>
</body>
</html>