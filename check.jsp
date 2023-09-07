<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(to top, #209cff 100%, #68e0cf 200%);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        button {
            border: 0;
            outline: 0;
        }

        .container {
            margin: 40px 0;
            width: 400px;
            height: 600px;
            padding: 10px 25px;
            background: #0a0e31;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.45), 0 4px 8px rgba(0, 0, 0, 0.35), 0 8px 12px rgba(0, 0, 0, 0.15);
            font-family: "Montserrat";
        }
        .container h2.title {
            font-size: 1.75rem;
            margin: 10px -5px;
            margin-bottom: 30px;
            color: #fff;
        }

        .result {
            position: relative;
            width: 100%;
            height: 65px;
            overflow: hidden;
        }
        .result__info {
            position: absolute;
            bottom: 4px;
            color: #fff;
            font-size: 0.8rem;
            transition: all 150ms ease-in-out;
            transform: translateY(200%);
            opacity: 0;
        }
        .result__info.right {
            right: 8px;
        }
        .result__info.left {
            left: 8px;
        }
        
        .just{
            justify-content: center;
            text-align: center;
            color: whitesmoke;
        }
        .result__viewbox {
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 8px;
            color: #fff;
            text-align: center;
            line-height: 65px;
        }
        .result #copy-btn {
            position: absolute;
            top: var(--y);
            left: var(--x);
            width: 38px;
            height: 38px;
            background: #fff;
            border-radius: 50%;
            opacity: 0;
            transform: translate(-50%, -50%) scale(0);
            transition: all 350ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
            cursor: pointer;
            z-index: 2;
        }
        .result #copy-btn:active {
            box-shadow: 0 0 0 200px rgba(255, 255, 255, 0.08);
        }
        .result:hover #copy-btn {
            opacity: 1;
            transform: translate(-50%, -50%) scale(1.35);
        }
        .f10{
            font-size: 15px;
        }
        .field-title {
            position: absolute;
            top: -10px;
            left: 8px;
            transform: translateY(-50%);
            font-weight: 800;
            color: rgba(255, 255, 255, 0.5);
            text-transform: uppercase;
            font-size: 0.65rem;
            pointer-events: none;
            user-select: none;
        }

        .options {
            width: 100%;
            height: auto;
            margin: 50px 0;
        }

        .range__slider {
            position: relative;
            width: 100%;
            height: calc(65px - 10px);
            display: flex;
            justify-content: center;
            align-items: center;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 8px;
            margin: 30px 0;
        }
        .range__slider::before, .range__slider::after {
            position: absolute;
            color: #fff;
            font-size: 0.9rem;
            font-weight: bold;
        }
        .range__slider::before {
            content: attr(data-min);
            left: 10px;
        }
        .range__slider::after {
            content: attr(data-max);
            right: 10px;
        }
        .range__slider .length__title::after {
            content: attr(data-length);
            position: absolute;
            right: -16px;
            font-variant-numeric: tabular-nums;
            color: #fff;
        }

        #slider {
            -webkit-appearance: none;
            width: calc(100% - (70px));
            height: 2px;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.314);
            outline: none;
            padding: 0;
            margin: 0;
            cursor: pointer;
        }
        #slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: white;
            cursor: pointer;
            transition: all 0.15s ease-in-out;
        }
        #slider::-webkit-slider-thumb:hover {
            background: #d4d4d4;
            transform: scale(1.2);
        }
        #slider::-moz-range-thumb {
            width: 20px;
            height: 20px;
            border: 0;
            border-radius: 50%;
            background: white;
            cursor: pointer;
            transition: background 0.15s ease-in-out;
        }
        #slider::-moz-range-thumb:hover {
            background: #d4d4d4;
        }

        .settings {
            position: relative;
            height: auto;
            widows: 100%;
            display: flex;
            flex-direction: column;
        }
        .settings .setting {
            position: relative;
            width: 100%;
            height: calc(65px - 10px);
            background: rgba(255, 255, 255, 0.08);
            border-radius: 8px;
            display: flex;
            align-items: center;
            padding: 10px 25px;
            color: #fff;
            margin-bottom: 8px;
        }
        .settings .setting input {
            opacity: 0;
            position: absolute;
        }
        .settings .setting input + label {
            user-select: none;
        }
        .settings .setting input + label::before, .settings .setting input + label::after {
            content: "";
            position: absolute;
            transition: 150ms cubic-bezier(0.24, 0, 0.5, 1);
            transform: translateY(-50%);
            top: 50%;
            right: 10px;
            cursor: pointer;
        }
        .settings .setting input + label::before {
            height: 30px;
            width: 50px;
            border-radius: 30px;
            background: rgba(214, 214, 214, 0.434);
        }
        .settings .setting input + label::after {
            height: 24px;
            width: 24px;
            border-radius: 60px;
            right: 32px;
            background: #fff;
        }
        .settings .setting input:checked + label:before {
            background: #5d68e2;
            transition: all 150ms cubic-bezier(0, 0, 0, 0.1);
        }
        .settings .setting input:checked + label:after {
            right: 14px;
        }
        .settings .setting input:focus + label:before {
            box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.75);
        }
        .settings .setting input:disabled + label:before, .settings .setting input:disabled + label:after {
            cursor: not-allowed;
        }
        .settings .setting input:disabled + label:before {
            background: #4f4f6a;
        }
        .settings .setting input:disabled + label:after {
            background: #909090;
        }

        .btn.generate {
            user-select: none;
            position: relative;
            width: 100%;
            height: 50px;
            margin: 10px 0;
            border-radius: 8px;
            color: #fff;
            border: none;
            background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            letter-spacing: 1px;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 150ms ease;
        }
        #generate{
              user-select: none;
            position: relative;
            width: 100%;
            height: 50px;
            margin: 10px 0;
            border-radius: 8px;
            color: #fff;
            border: none;
            background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            letter-spacing: 1px;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 150ms ease;
        }
        .btn.generate:active {
            transform: translateY(-3%);
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.08);
        }

        .support {
            position: fixed;
            right: 10px;
            bottom: 10px;
            padding: 10px;
            display: flex;
        }

        a {
            margin: 0 20px;
            color: #fff;
            font-size: 2rem;
            transition: all 400ms ease;
        }

        a:hover {
            color: #222;
        }

        .github-corner svg {
            position: absolute;
            right: 0;
            top: 0;
            mix-blend-mode: darken;
            color: #eeeeee;
            fill: #353535;
            clip-path: polygon(0 0, 100% 0, 100% 100%);
        }

        .github-corner:hover .octo-arm {
            animation: octocat-wave 0.56s;
        }

        @keyframes octocat-wave {
            0%, 100% {
                transform: rotate(0);
            }
            20%, 60% {
                transform: rotate(-20deg);
            }
            40%, 80% {
                transform: rotate(10deg);
            }
        }
    </style>
    <body>
        <form action="checker" method="get">
            <div class="container">
                <h2 class="title">Password Generator</h2>
                <div class="result">

                    <input type="text" name="userpwd" class="result__viewbox"> 
                       

                                     

                </div>

                    <button type="submit" class="btn generate" id="generate">Check Password</button>

                 
                    <button type="button" class="btn generate"id="generate" ><a href="index.jsp" class="f10">Generate password</a></button>
                                
                                <!--<p class="just">In today's digital landscape, ensuring the security of sensitive information is paramount. A fundamental aspect of this security is the generation of strong, unique passwords. This abstract introduces a Secure Password Generator implemented in Java, designed to assist users and applications in generating robust and unpredictable passwords.</p>-->

            </div>

        </form>

        <script>

            console.clear();

            const sliderProps = {
                fill: "red",
                background: "rgba(255, 255, 255, 0.214)",
            };

// Selecting the Range Slider container which will effect the LENGTH property of the password.
            const slider = document.querySelector(".range__slider");

// Text which will show the value of the range slider.
            const sliderValue = document.querySelector(".length__title");

// Using Event Listener to apply the fill and also change the value of the text.
            slider.querySelector("input").addEventListener("input", event => {
                sliderValue.setAttribute("data-length", event.target.value);
                applyFill(event.target);
            });
// Selecting the range input and passing it in the applyFill func.
            applyFill(slider.querySelector("input"));
// This function is responsible to create the trailing color and setting the fill.
            function applyFill(slider) {
                const percentage = (100 * (slider.value - slider.min)) / (slider.max - slider.min);
                const bg = `linear-gradient(90deg, ${sliderProps.fill} ${percentage}%, ${sliderProps.background} ${percentage +
                                                 0.1}%)`;
                slider.style.background = bg;
                sliderValue.setAttribute("data-length", slider.value);
            }





        </script>

    </body>
</html>
