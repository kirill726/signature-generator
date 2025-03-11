<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Генератор подписи</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .signature-container {
            margin-top: 20px;
            padding: 10px;
            border: 3px solid #ccc; /* Установил рамку жирнее */
            display: inline-block;
            background: #fff;
        }
        .contact-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .contact-list li {
            margin: 4px 0;
        }
        .contact-list a {
            color: #357AF6;
            text-decoration: none;
        }
        .copy-button {
            margin-top: 10px;
            padding: 8px 12px;
            background: #357AF6;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .copy-button:hover {
            background: #285bb5;
        }
        .success-message {
            display: none;
            color: green;
            margin-top: 5px;
        }
    </style>
</head>
<body>

    <h2>Заполните данные</h2>
    <form id="signatureForm">
        <label>Имя: <input type="text" id="name" value="Bona Fides"></label><br><br>
        <label>Должность: <input type="text" id="jobTitle" value="Manager"></label><br><br>
        <label>Телеграм: <input type="text" id="telegram" value="@example_telegram"></label><br><br>
        <label>Скайп (ссылка): <input type="text" id="skypeLink" value="skype:example.skype?call"></label><br><br>
        <label>Отображаемое имя для скайпа: <input type="text" id="skypeText" value="example.skype"></label><br><br>
        <button type="button" onclick="updateSignature()">Обновить подпись</button>
    </form>

    <h2>Превью подписи</h2>
    <div class="signature-container" id="signature">
        <table cellpadding="0" cellspacing="0" style="vertical-align: -webkit-baseline-middle;">
            <tbody>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td>
                                <img src="https://images.uusimmatkasinot.com/logos/fairspin.png?w=1074&auto=compress&auto=format" alt="Fairspin Casino" width="100">
                            </td>
                            <td class="info" style="padding-left: 18px;">
                                <h2 id="sigName" style="text-transform: uppercase; font-size: 15px; font-weight: 900; line-height: 1.3; margin: 0 0 4px; color: black;">Bona Fides</h2>
                                <p id="sigJobTitle" style="text-transform: uppercase; color: #ebbe7d; font-size: 15px; font-weight: 700; line-height: 1.3; margin: 0 0 6px;">Manager</p>
                                <ul class="contact-list">
                                    <li><span style="color: black; font-weight: 700; font-size: 16px;">w: </span>
                                        <a href="https://fairspin.io">https://fairspin.io</a>
                                    </li>
                                    <li><span style="color: black; font-weight: 700; font-size: 16px;">t: </span>
                                        <span id="sigTelegram">@example_telegram</span>
                                    </li>
                                    <li><span style="color: black; font-weight: 700; font-size: 16px;">s: </span>
                                        <a id="sigSkype" href="skype:example.skype?call">example.skype</a>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- Кнопка для копирования HTML кода подписи для вставки в почту -->
    <button class="copy-button" onclick="copySignature()">Скопировать HTML код для вставки в подпись на почте</button>
    <p class="success-message" id="successMessage">Код успешно скопирован!</p>

    <!-- Кнопка для копирования визуальной подписи -->
    <button class="copy-button" onclick="copyVisualSignature()">Скопировать визуальную подпись</button>
    <p class="success-message" id="visualSuccessMessage">Визуальная подпись успешно скопирована!</p>

    <script>
        function updateSignature() {
            document.getElementById("sigName").textContent = document.getElementById("name").value;
            document.getElementById("sigJobTitle").textContent = document.getElementById("jobTitle").value;
            document.getElementById("sigTelegram").textContent = document.getElementById("telegram").value;
            document.getElementById("sigSkype").textContent = document.getElementById("skypeText").value;
            document.getElementById("sigSkype").href = document.getElementById("skypeLink").value;
        }

        // Функция для копирования HTML кода подписи
        function copySignature() {
            const signatureHTML = document.getElementById("signature").innerHTML;
            const textarea = document.createElement("textarea");
            textarea.value = signatureHTML;
            document.body.appendChild(textarea);
            textarea.select();
            document.execCommand("copy");
            document.body.removeChild(textarea);

            const successMessage = document.getElementById("successMessage");
            successMessage.style.display = "block";
            setTimeout(() => { successMessage.style.display = "none"; }, 2000);
        }

        // Функция для копирования визуальной подписи (картинка + текст)
        function copyVisualSignature() {
            const signatureVisual = document.getElementById("signature").cloneNode(true);
            const tempDiv = document.createElement("div");
            tempDiv.appendChild(signatureVisual);
            document.body.appendChild(tempDiv);

            // Создаем и копируем в буфер данные
            const range = document.createRange();
            range.selectNodeContents(tempDiv);
            const selection = window.getSelection();
            selection.removeAllRanges();
            selection.addRange(range);
            document.execCommand("copy");

            document.body.removeChild(tempDiv);

            const successMessage = document.getElementById("visualSuccessMessage");
            successMessage.style.display = "block";
            setTimeout(() => { successMessage.style.display = "none"; }, 2000);
        }
    </script>

</body>
</html>
