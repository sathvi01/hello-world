<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple Calculator</title>
</head>
<body>
    <h1>Simple Calculator</h1>
    
    <form action="" method="post">
        <label for="num1">Number 1:</label>
        <input type="number" name="num1" id="num1" required><br>
        
        <label for="num2">Number 2:</label>
        <input type="number" name="num2" id="num2" required><br>
        
        <label for="operation">Select Operation:</label>
        <select name="operation" id="operation">
            <option value="add">Addition (+)</option>
            <option value="subtract">Subtraction (-)</option>
            <option value="multiply">Multiplication (*)</option>
            <option value="divide">Division (/)</option>
        </select><br>
        
        <input type="submit" value="Calculate">
    </form>

    <%
        // Get input values from the form
        String num1Str = request.getParameter("num1");
        String num2Str = request.getParameter("num2");
        String operation = request.getParameter("operation");

        // Check if both input values are present
        if (num1Str != null && num2Str != null) {
            try {
                // Parse input values as doubles
                double num1 = Double.parseDouble(num1Str);
                double num2 = Double.parseDouble(num2Str);
                double result = 0.0;

                // Perform the selected operation
                if ("add".equals(operation)) {
                    result = num1 + num2;
                } else if ("subtract".equals(operation)) {
                    result = num1 - num2;
                } else if ("multiply".equals(operation)) {
                    result = num1 * num2;
                } else if ("divide".equals(operation)) {
                    if (num2 != 0) {
                        result = num1 / num2;
                    } else {
                        out.println("<p>Division by zero is not allowed.</p>");
                    }
                }

                // Display the result
                out.println("<p>Result: " + result + "</p>");
            } catch (NumberFormatException e) {
                out.println("<p>Invalid input. Please enter valid numbers.</p>");
            }
        }
    %>

</body>
</html>
