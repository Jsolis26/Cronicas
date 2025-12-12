<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>TCG Companion App</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>

  <h1>TCG Companion</h1>

  <!-- VIDA -->
  <section class="panel">
    <h2>Vida del Jugador</h2>
    <div class="value" id="life">30</div>
    <button onclick="changeLife(-1)">-1</button>
    <button onclick="changeLife(1)">+1</button>
    <button onclick="changeLife(-5)">-5</button>
    <button onclick="changeLife(5)">+5</button>
  </section>

  <!-- MANÁ -->
  <section class="panel">
    <h2>Maná</h2>
    <div class="value">
      <span id="currentMana">1</span> /
      <span id="maxMana">1</span>
    </div>
    <button onclick="useMana(1)">Usar 1</button>
    <button onclick="addTempMana(1)">+1 temporal</button>
    <button onclick="nextTurn()">Siguiente turno</button>
  </section>

  <!-- LOG -->
  <section class="panel">
    <h2>Registro</h2>
    <ul id="log"></ul>
  </section>

  <script src="app.js"></script>
</body>
</html>

body {
  font-family: Arial, sans-serif;
  background: #121212;
  color: #fff;
  padding: 20px;
}

.panel {
  background: #1e1e1e;
  padding: 15px;
  margin-bottom: 20px;
  border-radius: 8px;
}

.value {
  font-size: 2em;
  margin: 10px 0;
}

button {
  margin: 5px;
  padding: 8px 12px;
  font-size: 14px;
  cursor: pointer;
}


// VIDA
let life = 30;

// MANÁ
let maxMana = 1;
let currentMana = 1;

// LOG
const log = document.getElementById("log");

function updateUI() {
  document.getElementById("life").innerText = life;
  document.getElementById("maxMana").innerText = maxMana;
  document.getElementById("currentMana").innerText = currentMana;
}

function logEvent(text) {
  const li = document.createElement("li");
  li.innerText = text;
  log.prepend(li);
}

// VIDA
function changeLife(amount) {
  life += amount;
  logEvent(`Vida ${amount > 0 ? "+" : ""}${amount}`);
  updateUI();

  if (life <= 0) {
    alert("Jugador derrotado");
  }
}

// MANÁ
function nextTurn() {
  if (maxMana < 8) maxMana++;
  currentMana = maxMana;
  logEvent("Nuevo turno: maná restaurado");
  updateUI();
}

function useMana(amount) {
  if (currentMana >= amount) {
    currentMana -= amount;
    logEvent(`Usa ${amount} maná`);
  } else {
    alert("Maná insuficiente");
  }
  updateUI();
}

function addTempMana(amount) {
  currentMana += amount;
  logEvent(`Maná temporal +${amount}`);
  updateUI();
}

// Inicial
updateUI();
