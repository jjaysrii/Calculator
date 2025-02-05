<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .calculator {
            width: 300px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 100%;
            height: 50px;
            text-align: right;
            font-size: 24px;
            margin-bottom: 10px;
            padding-right: 10px;
            border: none;
            outline: none;
            background: #e6e6e6;
        }
        .buttons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        button {
            width: 100%;
            height: 50px;
            font-size: 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.2s;
        }
        button:active {
            transform: scale(0.95);
        }
        .operator {
            background: orange;
            color: white;
        }
        .clear {
            background: red;
            color: white;
        }
        .equal {
            background: green;
            color: white;
        }
    </style>
</head>
<body>

    <div class="calculator">
        <div class="title">Simple Calculator</div>
        <input type="text" id="display" disabled>
        <div class="buttons">
            <button onclick="appendNumber('7')">7</button>
            <button onclick="appendNumber('8')">8</button>
            <button onclick="appendNumber('9')">9</button>
            <button class="operator" onclick="appendOperator('/')">/</button>

            <button onclick="appendNumber('4')">4</button>
            <button onclick="appendNumber('5')">5</button>
            <button onclick="appendNumber('6')">6</button>
            <button class="operator" onclick="appendOperator('*')">*</button>

            <button onclick="appendNumber('1')">1</button>
            <button onclick="appendNumber('2')">2</button>
            <button onclick="appendNumber('3')">3</button>
            <button class="operator" onclick="appendOperator('-')">-</button>

            <button onclick="appendNumber('0')">0</button>
            <button class="equal" onclick="calculate()">=</button>
            <button class="clear" onclick="clearDisplay()">C</button>
            <button class="operator" onclick="appendOperator('+')">+</button>
        </div>
    </div>

    <script>
        let display = document.getElementById("display");

        function appendNumber(number) {
            display.value += number;
        }

        function appendOperator(operator) {
            if (display.value.length === 0) return; // Prevent operator at start
            let lastChar = display.value.slice(-1);
            if ("+-*/".includes(lastChar)) return; // Prevent duplicate operators
            display.value += operator;
        }

        function clearDisplay() {
            display.value = "";
        }

        function calculate() {
            try {
                display.value = eval(display.value); // Calculate result
            } catch {
                display.value = "Error"; // Handle invalid expressions
            }
        }
    </script>

</body>
</html>
