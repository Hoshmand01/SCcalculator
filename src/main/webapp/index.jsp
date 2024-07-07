<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Calculator</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .calculator {
                width: 200px;
                margin: 100px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
            }
            .calculator input {
                width: 100%;
                height: 40px;
                text-align: right;
                margin-bottom: 10px;
            }
            .calculator button {
                width: 48%;
                height: 40px;
                margin: 1%;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div class="calculator">
            <input type="text" id="display" disabled />
            <br />
            <button onclick="appendNumber(1)">1</button>
            <button onclick="appendNumber(2)">2</button>
            <button onclick="appendNumber(3)">3</button>
            <button onclick="setOperation('+')">+</button>
            <br />
            <button onclick="appendNumber(4)">4</button>
            <button onclick="appendNumber(5)">5</button>
            <button onclick="appendNumber(6)">6</button>
            <button onclick="setOperation('-')">-</button>
            <br />
            <button onclick="appendNumber(7)">7</button>
            <button onclick="appendNumber(8)">8</button>
            <button onclick="appendNumber(9)">9</button>
            <button onclick="setOperation('*')">*</button>
            <br />
            <button onclick="clearDisplay()">C</button>
            <button onclick="appendNumber(0)">0</button>
            <button onclick="calculateResult()">=</button>
            <button onclick="setOperation('/')">/</button>
        </div>
        <script>
            let display = document.getElementById('display');
            let currentOperation = null;
            let currentValue = null;

            function appendNumber(number) {
                if (display.value === '0' || display.value === '') {
                    display.value = number;
                } else {
                    display.value += number;
                }
            }

            function setOperation(operation) {
                currentValue = parseFloat(display.value);
                currentOperation = operation;
                display.value = '';
            }

            function calculateResult() {
                if (currentValue !== null && currentOperation !== null) {
                    let newValue = parseFloat(display.value);
                    switch (currentOperation) {
                        case '+':
                            display.value = currentValue + newValue;
                            break;
                        case '-':
                            display.value = currentValue - newValue;
                            break;
                        case '*':
                            display.value = currentValue * newValue;
                            break;
                        case '/':
                            display.value = currentValue / newValue;
                            break;
                    }
                    currentValue = null;
                    currentOperation = null;
                }
            }

            function clearDisplay() {
                display.value = '';
                currentValue = null;
                currentOperation = null;
            }
        </script>
    </body>
</html>
